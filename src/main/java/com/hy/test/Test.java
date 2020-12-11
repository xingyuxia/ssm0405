package com.hy.test;

import com.hy.mapper.UserMapper;
import com.hy.pojo.UserBean;
import com.hy.services.UserServices;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class Test {
    public static void main(String[] args) {
       ClassPathXmlApplicationContext context= new ClassPathXmlApplicationContext("spring.xml");
       UserMapper userServices=(UserMapper) context.getBean("userMapper");
       List<UserBean> list=userServices.queryAll();
       for(UserBean userBean:list){
           System.out.println(userBean);
       }
    }
}
