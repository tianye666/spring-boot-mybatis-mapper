package com.baizhi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import tk.mybatis.spring.annotation.MapperScan;

@SpringBootApplication
@MapperScan("com.baizhi.mapper")
public class SpringBootMybatisMapperApplication {

    public static void main(String[] args) {
        System.out.println("666666");
        SpringApplication.run(SpringBootMybatisMapperApplication.class, args);
    }
}
