/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.model;

/**
 *
 * @author Admin
 */
public class PageFormInfor {

    private int visiblePages = 1;
    private int startPage = 1;
    private int maxItemsInPage = 3;
    private int amountOfItems = -1;
    private String orderBy = "t.id";
    private String dimSort;
    private String flexSearchQuery;
    private String customSearchQuery;
    private boolean where = false;
    private String lastKey = "";

    public String getCustomSearchQuery() {
        return customSearchQuery;
    }

    public void setCustomSearchQuery(String customSearchQuery) {
        setWhere(true);
        this.customSearchQuery = customSearchQuery;
    }

    public String getLastKey() {
        return lastKey;
    }

    public void setLastKey(String lastKey) {
        this.lastKey = lastKey;
    }

    public boolean isWhere() {
        return where;
    }

    public void setWhere(boolean where) {
        this.where = where;
    }

    public String getFlexSearchQuery() {
        return flexSearchQuery;
    }

    public void setFlexSearchQueryNull() {
        this.flexSearchQuery = null;
    }

    public void setFlexSearchQuery(String flexSearchQuery) {
        StringBuilder sqlExtend = new StringBuilder();
        setWhere(true);
        if (isNumeric(flexSearchQuery)) {
            sqlExtend.append(" t.price = ").append(flexSearchQuery).append(" or ");
            sqlExtend.append("t.max_amount = ").append(flexSearchQuery).append(" ");
        } else {
            sqlExtend.append(" at.departure like N'%").append(flexSearchQuery).append("%' or ");
            sqlExtend.append("at.destination like N'%").append(flexSearchQuery).append("%' or ");
            sqlExtend.append("t.title like N'%").append(flexSearchQuery).append("%' or ");
            sqlExtend.append("ct.name like N'%").append(flexSearchQuery).append("%' or ");
            sqlExtend.append("t.description like N'%").append(flexSearchQuery).append("%' or ");
            sqlExtend.append("t.flight like N'%").append(flexSearchQuery).append("%' or ");
            sqlExtend.append("t.start_time like N'%").append(flexSearchQuery).append("%' or ");
            sqlExtend.append("t.end_time like N'%").append(flexSearchQuery).append("%' ");

        }
        this.flexSearchQuery = sqlExtend.toString();
    }

    public String getOrderBy() {
        return orderBy;
    }

    public void setOrderBy(String orderBy) {
        this.orderBy = orderBy;
    }

    public String getDimSort() {
        return dimSort;
    }

    public void setDimSort(String dimSort) {
        this.dimSort = dimSort;
    }

    public int getVisiblePages() {
        return visiblePages;
    }

    public void setVisiblePages(int visiblePages) {
        this.visiblePages = visiblePages;
    }

    public int getStartPage() {
        return startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    public int getMaxItemsInPage() {
        return maxItemsInPage;
    }

    public void setMaxItemsInPage(int maxItemsInPage) {
        this.maxItemsInPage = maxItemsInPage;
    }

    public int getAmountOfItems() {
        return amountOfItems;
    }

    public void setAmountOfItems(int amountOfItems) {
        this.amountOfItems = amountOfItems;
    }

    public int getTotalPage() {
        int totalPage = (int) Math.ceil(amountOfItems * 1.0 / maxItemsInPage);
        return totalPage;
    }

    public int getOffset() {
        return (startPage - 1) * maxItemsInPage;
    }


    @Override
    public String toString() {
        return "PageFormInfor{" + "visiblePages=" + visiblePages + ", startPage=" + startPage + ", maxItemsInPage=" + maxItemsInPage + ", amountOfItems=" + amountOfItems + ", orderBy=" + orderBy + ", dimSort=" + dimSort + ", flexSearchQuery=" + flexSearchQuery + ", where=" + where + ", lastKey=" + lastKey + '}';
    }

    public boolean isNumeric(String strNum) {
        if (strNum == null) {
            return false;
        }
        try {
            double d = Double.parseDouble(strNum);
        } catch (NumberFormatException nfe) {
            return false;
        }
        return true;
    }
}
