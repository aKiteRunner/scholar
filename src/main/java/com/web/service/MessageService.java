package com.web.service;

import com.web.bean.Message;
import com.web.dao.MessageMapper;
import com.web.utils.Setting;
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
        if (message.getStatus() == Setting.UNREAD_MESSAGE) {
            message.setStatus(Setting.READ_MESSAGE);
        }
        if (message.getStatus() == Setting.UNREAD_APPLICATION) {
            message.setStatus(Setting.READ_APPLICATION);
        }
        messageMapper.updateByPrimaryKey(message);
    }
}
