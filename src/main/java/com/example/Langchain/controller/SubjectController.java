package com.example.Langchain.controller;

import com.example.Langchain.entity.Subjects;
import com.example.Langchain.repository.SubjectRepository;
import lombok.RequiredArgsConstructor;
import org.apache.tomcat.util.json.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/user")
@CrossOrigin(origins = "http://localhost:4200/")
public class SubjectController {
    @Autowired
    private SubjectRepository subjectRepository;


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
}
