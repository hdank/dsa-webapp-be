package com.example.Langchain.service;


import com.example.Langchain.entity.Session;
import com.example.Langchain.repository.SessionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class SessionService {
    @Autowired
    private SessionRepository sessionRepository;
    public Session getValidSession(String mssv){
        List<Session> sessionList = sessionRepository.findByUser_mssv(mssv);
        for(Session session:sessionList){
            if(session.getExp().after(new Date()))
            {
                System.out.println("Còn hạn");
                return session;
            }
        }
        return null;
    }
}
