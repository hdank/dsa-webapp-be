//package com.example.Langchain.service;
//import com.example.Langchain.entity.User;
//import com.example.Langchain.repository.UserRepository;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.stereotype.Service;
//import org.springframework.security.core.userdetails.User.UserBuilder;
//@Service
//public class CustomUserDetailsService implements UserDetailsService {
////    private final UserRepository userRepository;
////
////    public CustomUserDetailsService(UserRepository repo){
////        this.userRepository = repo;
////    }
////
////    @Override
////    public UserDetails loadUserByUsername(String mssv) throws UsernameNotFoundException {
////        User user = userRepository.findByMssv(mssv);
////        if(user == null){
////            throw new UsernameNotFoundException("User not found");
////        }
////        return org.springframework.security.core.userdetails.User.builder()
////                .username(user.getMssv())
////                .password(user.getPassword())
////                .roles("USER")
////                .build();
////    }
//}
