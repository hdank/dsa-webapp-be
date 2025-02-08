package com.example.Langchain.repository;

import com.example.Langchain.entity.Conversation;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ConversationRepository extends JpaRepository<Conversation, String> {
    // Trả về danh sách Conversation theo userToken
    List<Conversation> findByUserToken(String token);
}
