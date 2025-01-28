package com.example.Langchain.repository;

import com.example.Langchain.entity.FileEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface FileRepository extends JpaRepository<FileEntity, Long> {
    Optional<FileEntity> findByFileName(String fileName);
    Page<FileEntity> findByFileNameContainingIgnoreCase(String fileName, Pageable pageable);
}
