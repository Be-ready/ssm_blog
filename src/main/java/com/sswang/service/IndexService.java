package com.sswang.service;

import com.sswang.entity.Blog;
import com.sswang.entity.Label;
import com.sswang.entity.Sort;
import com.sswang.entity.SortCounts;

import java.util.List;

public interface IndexService {


    // 按id查找博文
//    Blog findAllLimitById(Integer id);
    List<Blog> findAllLimitById(List<Integer> ids);
    // 查询所有标签
    List<Label> finaAllLabel();
    // 查询所有分类
    List<Sort> findAllSort();

    // 从blog表中查出所有分类以及其对应的博文个数
    List<SortCounts> findSortCounts();

    List<Blog> findRecommendBlog();
}
