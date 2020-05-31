package com.sswang.service;

import com.sswang.entity.Blog;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface IBlogService {

    // 保存博文
    void save(Blog blog);

    Blog findOneById(Integer blogId);

    // 获取blog表的记录总数
    int findAllNum();

    // 更新
    void updateBlog(Blog blog);

    // 用于分页
    HashMap<String, Object> findByPage(int startPage, int size);
}
