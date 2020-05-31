package com.sswang.service.impl;

import com.sswang.entity.Blog;
import com.sswang.entity.Label;
import com.sswang.entity.Sort;
import com.sswang.entity.SortCounts;
import com.sswang.mapper.index.IndexMapper;
import com.sswang.service.IndexService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class IndexServiceImpl implements IndexService {

    @Resource
    IndexMapper indexMapper;

    @Override
    public List<Blog> findAllLimitById(List<Integer> ids) {
        return indexMapper.findAllLimitById(ids);
    }

    @Override
    public List<Label> finaAllLabel() {
        return indexMapper.findAllLabel();
    }

    @Override
    public List<Sort> findAllSort() {
        return indexMapper.findAllSort();
    }

    @Override
    public List<SortCounts> findSortCounts() {
        return indexMapper.findSortCounts();
    }

    @Override
    public List<Blog> findRecommendBlog() {
        return indexMapper.findRecommendBlog();
    }
}
