package com.example.Langchain.service;

import com.example.Langchain.entity.User;

public class AuthResponse {
    private String token;
    private String mssv;
    private String role;

    private User user;

    public AuthResponse(String token, String mssv, String role, User user) {
        this.token = token;
        this.mssv = mssv;
        this.role = role;
        this.user = user;
    }

    // Getters and setters
    public String getMssv() {
        return mssv;
    }

    public void setMssv(String mssv) {
        this.mssv = mssv;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
