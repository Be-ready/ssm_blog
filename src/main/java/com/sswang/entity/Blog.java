package com.sswang.entity;

public class Blog {

    private Integer blogId;
    private String userName;
    private String label;
    private String sorts;  //分类：多个分类使用;分隔
    private String blogTitle;
    private String blogContent;
    private String blogImage;
    private Integer blogViews;
    private Integer blogCommentCount;
    private String blogCreateDate;

    @Override
    public String toString() {
        return "Blog{" +
                "blogId=" + blogId +
                ", userName=" + userName +
                ", label=" + label +
                ", sorts=" + sorts +
                ", blogTitle='" + blogTitle + '\'' +
                ", blogContent='" + blogContent + '\'' +
                ", blogImage='" + blogImage + '\'' +
                ", blogViews=" + blogViews +
                ", blogCommentCount=" + blogCommentCount +
                ", blogCreateDate='" + blogCreateDate + '\'' +
                '}';
    }

    public Integer getBlogId() {
        return blogId;
    }

    public void setBlogId(Integer blogId) {
        this.blogId = blogId;
    }

    public String getUser() {
        return userName;
    }

    public void setUser(String userName) {
        this.userName = userName;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public String getSorts() {
        return sorts;
    }

    public void setSorts(String sorts) {
        this.sorts = sorts;
    }

    public String getBlogTitle() {
        return blogTitle;
    }

    public void setBlogTitle(String blogTitle) {
        this.blogTitle = blogTitle;
    }

    public String getBlogContent() {
        return blogContent;
    }

    public void setBlogContent(String blogContent) {
        this.blogContent = blogContent;
    }

    public String getBlogImage() {
        return blogImage;
    }

    public void setBlogImage(String blogImage) {
        this.blogImage = blogImage;
    }

    public Integer getBlogViews() {
        return blogViews;
    }

    public void setBlogViews(Integer blogViews) {
        this.blogViews = blogViews;
    }

    public Integer getBlogCommentCount() {
        return blogCommentCount;
    }

    public void setBlogCommentCount(Integer blogCommentCount) {
        this.blogCommentCount = blogCommentCount;
    }

    public String getBlogCreateDate() {
        return blogCreateDate;
    }

    public void setBlogCreateDate(String blogCreateDate) {
        this.blogCreateDate = blogCreateDate;
    }
}
