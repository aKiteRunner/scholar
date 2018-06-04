package com.web.service;

import com.web.bean.Message;
import com.web.dao.MessageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageService {
    private final MessageMapper messageMapper;

    @Autowired
    public MessageService(MessageMapper messageMapper) {
        this.messageMapper = messageMapper;
    }

    public List<Message> selectSentMessage(Integer userId) {
        return messageMapper.selectBySenderId(userId);
    }

    public List<Message> selectReceivedMessage(Integer userId) {
        return messageMapper.selectByReceiverId(userId);
    }

    public void insertMessage(Message message) {
        messageMapper.insert(message);
    }

    public void checkMessage(Integer messageId) {
        Message message = messageMapper.selectByPrimaryKey(messageId);
        message.setStatus((byte)1);
        messageMapper.updateByPrimaryKey(message);
    }
}
