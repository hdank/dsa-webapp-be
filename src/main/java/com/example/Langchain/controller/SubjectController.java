package com.example.Langchain.controller;

import com.example.Langchain.entity.FileEntity;
import com.example.Langchain.entity.Subjects;
import com.example.Langchain.repository.SubjectRepository;
import com.example.Langchain.service.FileService;
import lombok.RequiredArgsConstructor;
import org.apache.tomcat.util.json.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.Optional;

@RestController
@RequestMapping("/subject")
@CrossOrigin(origins = "http://localhost:4200/")
public class SubjectController {
    @Autowired
    private SubjectRepository subjectRepository;

    @Autowired
    private FileService fileService;

    @GetMapping("/general")
    public ResponseEntity<String> general(){

        Optional<Subjects> subject = subjectRepository.findByIdSubject("CTGT01");
        if (subject.isPresent()) {
            return ResponseEntity.ok().contentType(MediaType.TEXT_HTML).body(subject.get().getSubjectContent());
        } else {
            System.out.println("Subject not found");
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping("/get-all-files")
    public Page<FileEntity> getAllFiles(Pageable pageable,
                                        @RequestParam(value = "searchTerm", required = false) String searchTerm) {
        System.out.println("Search Term: " + searchTerm);
        return (Page<FileEntity>) fileService.getAllFiles(searchTerm, pageable);
    }

    @PostMapping("/upload")
    public ResponseEntity<?> uploadFile(@RequestParam("file")MultipartFile file) {
        try {
            FileEntity savedFile = fileService.uploadFile(file);
            return ResponseEntity.ok(savedFile);
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("File uploaded");
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getFile(@PathVariable Long id) {
        Optional<FileEntity> fileEntity = fileService.getFile(id);
        if(fileEntity.isPresent()){
            FileEntity file = fileEntity.get();
            try {
                byte[] fileContent = Files.readAllBytes(new File(file.getFilePath()).toPath());
                return ResponseEntity.ok().contentType(MediaType.parseMediaType(file.getFileType())).body(fileContent);
            } catch (IOException e) {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error reading file");
            }
        }
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body("File not found");
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteFile(@PathVariable Long id) {
        fileService.deleteFile(id);
        return ResponseEntity.ok("File deleted successfully");
    }

}
