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
@Table(name = "jspcategory")
public class Category {
    @Id
    @KeySql(useGeneratedKeys = true)
    private Integer categoryId;

    private String categoryName;
}
