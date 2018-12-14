package com.baizhi.dto;

import com.baizhi.entity.Person;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageDto implements Serializable{
	private Integer total;
	private List<Person> rows;

}
