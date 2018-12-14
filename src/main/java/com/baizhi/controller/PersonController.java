package com.baizhi.controller;

import com.baizhi.dto.ListDto;
import com.baizhi.dto.PageDto;
import com.baizhi.entity.Category;
import com.baizhi.entity.Person;
import com.baizhi.service.PersonService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/person")
@Log4j
public class PersonController {
    @Autowired
    private PersonService service;

    @RequestMapping("showPersonList")
    public List<Person> showPersonList(){
        System.out.println(service.showAllPerson());
        return service.showAllPerson();
    }


    @RequestMapping("showPersonByPage")
    public PageDto showPersonByPage(Integer page , Integer rows){
        log.debug("1234455");
        System.out.println("6666666");
        return service.showPersonByPage(page, rows);
    }

    @RequestMapping("addPerson")
    public void addPerson(Person Person){
        System.out.println(Person);
        service.addPerson(Person);
    }
    @RequestMapping("deletePerson")
    public void deletePerson(Integer id){
        service.deletePerson(id);
    }

    @RequestMapping("queryOnePerson")
    public Person queryOnePerson(Integer id){
        System.out.println(service.queryOnePerson(id));
        return service.queryOnePerson(id);
    }
    @RequestMapping("updatePerson")
    public void updatePerson(Person Person){
        System.out.println(Person);
        service.updatePerson(Person);
    }

    @RequestMapping("showAllCategory")
    public List<Category> showAllCategory(){
        return service.queryAllCategory();
    }
    @RequestMapping("getCategoryId")
    public  Integer getCategoryId(Integer id){
        return service.getCategoryId(id);
    }

    @RequestMapping("deletePersons")
    public  void deletePersons(ListDto ids){
        service.deletePersons(ids.getIds());
    }
}
