package com.zhou.controller;

import com.zhou.model.Activity;
import com.zhou.model.User;
import com.zhou.service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * Created by icepoint on 10/24/15.
 */
@Controller
public class ActivityController {

@Autowired
    ActivityService activityService;

@RequestMapping("new_activity.do")
    public ModelAndView activity(Activity activity,HttpSession httpSession){

        ModelAndView modelAndView =new ModelAndView("redirect:/show_activity.do");
        User user=new User();
        user= (User) httpSession.getAttribute("user");
        activity.setCreatedById(user.getId());
        activity.setCreatedByName(user.getUsername());

        activityService.InsertActivity(activity);

        return modelAndView;


    }

    @RequestMapping("show_activity.do")

    public  ModelAndView showac(){


        ModelAndView mav=new ModelAndView();

        return  mav;
    }



}
