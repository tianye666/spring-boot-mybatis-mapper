package com.baizhi.entity;

import com.alibaba.fastjson.annotation.JSONField;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;

@Table(name = "jspperson")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Person {
    @KeySql(useGeneratedKeys = true)
    @Id
    private Integer id;

    private String name;

    private String mobile;

    private String telphone;

    private String email;

    private String city;

    @DateTimeFormat(pattern = "yyyy/MM/dd")
    @JSONField(format = "yyyy/MM/dd")
    private Date birthday;

    private Integer cateid;

    @Transient
    private Category catrgory;

}
