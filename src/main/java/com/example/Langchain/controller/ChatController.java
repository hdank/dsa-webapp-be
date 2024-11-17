package com.example.Langchain.controller;

import com.example.Langchain.config.ModelConfig;
import com.example.Langchain.entity.Chat;
import com.example.Langchain.entity.Message;
import com.example.Langchain.entity.User;
import com.example.Langchain.repository.ChatRepository;
import com.example.Langchain.repository.UserRepository;
import dev.ai4j.openai4j.Json;
import dev.langchain4j.model.chat.ChatLanguageModel;
import jakarta.annotation.Nullable;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.apache.tomcat.util.json.JSONParser;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.ai.chat.messages.UserMessage;
import org.springframework.ai.chat.model.ChatResponse;
import org.springframework.ai.chat.prompt.Prompt;
import org.springframework.ai.ollama.OllamaChatModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.bind.annotation.RequestBody;
import java.io.IOException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.*;


@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "http://localhost:4200/")
public class ChatController {

    @Autowired
    private ChatRepository chatRepository;

    @Autowired
    private UserRepository userRepository;

    @PostMapping("/conversation")
    public ResponseEntity<?> Message(@RequestBody Map<String, List<Map<String, String>>> request, @RequestParam String token) throws IOException {
        RestTemplate restTemplate = new RestTemplate();
        // Check if token is provided
        if (token == null || token.isEmpty()) {
            return ResponseEntity.badRequest().body("Missing token");
        }
        // Extract messages from the request body
        List<Map<String, String>> reqmes = request.get("messages");
        if (reqmes == null || reqmes.isEmpty()) {
            return ResponseEntity.badRequest().body("Messages cannot be empty");
        }
        // Set headers
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        // Extract messages from the request body
        List<Map<String, String>> messages = request.get("messages");

        // Check if messages list is not empty
        if (messages == null || messages.isEmpty()) {
            return ResponseEntity.badRequest().body("Messages cannot be empty");
        }

        String userMessage = messages.get(0).get("content");

        String jsonBody = String.format("{\"model\":\"%s\",\"messages\":[{\"role\":\"system\",\"content\":\"Bạn là một giảng viên đại học giải thích về thuật toán được người dùng nhập vào trong môn học cấu trúc dữ liệu và giải thuật cho người mới học lập trình.\"},{\"role\":\"user\",\"content\":\"%s\"}],\"temperature\":%.1f,\"max_tokens\":1000,\"stream\":false}",
                ModelConfig.unsloth.toString(), userMessage, 0.7);

        HttpEntity<String> httpEntity = new HttpEntity<>(jsonBody, headers);

        ResponseEntity<String> response = restTemplate.postForEntity("http://127.0.0.1:1234/v1/chat/completions", httpEntity, String.class);

        // Parse the JSON response
        JSONObject jsonObject = new JSONObject(response.getBody());
        JSONArray choices = jsonObject.getJSONArray("choices");
        if (!choices.isEmpty()) {
            JSONObject choice = choices.getJSONObject(0);
            JSONObject message = choice.getJSONObject("message");
            String content = message.getString("content");
            //Find the user id
            String user_id="";
            Optional<User> userOptional = userRepository.findByToken(token);
            if(userOptional.isPresent()){
                user_id = userOptional.get().getMssv();
            }
            // Save the message
            Chat chat = new Chat();
            chat.setId(jsonObject.getString("id"));
            chat.setModel(jsonObject.getString("model"));
            chat.setUser_id(user_id);

            chat.setMessages(content);
            chat.setQuestion(userMessage);
            LocalDate localDate = LocalDate.now();
            chat.setCreated_date(Date.from(localDate.atStartOfDay(ZoneId.systemDefault()).toInstant()));
            chatRepository.save(chat);

            return ResponseEntity.ok("[\n" + response.getBody() + "\n]");
        } else {
            return ResponseEntity.badRequest().body("No response from the API");
        }
    }
}
