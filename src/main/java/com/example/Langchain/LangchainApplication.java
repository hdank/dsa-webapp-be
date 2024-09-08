package com.example.Langchain;


import com.theokanning.openai.completion.CompletionRequest;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;


@SpringBootApplication(exclude = {SecurityAutoConfiguration.class})
public class LangchainApplication {

	public static void main(String[] args) {
		SpringApplication.run(LangchainApplication.class, args);
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		String rawPassword = "123";
		String encodedPassword = encoder.encode(rawPassword);
		System.out.println(encodedPassword);

	}

}
