package com.zhou.service;

import com.zhou.model.Comment;

import java.util.List;

/**
 * Created by icepoint on 10/22/15.
 */
public interface CommentService {

    int insertComment(Comment comment);
    List<Comment> selectByArticleid(int id);

}
