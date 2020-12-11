package com.hy.services;

import com.github.pagehelper.PageHelper;
import com.hy.mapper.UserMapper;
import com.hy.pojo.UserBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("/userServices")
@Transactional
public class UserServices{
    @Autowired
    public UserMapper userMapper;
    /**
     * 查询所有user
     * @return
     */
    public List<UserBean> queryAll(int page,int count,UserBean userBean){
        PageHelper.startPage(page,count,true);
        return userMapper.queryByName(userBean);
    }

    /**
     * 根据id查询user信息
     * @param uid
     * @return
     */
    public UserBean queryById(int uid){
        return userMapper.queryById(uid);
    }
    /**
     * 根据password,name,sex,联合查询
     * @param userBean
     * @return
     */
    public List<UserBean> queryByName(UserBean userBean){
        return userMapper.queryByName(userBean);
    }
    /**
     * 添加user
     * @param userBean
     */
    public void add(UserBean userBean){
        userMapper.add(userBean);
    }

    /**
     * 删除一条user
     * @param uid
     */
    public void delete(int uid){
        userMapper.delete(uid);
    }

    /**
     * 修改一条user
     * @param userBean
     */
    public void update(UserBean userBean){
        userMapper.update(userBean);
    }
    public int countPage(){
        return userMapper.countPage();
    }

}
