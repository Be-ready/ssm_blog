package com.sswang.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sswang.entity.*;
import com.sswang.service.IBlogService;
import com.sswang.service.IUserService;
import com.sswang.service.IndexService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/user")
public class controller {

    @RequestMapping("/index.do")
    public String doIndex(HttpSession session){
//        session.setAttribute("pageTag", 1);
        return "forward:/index.jsp";
    }


    @RequestMapping("/toLogin.do")
    public String toLogin(){
        return "login";
    }

    @RequestMapping("/toRegister.do")
    public String toRegister(){
        return "register";
    }

    @RequestMapping("/toBlog.do")
    public ModelAndView toBlog(Integer blogId){

        ModelAndView mv = new ModelAndView();
        Blog blog = iBlogService.findOneById(blogId);
        // 浏览次数+1
        blog.setBlogViews(blog.getBlogViews()+1);
        // 更新数据库
        iBlogService.updateBlog(blog);
//        System.out.println(blog);
        mv.addObject("blog", blog);
        mv.setViewName("blog");
        return mv;
    }

    /**
     * 实现跳转到编写博客页面功能
     * @param session 获取session中的登录用户
     */
    @RequestMapping("/toEditBlog.do")
    public ModelAndView doEditBlog(HttpSession session){

        ModelAndView mv = new ModelAndView();
        // 判断是否已登录
        if(session.getAttribute("loginUser") != null){
            // 已登录，转到编写博客页面
            mv.setViewName("editBlog");

        }else {
            mv.addObject("toEditMsg", "编写博客之前请先登录！");
            mv.setViewName("login");
        }

        return mv;
    }

    @Autowired
    IBlogService iBlogService;

    @RequestMapping("/editBlog.do")
    public ModelAndView doEditBlog(MultipartFile pic,
                                   HttpServletRequest request,
                                   HttpSession session,
                                   Blog blog) throws Exception {
        // 将前端传入的图片存入本地
        String path = request.getSession().getServletContext().getRealPath(File.separator+"uploads"+File.separator);
        File file = new File(path);
        if(!file.exists()){
            file.mkdirs();
        }
        String filename = UUID.randomUUID().toString().replace("-","") + pic.getOriginalFilename();

        blog.setBlogImage(filename);  // 将图片名存入

        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:dd");
        blog.setBlogCreateDate(sdf.format(date));  // 将创建时间存入

        blog.setUser(session.getAttribute("loginUser").toString());  //将用户名存入

        blog.setBlogCommentCount(0);  // 评论数（首次创建时，该值为0）
        blog.setBlogViews(0);  // 浏览数（首次创建时，该值为0）
//        System.out.println(blog);
        iBlogService.save(blog);
        pic.transferTo(new File(path,filename));  // blog存入数据库后再图片上传

        ModelAndView mv = new ModelAndView();

        mv.setViewName("editBlogSuccess");
        return mv;
    }

    @Autowired
    IUserService iUserService;

    /**
     * 实现注册功能
     * @param userPhoto 用户上传的头像
     * @param request
     * @param user 接收用户提交的信息
     * @throws IOException
     */
    @RequestMapping("/register.do")
//    @ResponseBody
    public ModelAndView doRegister(@RequestParam("userPhoto")MultipartFile userPhoto,
                                   HttpServletRequest request,
                                   User user) throws IOException {

//        user.setUserProfilePhoto();
        // 设置用户创建时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String createTime = sdf.format(new Date());
//        System.out.println(createTime); // 打印显示
        user.setUserRegistrationTime(createTime);

        // 将用户上传的图片存到当前项目的uploads目录下，并记录其存入的名称
        String path = request.getSession().getServletContext().getRealPath(File.separator+"uploads"+File.separator);
        File file = new File(path);
        if(!file.exists()){
            file.mkdirs();
        }
        String filename = UUID.randomUUID().toString().replace("-","")+userPhoto.getOriginalFilename();
        user.setUserProfilePhoto(filename);  // 将更改后的名字存入User;
//        System.out.println(user);  // 打印

        iUserService.save(user); // 保存到mysql数据库

        userPhoto.transferTo(new File(path,filename));  // 上传

        ModelAndView mv = new ModelAndView();
        mv.setViewName("registerSuccess");
        return mv;
    }

    /**
     * 实现用户登录功能
     * @param username  用户名
     * @param password  密码
     * @param session  将用户名存入session
     * @return
     */
    @RequestMapping("/login.do")
    public ModelAndView doLogin(@RequestParam("username")String username,
                                @RequestParam("password")String password,
                                HttpSession session){
        ModelAndView mv = new ModelAndView();
        int re = iUserService.findByNameAndPwd(username,password);
        if(re==1){
            session.setAttribute("loginUser", username);

            mv.setViewName("redirect:/index.jsp");
        }else {
            mv.addObject("msg", "用户名或密码错误！");
            mv.setViewName("login");
        }

        return mv;
    }

    /**
     * 退出登录（清除session中的loginUser）
     * @return
     */
    @RequestMapping("/logout.do")
    public String doLogout(HttpSession session){
        if(session.getAttribute("currPage")!=null){
            session.removeAttribute("currPage");
        }
        session.removeAttribute("loginUser");
        return "forward:/index.jsp";
    }

    @Autowired
    IndexService indexService;
    @RequestMapping("/indexShowLabel.do")
    @ResponseBody
    public List<Label> doIndexShowLabel(){

        return indexService.finaAllLabel();
    }

    /**
     * 首页展示分类及各分类对应的博文数量
     * @return
     */
    @RequestMapping("/indexShowSort.do")
    @ResponseBody
    public List<SortCounts> doIndexShowSort(){

        return indexService.findSortCounts();
    }

    /**
     * 热门推荐（按浏览量排序，取前5个）
     * @return
     */
    @RequestMapping("/indexShowRecommend.do")
    @ResponseBody
    public List<Blog> doIndexShowRecommend(){

        return indexService.findRecommendBlog();
    }
    /**
     * 首页显示5条blog
     * 首页话/indexShowBlog.do?id=1
     * 分页显示的话/indexShowBlog.do?id=
     * @param id  该参数是url提供的
     * @return
     */
    @RequestMapping("/indexShowBlog.do")
    @ResponseBody
    public List<Blog> doIndexShowBlog(Integer id){
        ListForBlog list = new ListForBlog();
        List<Integer> ids = new ArrayList<>();
        for(int i=(id-1)*5+1;i<=id*5;i++){
            ids.add(i);
        }
        list.setIds(ids);
        return indexService.findAllLimitById(ids);
    }

    /**
     *
     * @param currPage  url路径得到
     * @return map: currPage:
     *              size:
 *                  blogs: List<Blog>
*                   totalPage
     */
    @RequestMapping("/indexShowBlog2.do")
    @ResponseBody
    public Object doIndexShowBlog2(int currPage, HttpSession session){

        System.out.println("Controller层的currPage:"+currPage);
        if(session.getAttribute("currPage") !=null ){
            int sessionCurrPage = (int)session.getAttribute("currPage");
            if(sessionCurrPage < 0){
//                System.out.println("删除");
                session.setAttribute("currPage", 0);
            }
        }
        int size = 5;  // 每页显示5条记录
        HashMap<String,Object> map = iBlogService.findByPage(currPage*size, size);
        session.setAttribute("size", size);
        session.setAttribute("blogCounts", map.get("blogCounts"));  // blog数据总数
        session.setAttribute("currPage", (int)currPage);
        session.setAttribute("totalPage", (int)map.get("totalPage"));
//        System.out.println(session.getAttribute("totalPage"));
        return map;

    }


// =======================================================================
//    ajax请求的测试处理器（）
    @RequestMapping("/indexShow2.do")
    @ResponseBody
    public List<Sort> doIndexShow2(){

        return indexService.findAllSort();
    }
    @RequestMapping("/indexShow3.do")
    public String doIndexShow3(){

        return "test";
    }

    /**
     * 测试编写博客页面的添加标签功能
     * 接收前台传入的多个具有相同name的input
     * @return
     */
    @RequestMapping("/test2.do")
    public void dotest2(String label ){
        System.out.println(label); // 输出值：22,22,22
    }

//    @RequestMapping("/test3.do")
//    public void doTest3(){
////        Blog blog = indexService.findAllLimitById(1);  // 单个id(#{id}*2)
////        System.out.println(blog);
//    }

    @RequestMapping("/test3.do")
    public void doTest3(){

        ListForBlog list = new ListForBlog();
        List<Integer> ids = new ArrayList<>();
        for(int i=1;i<6;i++){
            ids.add(i);
        }
        list.setIds(ids);
        List<Blog> blogs = indexService.findAllLimitById(ids);  // id集合（[1,2,3,4]）
        System.out.println(blogs);
    }
// =======================================================================

}
