package com.sswang.mapper.index;

import com.sswang.entity.Blog;
import com.sswang.entity.Label;
import com.sswang.entity.Sort;
import com.sswang.entity.SortCounts;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 *   1、首页数据显示：（IndexService）
 *       博文部分
 *           博文标题，博文第一段内容，博文图片（一张），博文作者头像，发布时间，浏览量，标签类型（1-2个）
 *       标签部分
 *           标签名，属于该标签的博文总数
 *       分类部分
 *           分类名，属于该分类的博文总数
 *       最新推荐|最热推荐
 *           博文标题
 */
@Repository
public interface IndexMapper {

    // 博文部分
    List<Blog> findAllLimitById(@Param("ids") List<Integer> ids);  // 一次性查出{(id-1)*5+1 -- id*5}个博文
                                              // 首页（id=1）是0-5
    // 标签部分,查出所有标签及其对应的博文数量
    List<Label> findAllLabel();

    // 分类部分
    List<Sort> findAllSort();
    // 从blog表中查出所有分类及其对应的博文数量
    List<SortCounts> findSortCounts();
    // 推荐部分
    List<Blog> findRecommendBlog();
}
