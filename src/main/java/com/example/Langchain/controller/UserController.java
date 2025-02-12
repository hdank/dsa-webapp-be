package com.example.Langchain.controller;

import com.example.Langchain.config.RoleConfig;
import com.example.Langchain.entity.Chat;
import com.example.Langchain.entity.User;
import com.example.Langchain.repository.ChatRepository;
import com.example.Langchain.repository.UserRepository;
import com.example.Langchain.service.AuthResponse;
import com.example.Langchain.service.AuthService;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
@RequestMapping("/user")
@RequiredArgsConstructor


public class UserController {
    @Autowired
    private AuthService authService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ChatRepository chatRepository;

    @Autowired
    private ObjectMapper objectMapper;

//    private final AuthenticationManager authenticationManager;

    //check mssv va password
    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody User userData){
        String token  = authService.login(userData.getMssv(), userData.getPassword());
        if (token == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }
        System.out.println("Generated token: " + token); // Debugging output
        return ResponseEntity.ok(new AuthResponse(token, userData));

    }
    @PostMapping("/sign-up")
    public ResponseEntity<?> signup(@RequestBody User userData){
        if(userRepository.findByMssv(userData.getMssv()).isEmpty()){
            User user = new User();
            user.setMssv(userData.getMssv());
            user.setEmail(userData.getEmail());
            user.setFname(userData.getFname());
            user.setLname(userData.getLname());

            //Encode user password
            PasswordEncoder encoder = new BCryptPasswordEncoder();
            String encodedPassword = encoder.encode(userData.getPassword());
            user.setPassword(encodedPassword);
            user.setPhoneNumber(userData.getPhoneNumber());
            user.setGender(userData.getGender());
            user.setBirth(userData.getBirth());
            String token = UUID.randomUUID().toString();
            user.setToken(token);
            user.setRole(RoleConfig.user.toString());
            userRepository.save(user);

            return ResponseEntity.ok(new AuthResponse(token, user));
        }
        else{
            return ResponseEntity.status(HttpStatus.CONFLICT).body("Already have a user with this mssv");
        }
    }

    @DeleteMapping("/delete-a-user")
    public ResponseEntity<?> DeleteAUserApi(@RequestBody String requestBody) {
        try {
            // Extract mssv from the JSON string
            String mssv = objectMapper.readTree(requestBody).get("mssv").asText();
            System.out.println(mssv);

            Optional<User> user = userRepository.findByMssv(mssv);
            System.out.println(user);

            if (user.isPresent()) {
                userRepository.deleteById(user.get().getMssv());
                return ResponseEntity.ok("Delete succeeded");
            } else {
                return ResponseEntity.status(HttpStatus.CONFLICT).body("No user with this mssv");
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Invalid request format");
        }
    }



    @GetMapping("/auto-login")
    public ResponseEntity<?> autologin(@RequestParam String token){
        System.out.println("Received token: " + token);  // Debug print
        String user = authService.getUserBySessionToken(token);
        System.out.println("User: " + user);// Debug print
        if(user!= null){
            return ResponseEntity.ok(user);
        }
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
    }

    @GetMapping("/home")
    public ResponseEntity<String> homePage(){
        return ResponseEntity.ok("home");
    }

    @GetMapping("/logout")
    public ResponseEntity<?> logout(@RequestParam String token) {
        Optional<User> userOptional = userRepository.findByToken(token);
        if(userOptional.isPresent()){
            User user = userOptional.get();
            user.setToken(null);
            System.out.println("User: "+user.getMssv()+ ", token: "+user.getToken());
            userRepository.save(user);
            return ResponseEntity.ok("Logged out successfully");
        }

        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Invalid token");
    }
    @GetMapping("/is-admin-or-user")
    public ResponseEntity<?> IsAdminOrUser(@RequestParam String token){
        Optional<User> userOptional = userRepository.findByToken(token);
        if(userOptional.isPresent()){
            String role = userOptional.get().getRole();
            Map<String, String> response = new HashMap<>();
            response.put("role", role);
            return ResponseEntity.ok(response);
        }
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Invalid token");
    }
    @GetMapping("/get-all-user")
    public ResponseEntity<?> GetAllUser(){
        List<User> userList = userRepository.findAll();
        return ResponseEntity.ok(userList);
    }
    @GetMapping("/get-all-user-chat")
    public ResponseEntity<?> GetAllUserChat(){
        List<Chat> chatList = chatRepository.findAll();
        return ResponseEntity.ok(chatList);
    }
}
