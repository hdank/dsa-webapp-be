package com.example.Langchain.service;

import com.example.Langchain.entity.Session;
import com.example.Langchain.entity.User;
import com.example.Langchain.repository.SessionRepository;
import com.example.Langchain.repository.UserRepository;
import io.jsonwebtoken.Claims;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

@Service
public class AuthService {
    @Autowired
    private UserRepository repo;

    @Autowired
    private SessionRepository ssrepo;
    @Autowired
    private SessionService sessionService;

    public String login(String mssv, String password){
        PasswordEncoder encoder = new BCryptPasswordEncoder();
        Optional<User> userOptional = repo.findByMssv(mssv);
        if(userOptional.isPresent()) {
            User user = userOptional.get();
            String encodedPassword = encoder.encode(password);
            if(encoder.matches(password, encodedPassword)) {
                // Lấy Session phù hợp
                Session validSession = sessionService.getValidSession(user.getMssv());
                if(validSession !=null){
                    return validSession.getToken();
                }
                else
                {
                    String token = UUID.randomUUID().toString();
                    user.setToken(token);
                    //Thêm session mới
                    Session newSession = new Session();
                    newSession.setUser(user);
                    newSession.setToken(token);
                    Date exp = new Date(System.currentTimeMillis() + 5 * 60 * 1000); // thời gian 5 phút
                    newSession.setExp(exp);
                    repo.save(user);
                    ssrepo.save(newSession);
                    return token;
                }
            } else {
                System.out.println("Password does not match");
            }
        } else {
            System.out.println("User not found");
        }
        throw new RuntimeException("Invalid credentials");
    }
    public String getUserBySessionToken(String token){
        // Retrieve user based on the session token
        Optional<User> userOptional = repo.findByToken(token);
        System.out.println("repo: "+repo); //Debug print
        if (userOptional.isPresent()) {
            System.out.println("password from user: "+userOptional.get().getMssv());// Debug print

            return userOptional.get().getMssv();
        }
        return null;
    }
}
