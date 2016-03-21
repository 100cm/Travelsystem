package com.zhou.controller;

import com.zhou.model.Activity;
import com.zhou.model.Joinme;
import com.zhou.model.User;
import com.zhou.service.ActivityService;
import com.zhou.service.JoinmeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by icepoint on 10/24/15.
 */
@Controller
public class ActivityController {

@Autowired
    ActivityService activityService;

    @Autowired
    JoinmeService joinmeService;

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
        List<Activity> activities = activityService.selectAllactivity();
        mav.addObject("activity",activities);
        return  mav;
    }

    @RequestMapping("single_activity.do")

    public ModelAndView singleAc(int id ){
        ModelAndView mav=new ModelAndView();
        Activity activity = activityService.find_by_id(id);
        mav.addObject("activity",activity);
        return mav;
    }
    @RequestMapping("/new_join_activity.do")
    public @ResponseBody
    Map<String ,String> new_join(int articleId,int userid){
        Joinme joinme = new Joinme();
        joinme.setActivityid(articleId);
        joinme.setUserid(userid);
        List<Joinme> joinmes = joinmeService.getByAll(articleId,userid);
        System.out.print(joinmes.size());
        Map<String ,String> map= new HashMap<>();
        if (joinmes.size()>0){
            map.put("message","fail");
        }else{

            map.put("message","success");
            joinmeService.insert(joinme);

        }

        return  map;
    }



}
