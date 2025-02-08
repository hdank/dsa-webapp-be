package com.example.Langchain.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import jakarta.persistence.Table;

import java.time.LocalDateTime;

@Entity
@Table(name = "conversation")
public class Conversation {

    @Id
    private String id;

    private String title;

    @Column(name = "user_token")
    private String userToken;

    @Column(name = "created_date")
    private LocalDateTime createdDate;

    public Conversation() {}

    public Conversation(String id, String title, String userToken) {
        this.id = id;
        this.title = title;
        this.userToken = userToken;
    }

    @PrePersist
    public void prePersist() {
        // Gán thời gian hiện tại cho createdDate trước khi lưu
        if (this.createdDate == null) {
            this.createdDate = LocalDateTime.now();
        }
    }

    // Getters và Setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUserToken() {
        return userToken;
    }

    public void setUserToken(String userToken) {
        this.userToken = userToken;
    }

    public LocalDateTime getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDateTime createdDate) {
        this.createdDate = createdDate;
    }
}
