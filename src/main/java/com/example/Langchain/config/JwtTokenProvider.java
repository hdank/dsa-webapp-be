package com.example.Langchain.config;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;
import org.springframework.boot.autoconfigure.security.oauth2.resource.OAuth2ResourceServerProperties;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;

import java.security.Key;
import java.util.Date;

public class JwtTokenProvider {
//    private final Key key;
//    public JwtTokenProvider() {
//        this.key = Keys.secretKeyFor(SignatureAlgorithm.HS512);
//    }
//    private static final long EXPIRATION_TIME = 864_000_000; // 10 days
//
//    public String generateToken(Authentication authentication){
//        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
//        Date now = new Date();
//        Date expiryDate = new Date(now.getTime() +EXPIRATION_TIME);
//        return Jwts.builder()
//                .setSubject(userDetails.getUsername())
//                .setIssuedAt(now)
//                .setExpiration(expiryDate)
//                .signWith(key)
//                .compact();
//    }
//    public String getUsernameFromJWT(String token){
//        Claims claims = Jwts.parserBuilder()
//                .setSigningKey(key)
//                .build()
//                .parseClaimsJws(token)
//                .getBody();
//        return claims.getSubject();
//    }
//    public boolean validateToken(String authToken){
//        try{
//            Jwts.parserBuilder().setSigningKey(key).build().parseClaimsJws(authToken);
//            return true;
//        }
//        catch (JwtException | IllegalArgumentException e){
//            System.out.print(e.getMessage());
//            return false;
//        }
//    }
}
