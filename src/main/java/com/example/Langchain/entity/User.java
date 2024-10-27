package com.example.Langchain.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@Entity
@Table(name="user")
@AllArgsConstructor
@NoArgsConstructor
public class User {
    @Id
    @Column(name="mssv")
    private String mssv;
    @Column(name="email")
    private String email;
    @Column(name="first_name")
    private String fname;
    @Column(name="last_name")
    private String lname;
    @Column(name="phone_number")
    private String phoneNumber;
    @Column(name="password")
    private String password;
    @Column(name="gender")
    private String gender;
    @Column(name = "birth")
    private Date birth;
    @Column(name = "token")
    private String token;
    @Column(name = "roles")
    private String roles;
    public String getMssv() {
        return mssv;
    }



    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getFname() {
        return fname;
    }

    public String getLname() {
        return lname;
    }

    public String getGender() {
        return gender;
    }

    public Date getBirth() {
        return birth;
    }

    public void setMssv(String mssv) {
        this.mssv = mssv;
    }


    public void setEmail(String email) {
        this.email = email;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public String getRoles() {
        return roles;
    }

    public void setRoles(String roles) {
        this.roles = roles;
    }
}
