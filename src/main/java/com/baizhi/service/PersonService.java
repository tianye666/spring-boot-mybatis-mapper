package com.baizhi.service;

import com.baizhi.dto.PageDto;
import com.baizhi.entity.Category;
import com.baizhi.entity.Person;

import java.util.List;

public interface PersonService {
	public List<Person> showAllPerson();
	public PageDto showPersonByPage(Integer page, Integer size);
	public void addPerson(Person person);
	public void deletePerson(Integer id);
	public Person queryOnePerson(Integer id);
	public void updatePerson(Person person);
	public void deletePersons(List<Integer> list);

	public List<Category> queryAllCategory();
	public Integer getCategoryId(Integer id);
}
