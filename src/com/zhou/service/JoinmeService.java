package com.zhou.service;

import com.zhou.model.Joinme;

import java.util.List;

/**
 * Created by icepoint1999 on 3/21/16.
 */
public interface JoinmeService {

    void insert(Joinme joinme);
    List<Joinme> getbyUserid(int id);
    List<Joinme> getByAid(int id);
    List<Joinme>  getByAll(int activityid ,int userid);
}
