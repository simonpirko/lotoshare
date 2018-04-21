package com.lotoshare;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableTransactionManagement
public class LotoshareApplication {
    public static void main(String[] args) {
        SpringApplication.run(LotoshareApplication.class, args);
    }
}
