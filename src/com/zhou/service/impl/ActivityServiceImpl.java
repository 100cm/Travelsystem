package com.zhou.service.impl;

import com.zhou.dao.ActivityMapper;
import com.zhou.model.Activity;
import com.zhou.service.ActivityService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by icepoint1999 on 11/5/15.
 */
@Service
public class ActivityServiceImpl implements ActivityService{

    @Resource
    ActivityMapper activityMapper;

    @Override
    public int InsertActivity(Activity activity) {
        return activityMapper.insert(activity);
    }

    @Override
    public List<Activity> selectAllactivity() {
        return  activityMapper.selectAll();
    }

    @Override
    public List<Activity> selectAllbyUserid(int userid) {
        return activityMapper.selectAllByUserid(userid);
    }

    @Override
    public Activity find_by_id(int id) {
        return activityMapper.selectByPrimaryKey(id);
    }
}
