package com.sswang.entity;

/*
 标签的实体类
 */
public class Sort {

    private Integer sortId;
    private String sortName;
    private String sortDescribe;

    @Override
    public String toString() {
        return "Sort{" +
                "sortId=" + sortId +
                ", sortName='" + sortName + '\'' +
                ", sortDescribe='" + sortDescribe + '\'' +
                '}';
    }

    public Integer getSortId() {
        return sortId;
    }

    public void setSortId(Integer sortId) {
        this.sortId = sortId;
    }

    public String getSortName() {
        return sortName;
    }

    public void setSortName(String sortName) {
        this.sortName = sortName;
    }

    public String getSortDescribe() {
        return sortDescribe;
    }

    public void setSortDescribe(String sortDescribe) {
        this.sortDescribe = sortDescribe;
    }
}
