package com.zhou.service;

import com.zhou.model.Activity;

import java.util.List;

/**
 * Created by icepoint1999 on 11/5/15.
 */
public interface ActivityService {

    int InsertActivity(Activity activity);
    List<Activity> selectAllactivity();
    List<Activity> selectAllbyUserid(int userid);
    Activity find_by_id(int id);
}
