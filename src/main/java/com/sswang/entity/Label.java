package com.sswang.entity;

/*
 标签的实体类
 */
public class Label {

    private Integer labelId;
    private String labelName;
    private String labelDescribe;

    @Override
    public String toString() {
        return "Label{" +
                "labelId=" + labelId +
                ", labelName='" + labelName + '\'' +
                ", labelDescribe='" + labelDescribe + '\'' +
                '}';
    }

    public Integer getLabelId() {
        return labelId;
    }

    public void setLabelId(Integer labelId) {
        this.labelId = labelId;
    }

    public String getLabelName() {
        return labelName;
    }

    public void setLabelName(String labelName) {
        this.labelName = labelName;
    }

    public String getLabelDescribe() {
        return labelDescribe;
    }

    public void setLabelDescribe(String labelDescribe) {
        this.labelDescribe = labelDescribe;
    }
}
