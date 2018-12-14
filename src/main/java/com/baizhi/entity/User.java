package com.baizhi.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Id;
import javax.persistence.Table;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "jspuser2")
public class User {
    @Id
    @KeySql(useGeneratedKeys = true)
    private Integer userId;
    private String username;
    private String password;
    private String realname;
}
