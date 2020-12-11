package com.hy.mapper;

import com.hy.SqlProvider.SqlProviderDeme;
import com.hy.pojo.UserBean;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {
    /**
     * 查询所有user
     * @return
     */
    @Results({
            @Result(column = "role",property = "roleBean.role")
    })
    @Select(value = "select * from users u,role r where u.rid=r.id")
    public List<UserBean> queryAll();

    /**
     * 根据id查询user
     * @return
     */
    @Results({
            @Result(column = "role",property = "roleBean.role")
    })
    @Select(value="select * from users u,role r where u.rid=r.id and u.uid=#{value}")
    public UserBean queryById(int id);

    /**
     * 根据password,name,sex,联合查询
     * @param userBean
     * @return
     */
    @Results({
            @Result(column = "role",property = "roleBean.role")
    })
    @SelectProvider(type = SqlProviderDeme.class,method = "queryBYNames")
    public List<UserBean> queryByName(UserBean userBean);
    /**
     * 添加一条user
     * @param userBean
     */
    @SelectKey(statement ="select LAST_INSERT_ID()",before = true,resultType = int.class,keyProperty = "uid")
    @Insert(value = "insert into users values(null,null,#{password},#{name},#{sex},#{rid},null,null)")
    public void add(UserBean userBean);

    /**
     * 删除一条user
     * @param id
     */
    @Delete(value="delete from users where uid=#{value}")
    public void delete(int id);

    /**
     * 修改user
     * @param userBean
     */
    @Update(value="update users set password=#{password},name=#{name},sex=#{sex},rid=#{rid} where uid=#{uid}")
    public void update(UserBean userBean);

    @Select(value="select count(uid) from users")
    public int countPage();
}
