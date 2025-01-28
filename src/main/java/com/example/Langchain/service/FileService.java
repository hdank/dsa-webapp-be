package com.example.Langchain.service;

import com.example.Langchain.entity.FileEntity;
import com.example.Langchain.repository.FileRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.io.IOException;
import java.nio.file.*;
import java.util.List;
import java.util.Optional;

@Service
public class FileService {
    @Autowired
    private FileRepository fileRepository;

    private final String uploadDir = "uploads/";

    public FileEntity uploadFile(MultipartFile file) throws IOException {
        Files.createDirectories(Paths.get(uploadDir));
        String filePath = uploadDir + file.getOriginalFilename();
        Files.copy(file.getInputStream(), Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);

        FileEntity fileEntity = new FileEntity(
                file.getOriginalFilename(),
                filePath,
                file.getContentType()
        );
        return fileRepository.save(fileEntity);
    }

    public Page<FileEntity> getAllFiles(String searchTerm, Pageable pageable) {
        if (searchTerm != null && !searchTerm.isEmpty()) {
            return fileRepository.findByFileNameContainingIgnoreCase(searchTerm, pageable);
        }
        return fileRepository.findAll(pageable);
    }

    public Optional<FileEntity> getFile(Long id) {
        return fileRepository.findById(id);
    }

    public void deleteFile(Long id) {
        Optional<FileEntity> fileEntity = fileRepository.findById(id);
        fileEntity.ifPresent(file -> {
            try {
                Files.deleteIfExists(Paths.get(file.getFilePath()));
                fileRepository.delete(file);
            } catch (IOException e) {
                throw new RuntimeException("Error deleting file", e);
            }
        });
    }
}