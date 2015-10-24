package util;

import com.github.pagehelper.PageHelper;
import com.zhou.model.ArticleWithBLOBs;
import com.zhou.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by icepoint on 8/15/15.
 */
public class SomeUtil {



//获取不带扩展名的名字
    public  String getFileNameNoEx(String filename) {
        if ((filename != null) && (filename.length() > 0)) {
            int dot = filename.lastIndexOf('.');
            if ((dot >-1) && (dot < (filename.length()))) {
                return filename.substring(0, dot);
            }
        }
        return filename;
    }
    //获取文件扩展名
    public String getExtensionName(String filename) {
        if ((filename != null) && (filename.length() > 0)) {
            int dot = filename.lastIndexOf('.');
            if ((dot >-1) && (dot < (filename.length() - 1))) {
                return filename.substring(dot + 1);
            }
        }
        return filename;
    }

    //获取当前时间
    public  String getTimenow(){
        Date now = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss");//可以方便地修改日期格式
        String hehe = dateFormat.format(now);
        return hehe;
    }

    public static  void main(String[] args){



    }

    public    String  DeleteStyle(String   html)   {
        System.out.print(html);
        String str=html;
        String img;

        String regex3 = "style=\"";

            img=str.replaceAll(str.substring(str.indexOf(regex3), str.indexOf("\"", str.indexOf("style=\"") + regex3.length()) + 1), "");





        return img;
    }

    public String DeleteImage(String html){

        String regex="<img\\s*([\\w]+=(\"|\')([^\"\']*)(\"|\')\\s*)*/>";//这样更简单
        Pattern p = Pattern.compile(regex);
        Matcher m = p.matcher(html);
        StringBuffer sb1 = new StringBuffer();

        while(m.find())
        {
            sb1.append(m.replaceAll(""));
        }
        String srt=sb1.toString();
        return srt;
    }

}



