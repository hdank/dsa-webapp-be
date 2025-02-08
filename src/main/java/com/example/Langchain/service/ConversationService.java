package com.example.Langchain.service;

import com.example.Langchain.entity.Conversation;
import com.example.Langchain.repository.ConversationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ConversationService {

    @Autowired
    private ConversationRepository conversationRepository;

    // Phương thức tìm kiếm tất cả Conversation theo userToken
    public List<Conversation> getConversationsByToken(String token) {
        return conversationRepository.findByUserToken(token);  // Trả về danh sách Conversation
    }

    // Phương thức để lưu hoặc cập nhật Conversation
    public Conversation saveConversation(Conversation conversation) {
        return conversationRepository.save(conversation);
    }
}
