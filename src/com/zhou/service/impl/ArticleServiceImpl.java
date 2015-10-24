package com.zhou.service.impl;

import com.zhou.dao.ArticleMapper;
import com.zhou.model.Article;
import com.zhou.model.ArticleWithBLOBs;
import com.zhou.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by icepoint on 10/20/15.
 */
@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired

    @Qualifier("articleMapper")

    private ArticleMapper articleMapper;

    @Override
    public int insertArticle(ArticleWithBLOBs article) {
        return articleMapper.insert(article);
    }

    @Override
    public ArticleWithBLOBs selectArticleById(int id) {
        return articleMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<ArticleWithBLOBs> selectAllArticle() {

        return articleMapper.selectAllArticle();
    }
}
