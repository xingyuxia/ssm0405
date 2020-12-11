package com.hy.mapper;

import com.hy.pojo.RoleBean;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface RoleMapper {
    @Results({
            @Result(column = "id",property = "rid")
    })
    @Select(value = "select * from role")
    public List<RoleBean> queryAll();
}
