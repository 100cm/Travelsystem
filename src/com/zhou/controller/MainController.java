package com.zhou.controller;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sun.deploy.net.HttpResponse;
import com.zhou.model.Article;
import com.zhou.model.ArticleWithBLOBs;
import com.zhou.service.ArticleService;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import util.SomeUtil;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by icepoint on 8/14/15.
 */
@Controller
@SessionAttributes("is_login")
public class MainController{


    @Autowired
    private ArticleService articleService;



    private SomeUtil util;


//    //传递对象
//    @RequestMapping(value="/test1")
//    public String test3(@RequestBody Users user){
//        System.out.print(user);
//        return "index";
//    }
//    //传递对象json
//    @RequestMapping(value="/test3")
//    public String  test(@RequestBody Map<String,BIConversion.User> user){
//        System.out.print(user.get("user"));
//        return "index";
//    }
//    //传递数组
//    @RequestMapping (value="/test2")
//    public String test2(@RequestBody List<Users> user) {
//        for(Users obj:user){
//            System.out.println(obj);
//        }
//        return LIST_PAGE;
//    }

    @RequestMapping("/welcome.do")
    public ModelAndView welcome(Model model){
        ModelAndView mav=new ModelAndView("/welcome");

        model.addAttribute("is_login",false);


        mav.addObject(model);
        return mav;
    }
    //    上传文件

    @RequestMapping(value="/postimage.do")
    public void uploadFile(@RequestParam("upload") MultipartFile multipartFile,HttpServletRequest request,HttpServletResponse response) throws IOException {
        String filename=multipartFile.getOriginalFilename();

        if(!multipartFile.isEmpty()){
            //获取路径
            File f = new File(request.getSession().getServletContext().getRealPath("/")+"uploadfile/"+multipartFile.getOriginalFilename());
            //存到项目路径下为uploadfile的文件中
            multipartFile.transferTo(new File(request.getSession().getServletContext().getRealPath("/")+"uploadfile/"+filename));
            String path="uploadfile/"+filename;
            System.out.print(path);
            response.setContentType("text/html;charset=UTF-8");
            response.setHeader("X-Frame-Options", "SAMEORIGIN");
            String CKEditorFuncNum = request.getParameter("CKEditorFuncNum");
            PrintWriter out;
            String s = "<script type=\"text/javascript\">window.parent.CKEDITOR.tools.callFunction("+CKEditorFuncNum+", '"+path+"');</script>";
            try {
                out = response.getWriter();
                out.print(s);
                out.flush();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }





    }

    @RequestMapping("/main.do")
    public ModelAndView mainpage(Model model){

//        List<ArticleWithBLOBs> article=articleService.selectAllArticle().subList(0,5);

        ModelAndView mav =new ModelAndView("main");

//        model.addAttribute("articles",article);

        model.addAttribute("is_login",true);

        model.addAttribute("main_active",true);

        mav.addObject(model);

        return mav;
    }
    @RequestMapping("/profile.do")
    public ModelAndView profile(Model model){

        ModelAndView mav =new ModelAndView("profile");

        model.addAttribute("profile_active",true);

        mav.addObject(model);

        return mav;
    }
    @RequestMapping("/club.do")
    public ModelAndView club(Model model,@RequestParam(value="page", defaultValue="1") int page){
        PageHelper.startPage(page,5);

        List<ArticleWithBLOBs> articles = articleService.selectAllArticle();

        PageInfo<ArticleWithBLOBs> list=new PageInfo(articles);

        model.addAttribute("list",list.getList());

        model.addAttribute("next_page",list.getNextPage());

        model.addAttribute("last_page",list.getLastPage());

        model.addAttribute("pre_page",list.getPrePage());

        model.addAttribute("page_size",list.getPageSize());

        model.addAttribute("first_page",list.getFirstPage());

        model.addAttribute("page_num",list.getPageNum());

        model.addAttribute("total_page",list.getPages());

        ModelAndView mav =new ModelAndView("club");

        model.addAttribute("club_active",true);

        model.addAttribute("articles",articles);

        mav.addObject(model);

        return mav;
    }

}






