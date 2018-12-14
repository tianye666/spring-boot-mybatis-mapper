package com.baizhi.service;

import com.baizhi.dto.PageDto;
import com.baizhi.entity.Category;
import com.baizhi.entity.Person;
import com.baizhi.entity.PersonExample;
import com.baizhi.mapper.CategoryMapper;
import com.baizhi.mapper.PersonMapper;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class PersonServiceImpl implements PersonService{
    @Autowired
    PersonMapper personMapper;
    @Autowired
    CategoryMapper categoryMapper;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Person> showAllPerson() {
        return personMapper.selectAll();
    }

    @Override
    public void addPerson(Person person) {
       personMapper.insert(person);
    }

    @Override
    public void deletePerson(Integer id) {
        personMapper.deleteByPrimaryKey(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Person queryOnePerson(Integer id) {
        return personMapper.selectByPrimaryKey(id);
    }

    @Override
    public void updatePerson(Person person) {
        personMapper.updateByPrimaryKey(person);
    }

    @Override
    public void deletePersons(List<Integer> list) {
        PersonExample personExample = new PersonExample();
        personExample.createCriteria().andIdIn(list);
        personMapper.deleteByExample(personExample);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Category> queryAllCategory() {
        return categoryMapper.selectAll();
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Integer getCategoryId(Integer id) {
        return categoryMapper.selectByPrimaryKey(id).getCategoryId();
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public PageDto showPersonByPage(Integer page, Integer size) {
        RowBounds rowBounds = new RowBounds((page-1)*size,size);
        List<Person> people = personMapper.selectByRowBounds(null, rowBounds);
        PageDto pageDto = new PageDto();
        pageDto.setTotal(personMapper.selectCount(null));
        pageDto.setRows(people);
        return pageDto;
    }
}
