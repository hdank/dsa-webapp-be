package com.example.Langchain.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Entity
@Table(name="Subjects")
public class Subjects {
    @Id
    @Column(name = "IdSubject")
    private String idSubject;

    @Column(name = "TitleSubject", columnDefinition = "TEXT")
    private String titleSubject;

    @Column(name = "SubjectContent", columnDefinition = "LONGTEXT")
    private String subjectContent;

    public String getIdSubject() {
        return idSubject;
    }

    public void setIdSubject(String idSubject) {
        this.idSubject = idSubject;
    }

    public String getTitleSubject() {
        return titleSubject;
    }

    public void setTitleSubject(String titleSubject) {
        this.titleSubject = titleSubject;
    }

    public String getSubjectContent() {
        return subjectContent;
    }

    public void setSubjectContent(String subjectContent) {
        this.subjectContent = subjectContent;
    }
}
