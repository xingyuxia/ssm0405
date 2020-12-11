package com.hy.services;

import com.hy.mapper.RoleMapper;
import com.hy.pojo.RoleBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("/roleServices")
public class RoleServices {
    @Autowired
    public RoleMapper roleMapper;
    public List<RoleBean> queryAll(){
       return roleMapper.queryAll();
    }
}
