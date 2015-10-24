package com.zhou.service;

import com.zhou.model.Article;
import com.zhou.model.ArticleWithBLOBs;

import java.util.List;

/**
 * Created by icepoint on 10/20/15.
 */
public interface ArticleService {

    int insertArticle(ArticleWithBLOBs article);
    ArticleWithBLOBs  selectArticleById(int id);

    List<ArticleWithBLOBs> selectAllArticle();
}
