package com.example.Langchain.controller;

import com.example.Langchain.config.RoleConfig;
import com.example.Langchain.entity.Chat;
import com.example.Langchain.entity.Conversation;
import com.example.Langchain.entity.User;
import com.example.Langchain.repository.ChatRepository;
import com.example.Langchain.repository.ConversationRepository;
import com.example.Langchain.repository.UserRepository;
import com.example.Langchain.service.AuthResponse;
import com.example.Langchain.service.AuthService;
import com.example.Langchain.service.ConversationService;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.jetbrains.annotations.NotNull;
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

    @Autowired
    private ConversationRepository conversationRepository;

    @Autowired
    private ConversationService conversationService;

//    private final AuthenticationManager authenticationManager;

    //check mssv va password
    @PostMapping("/login")
    public ResponseEntity<?> login(@NotNull @RequestBody User userData) {
        User user = authService.login(userData.getMssv(), userData.getPassword());
        if (user == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }
        return ResponseEntity.ok(new AuthResponse(user.getToken(), user.getMssv(), user.getRole(), userData));

    }

    @PostMapping("/sign-up")
    public ResponseEntity<?> signup(@RequestBody User userData) {
        if (userRepository.findByMssv(userData.getMssv()).isEmpty()) {
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

            return ResponseEntity.ok(new AuthResponse(token, user.getMssv(), user.getRole(), user));
        } else {
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
    public ResponseEntity<?> autologin(@RequestParam String token) {
        System.out.println("Received token: " + token);  // Debug print
        String user = authService.getUserBySessionToken(token);
        System.out.println("User: " + user);// Debug print
        if (user != null) {
            return ResponseEntity.ok(user);
        }
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
    }

    @GetMapping("/home")
    public ResponseEntity<String> homePage() {
        return ResponseEntity.ok("home");
    }

    @GetMapping("/logout")
    public ResponseEntity<?> logout(@RequestParam String token) {
        Optional<User> userOptional = userRepository.findByToken(token);
        if (userOptional.isPresent()) {
            User user = userOptional.get();
            user.setToken(null);
            System.out.println("User: " + user.getMssv() + ", token: " + user.getToken());
            userRepository.save(user);
            return ResponseEntity.ok("Logged out successfully");
        }

        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Invalid token");
    }

    @GetMapping("/is-admin-or-user")
    public ResponseEntity<?> IsAdminOrUser(@RequestParam String token) {
        Optional<User> userOptional = userRepository.findByToken(token);
        if (userOptional.isPresent()) {
            String role = userOptional.get().getRole();
            Map<String, String> response = new HashMap<>();
            response.put("role", role);
            return ResponseEntity.ok(response);
        }
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Invalid token");
    }

    @GetMapping("/get-all-user")
    public ResponseEntity<?> GetAllUser() {
        List<User> userList = userRepository.findAll();
        return ResponseEntity.ok(userList);
    }

    @GetMapping("/get-all-user-chat")
    public ResponseEntity<?> GetAllUserChat() {
        List<Chat> chatList = chatRepository.findAll();
        return ResponseEntity.ok(chatList);
    }

    @GetMapping("/get-conversations")
    public ResponseEntity<List<Conversation>> GetUserConversation(@RequestParam String id) {
        System.out.print("called get conversation");
        System.out.printf(id);
        List<Conversation> conversations = conversationService.getConversationsById(id);
        if (conversations.isEmpty()) {
            return ResponseEntity.ok().body(new ArrayList<Conversation>()); // Danh sách trống
        } else {
            return ResponseEntity.ok(conversations);  // Trả về danh sách Conversation
        }
    }

    @PostMapping("/set-new-conversations")
    public ResponseEntity<?> SetNewConversation(@RequestBody Conversation conversationData) {
        try {
            Conversation newConversation = new Conversation();
            newConversation.setId(conversationData.getId());
            newConversation.setTitle(conversationData.getTitle());
            newConversation.setUserId(conversationData.getUserId());
            conversationRepository.save(newConversation);
            return ResponseEntity.ok(newConversation);
        } catch (Exception e) {
            // Log lỗi và trả về thông báo lỗi
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error saving conversation");
        }
    }

    @GetMapping("/get-conversation")
    public ResponseEntity<?> getConversation(@RequestParam String id) {
        Optional<Conversation> conversationOptional = conversationRepository.findById(id);
        if (conversationOptional.isPresent()){
            return ResponseEntity.ok(conversationOptional);
        }
            return null;
    }

    @GetMapping("/rename-conversation")
    public ResponseEntity<?> renameConversation(@RequestParam String id, @RequestParam String name) {
        Optional<Conversation> conversationOptional = conversationRepository.findById(id);
        if (conversationOptional.isPresent()){
            try {
                Conversation Conversation = conversationOptional.get();
                Conversation.setTitle(name);
                conversationRepository.save(Conversation);
                return ResponseEntity.ok(Conversation);
            } catch (Exception e) {
                // Log lỗi và trả về thông báo lỗi
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error saving conversation");
            }
        }
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Conversation not found");
    }

    @DeleteMapping("/delete-conversation")
    public ResponseEntity<?> DeleteAConversationApi(@RequestParam String id) {
        try {
            Optional<Conversation> conversationOptional = conversationRepository.findById(id);
            if (conversationOptional.isPresent()) {
                conversationRepository.deleteById(conversationOptional.get().getId());
                return ResponseEntity.ok("Delete succeeded");
            } else {
                return ResponseEntity.status(HttpStatus.CONFLICT).body("No conversation with this id");
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Invalid request format");
        }
    }

    @GetMapping("/get-user-by-token")
    public ResponseEntity<Optional<User>> getUserBySessionToken(@RequestParam String token){
        Optional<User> userOptional = userRepository.findByToken(token);
        if(userOptional.isPresent()){
            return ResponseEntity.ok(userOptional);
        };
        return null;
    }
}
