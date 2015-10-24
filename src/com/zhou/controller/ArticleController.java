package com.zhou.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhou.model.Article;
import com.zhou.model.ArticleWithBLOBs;
import com.zhou.model.Comment;
import com.zhou.model.User;
import com.zhou.service.ArticleService;
import com.zhou.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import util.SomeUtil;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


/**
 * Created by icepoint on 10/20/15.
 */

@Controller
public class ArticleController {


    @Autowired
    private ArticleService articleService;

    @Autowired
    private CommentService commentService;



    @RequestMapping("/new_article.do")

    public ModelAndView new_article(ArticleWithBLOBs article,HttpSession httpSession,String maincontent){

        SomeUtil someUtil=new SomeUtil();
        String regex="<img\\s*([\\w]+=(\"|\')([^\"\']*)(\"|\')\\s*)*/>";


        Pattern p = Pattern.compile(regex);
        Matcher m = p.matcher(maincontent);

        StringBuffer sb1 = new StringBuffer();

        while(m.find())
        {
            sb1.append(m.group());
        }
                User at= (User) httpSession.getAttribute("user");
                article.setAuthorid(at.getId());
                article.setAuthorname(at.getUsername());
                String str=sb1.toString();
                String image;
                String content;
                if(str.isEmpty()){
                     content=maincontent;
                     image="";
                }else{

                    image= someUtil.DeleteStyle(str);
                    content=someUtil.DeleteImage(maincontent);
                }
                article.setImg(image);
                article.setContent(content);
                articleService.insertArticle(article);

                ModelAndView mav= new ModelAndView("redirect:/club.do");



     return mav;


 }

    @RequestMapping("/article.do")

    public ModelAndView article(int id,Model model,@RequestParam(value="page", defaultValue="1") int page){

        Article article= articleService.selectArticleById(id);
        PageHelper.startPage(page, 6);
        List<Comment> comments= commentService.selectByArticleid(id);
        PageInfo<Comment> list=new PageInfo<>(comments);
        model.addAttribute("list",list.getList());
        model.addAttribute("next_page",list.getNextPage());
        model.addAttribute("last_page",list.getLastPage());
        model.addAttribute("pre_page",list.getPrePage());
        model.addAttribute("page_size",list.getPageSize());
        model.addAttribute("first_page",list.getFirstPage());
        model.addAttribute("page_num",list.getPageNum());
        model.addAttribute("total_page",list.getPages());

        model.addAttribute("club_active",true);

        model.addAttribute("article_id",id);

        model.addAttribute("article",article);

        model.addAttribute("comments",comments);

        if(page==1||page==0){
            model.addAttribute("page",1);

        }

        ModelAndView mav =new ModelAndView("comment");

        return mav;

    }
}
