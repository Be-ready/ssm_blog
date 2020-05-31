package com.sswang.service.impl;

import com.sswang.entity.Blog;
import com.sswang.entity.BlogNum;
import com.sswang.mapper.blog.BlogMapper;
import com.sswang.mapper.index.IndexMapper;
import com.sswang.service.IBlogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BlogServiceImpl implements IBlogService {

    @Resource
    BlogMapper blogMapper;

    @Override
    public Blog findOneById(Integer blogId) {
        return blogMapper.findOneById(blogId);
    }

    @Override
    public void save(Blog blog) {
        blogMapper.save(blog);
    }

    @Override
    public void updateBlog(Blog blog) {
        blogMapper.updateBlog(blog);
    }

    @Override
    public int findAllNum() {
        BlogNum blogNum = blogMapper.findAllNum();
        return blogNum.getCounts();
    }

    /**
     *
     * @param currPage 当前页（从0开始）
     * @param size 每页数据个数
     * @return map:
     *             totalNum 博文总数
     *             currPage 当前页
     *             size 每页数据个数
     *             blogs 博文信息
     *             totalPage 总页数
     */
    @Override
    public HashMap<String, Object> findByPage(int currPage, int size) {
        HashMap<String, Object> map = new HashMap<>();
        System.out.println("Service层的currPage："+currPage);
        map.put("currPage", currPage);
        map.put("size", size);
        List<Blog> blogs = blogMapper.findByPage(map);

        int totalNum = findAllNum(); // 获得记录总数
        map.put("blogCounts", totalNum);
        int totalPage = (int)Math.ceil((double)totalNum/size);  // 总页数
        map.put("blogs",blogs);
        map.put("totalPage", totalPage);
        return map;
    }
}
