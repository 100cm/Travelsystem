package com.zhou.controller;

import com.zhou.model.Comment;
import com.zhou.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by icepoint on 10/22/15.
 */

@Controller
public class CommentController {

@Autowired
private CommentService commentService;


@RequestMapping("/new_comment.do")

    public ModelAndView new_comment(Comment comment,int articleId){

        commentService.insertComment(comment);

        ModelAndView mav=new ModelAndView();

        MappingJackson2JsonView view =new MappingJackson2JsonView();

        Map attributes = new HashMap();

        attributes.put("article_id", articleId);

        view.setAttributesMap(attributes);

        mav.setView(view);

        return mav;




}

}
