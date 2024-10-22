package com.example.Langchain.repository;

import com.example.Langchain.entity.Session;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface SessionRepository extends JpaRepository<Session, Long> {
    Optional<Session> findByToken(String token);
    List<Session> findByUser_mssv(String mssv);
}
