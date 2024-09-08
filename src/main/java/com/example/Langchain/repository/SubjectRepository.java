package com.example.Langchain.repository;

import com.example.Langchain.entity.Subjects;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface SubjectRepository extends JpaRepository<Subjects, String> {
    Optional<Subjects> findByIdSubject(String IdSubject);
}
