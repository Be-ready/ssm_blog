package com.sswang.entity;

import java.util.List;

/**
 * 用于查询指定id段的blog(在xml中使用foreach)
 */
public class ListForBlog {

    List<Integer> ids;

    public List<Integer> getIds() {
        return ids;
    }

    public void setIds(List<Integer> ids) {
        this.ids = ids;
    }
}
