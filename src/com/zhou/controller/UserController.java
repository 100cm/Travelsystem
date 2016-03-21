package com.zhou.controller;

import com.zhou.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhou.service.UserService;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;


import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
    @SessionAttributes("is_login")


    public class UserController {
 
	@Autowired
	private UserService userService;

    @RequestMapping(value="/register.do")
    public ModelAndView register(User user ,Model model,HttpSession httpSession){

        userService.insertUser(user);

        ModelAndView mav =new ModelAndView("redirect:/login.do");

        httpSession.setAttribute("user",user);

        model.addAttribute("is_login",true);


        mav.addObject(model);


        return mav;
    }


    @ResponseBody
    @RequestMapping(value="/signin.do")
    public
    ModelAndView sing_in(Model model,User user,HttpSession httpsession,String password){


        User u=userService.findUserByemail(user.getEmail());
        String pass=password;




        if(u != null){

            if(u.getPassword().equals(password))
            {
                ModelAndView mav=new ModelAndView("/welcome");
                MappingJackson2JsonView view =new MappingJackson2JsonView();

                Map attributes = new HashMap();

                httpsession.setAttribute("user",u);
                attributes.put("msg", "success");

                view.setAttributesMap(attributes);

                mav.setView(view);



                return mav;
            }
           else {

                ModelAndView mav=new ModelAndView("/main");

                MappingJackson2JsonView view =new MappingJackson2JsonView();

                Map attributes = new HashMap();

                attributes.put("msg","error");



                view.setAttributesMap(attributes);


                mav.setView(view);

                return mav;
            }


        }

        else{
            ModelAndView mav=new ModelAndView("/welcome");

            MappingJackson2JsonView view =new MappingJackson2JsonView();

            Map attributes = new HashMap();

            attributes.put("msg", "none");

            view.setAttributesMap(attributes);

            mav.setView(view);

            return mav;
        }
    }


    @RequestMapping("login.do")
    public ModelAndView login(Model model){

        model.addAttribute("main_active",true);

        ModelAndView mav=new ModelAndView("redirect:main.do");

        mav.addObject(model);

        return mav;


    }

}