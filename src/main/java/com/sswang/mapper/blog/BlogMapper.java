package com.sswang.mapper.blog;

import com.sswang.entity.Blog;
import com.sswang.entity.BlogNum;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public interface BlogMapper {

    void save(Blog blog);

    Blog findOneById(Integer blogId);

    void updateBlog(Blog blog);

    BlogNum findAllNum();

    // map包含：Integer startPage, Integer size
    List<Blog> findByPage(HashMap<String, Object> map);
}
