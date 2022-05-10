/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.serviceimp;

import com.pnttour.travelproject.dao.AccountDAO;
import com.pnttour.travelproject.dao.AvailTourDAO;
import com.pnttour.travelproject.dao.CategoryTourDAO;
import com.pnttour.travelproject.dao.CommentDAO;
import com.pnttour.travelproject.dao.TourDAO;
import com.pnttour.travelproject.dao.UserTripDAO;
import com.pnttour.travelproject.imp.AccountDAOImp;
import com.pnttour.travelproject.imp.AvailTourDAOImp;
import com.pnttour.travelproject.imp.CategoryTourDAOImp;
import com.pnttour.travelproject.imp.CommentDAOImp;
import com.pnttour.travelproject.imp.TourDAOImp;
import com.pnttour.travelproject.imp.UserTripDAOImp;
import com.pnttour.travelproject.model.Account;
import com.pnttour.travelproject.model.AvailTour;
import com.pnttour.travelproject.model.CategoryTour;
import com.pnttour.travelproject.model.Comment;
import com.pnttour.travelproject.model.PageFormInfor;
import com.pnttour.travelproject.model.Tour;
import com.pnttour.travelproject.model.TourFrontEnd;
import com.pnttour.travelproject.model.UserTrip;
import com.pnttour.travelproject.service.TourService;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.ManagedBean;
import javax.inject.Inject;

/**
 *
 * @author Admin
 */
@ManagedBean
public class TourServiceImp implements TourService {

    @Inject
    private TourDAO tourDAO;

    @Inject
    private AvailTourDAO avTourDAO;

    @Inject
    private CommentDAO commentDAO;

    @Inject
    private UserTripDAO userTripDAO;

    @Inject
    private AccountDAO accountDAO;

    @Inject
    private CategoryTourDAO cateDAO;

    public TourDAO getTourDAO() {
        return tourDAO;
    }

    public void setTourDAO(TourDAO tourDAO) {
        this.tourDAO = tourDAO;
    }

    @Override
    public List<Tour> findAllTour() {
        return tourDAO.findAll();
    }

    @Override
    public List<AvailTour> findAllAvailTour() {
        return avTourDAO.findAll();
    }

    @Override
    public List<Comment> findAllComment(long id) {
        return commentDAO.findByAccountId(id);
    }

    @Override
    public List<Account> findAllUser(long id) {
        List<Account> accs = new ArrayList<>();

        for (UserTrip userTrip : userTripDAO.findUserTripByAccountId(id)) {
            Account acc = accountDAO.findOne(userTrip.getAccountId());
            accs.add(acc);
        }

        return accs.isEmpty() ? null : accs;
    }

    @Override
    public Tour getTourById(long id) {
        return tourDAO.findOne(id);
    }

    @Override
    public CategoryTour getCategory(Tour tour) {
        AvailTour avTour = getAvailTour(tour);
        CategoryTourDAO ctDAO = new CategoryTourDAOImp();
        return ctDAO.findOne(avTour.getCategoryTourId());
    }

    @Override
    public AvailTour getAvailTour(Tour tour) {
        return avTourDAO.findOne(tour.getAvailTourId());
    }

    @Override
    public Long create(Tour tour) {
        return tourDAO.create(tour);
    }

    @Override
    public void delete(long id) {
        tourDAO.delete(id);
    }

    @Override
    public void update(long id, Tour tour) {
        if(tour.getModifiedDate() == null){
            tour.setModifiedDate( new Date(System.currentTimeMillis()));
        }
        tourDAO.update(id, tour);
    }

    @Override
    public int getCount(String tableName) {
        return tourDAO.getCount();
    }

    @Override
    public List<TourFrontEnd> getAllTourInfo(PageFormInfor page) {
        if (page.getAmountOfItems() == -1) {
            int count = getCount("tour");
            page.setAmountOfItems(count);
            page.setStartPage(1);
            page.setOrderBy("t.id");
            if (count <= 12) {
                page.setVisiblePages((int) Math.ceil(count / 3));
            } else {
                page.setVisiblePages(5);
            }
        }

        StringBuilder sqlExtend = new StringBuilder();

        sqlExtend.append(" order by ").append(page.getOrderBy());
        sqlExtend.append(" ");
        if (page.getDimSort() != null) {
            sqlExtend.append(page.getDimSort()).append(" ");
        }
        sqlExtend.append("offset ").append(page.getOffset()).append(" ");
        sqlExtend.append("rows fetch next ").append(page.getMaxItemsInPage()).append(" ");
        sqlExtend.append("rows only");

        return tourDAO.findTourFrontEnd(sqlExtend.toString());
    }

    @Override
    public TourFrontEnd getOneTourInfo(int id) {
        return tourDAO.getOneTourInfo(id);
    }

    @Override
    public List<AvailTour> findRelateAvailTour(String relation) {
        return avTourDAO.findRelateAvailTour(relation);
    }

    @Override
    public Long createAvailTour(AvailTour tour) {
        return avTourDAO.create(tour);
    }

    @Override
    public void deleteAvailTour(long id) {
        avTourDAO.delete(id);
    }

    @Override
    public void updateAvailTour(long id, AvailTour tour) {
        avTourDAO.update(id, tour);
    }

    @Override
    public AvailTour findAvailTour(long id) {
        return avTourDAO.findOne(id);
    }

    @Override
    public List<CategoryTour> findAllCategory() {
        return cateDAO.findAll();
    }

    @Override
    public List<TourFrontEnd> getQueryTourInfo(PageFormInfor page) {
        
        StringBuilder sqlExtend = new StringBuilder();
        if (page.isWhere()) {
            sqlExtend.append(" where ");
        }
        if (page.getFlexSearchQuery() != null) {
            sqlExtend.append(page.getFlexSearchQuery());
        }else{
            if(page.getCustomSearchQuery()!=null){
                sqlExtend.append(page.getCustomSearchQuery());
            }
        }
        
        if (page.getAmountOfItems() == -1) {
            int count = getCountQuery(sqlExtend.toString());
            page.setAmountOfItems(count);
            page.setStartPage(1);
            if (count <= 12) {
                page.setVisiblePages((int) Math.ceil(count / 3));
            } else {
                page.setVisiblePages(5);
            }
        }

        sqlExtend.append(" order by ").append(page.getOrderBy());
        System.out.println(sqlExtend);
        sqlExtend.append(" ");
        if (page.getDimSort() != null) {
            sqlExtend.append(page.getDimSort()).append(" ");
        }
        sqlExtend.append("offset ").append(page.getOffset()).append(" ");
        sqlExtend.append("rows fetch next ").append(page.getMaxItemsInPage()).append(" ");
        sqlExtend.append("rows only");
        
        return tourDAO.findTourFrontEnd(sqlExtend.toString());
    }

    @Override
    public int getCountQuery(String query) {
        return tourDAO.getCountTourFEQuery(query);
    }

}
