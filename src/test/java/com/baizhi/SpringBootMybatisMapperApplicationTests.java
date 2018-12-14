package com.baizhi;

import com.baizhi.entity.User;
import com.baizhi.entity.UserExample;
import com.baizhi.mapper.UserMapper;
import org.apache.ibatis.session.RowBounds;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class SpringBootMybatisMapperApplicationTests {

    @Autowired
    UserMapper userMapper;
    @Test
    public void contextLoads() {
        List<User> users = userMapper.selectAll();
       // userMapper.insert(new User(null,"小明","123456","狗蛋"));
        for (User user : users) {
           // System.out.println(user);
        }
        UserExample userExample = new UserExample();
        userExample.createCriteria().andUserIdBetween(1,5);
        List<User> users1 = userMapper.selectByExample(userExample);
        for (User user : users1) {
            System.out.println(user);
        }

    }

    @Test
    public void test2(){
        UserExample userExample = new UserExample();
        RowBounds rowBounds = new RowBounds(2,4);
        List<User> users = userMapper.selectByRowBounds(new User(), rowBounds);
        for (User user : users) {
            System.out.println(user);
        }

    }

}
