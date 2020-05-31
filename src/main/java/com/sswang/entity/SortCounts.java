package com.sswang.entity;

/**
 * 用于查询sort（分类），各分类对应的博文个数
 */
public class SortCounts {

    private String sorts; // 分类名
    private Integer counts;  // 该分类的博文个数

    @Override
    public String toString() {
        return "SortCounts{" +
                "sorts='" + sorts + '\'' +
                ", counts=" + counts +
                '}';
    }

    public String getSorts() {
        return sorts;
    }

    public void setSorts(String sorts) {
        this.sorts = sorts;
    }

    public Integer getCounts() {
        return counts;
    }

    public void setCounts(Integer counts) {
        this.counts = counts;
    }
}
