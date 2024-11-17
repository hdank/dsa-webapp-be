package com.example.Langchain.repository;

import com.example.Langchain.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User,String> {
    Optional<User> findByMssv(String mssv);
    Optional<User> findByToken(String token);

    Optional<User> deleteByMssv(String mssv);
}
