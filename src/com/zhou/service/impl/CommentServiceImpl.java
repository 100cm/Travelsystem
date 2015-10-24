package com.zhou.service.impl;

import com.zhou.dao.CommentMapper;
import com.zhou.model.Comment;
import com.zhou.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by icepoint on 10/22/15.
 */
@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    @Qualifier("commentMapper")
    private CommentMapper commentMapper;


    @Override
    public int insertComment(Comment comment) {
        return commentMapper.insert(comment);
    }

    @Override
    public List<Comment> selectByArticleid(int id) {
        return commentMapper.selectAllComment(id);
    }
}
