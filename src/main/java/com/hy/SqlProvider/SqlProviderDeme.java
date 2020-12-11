package com.hy.SqlProvider;

import com.hy.pojo.UserBean;

public class SqlProviderDeme {
    public String queryBYNames(UserBean userBean){
        StringBuffer stringBuffer= new StringBuffer("select * from users u,role r where u.rid=r.id");
        if(userBean.getPassword() != null && userBean.getPassword()!=""){
            stringBuffer.append("  and u.password=#{password}");
        }
        if(userBean.getName() !=null && userBean.getName()!=""){
            stringBuffer.append(" and u.name=#{name}");
        }
        if(userBean.getSex()!=null && userBean.getSex()!=""){
            stringBuffer.append(" and u.sex=#{sex}");
        }
        return  stringBuffer.toString();
    }

}
