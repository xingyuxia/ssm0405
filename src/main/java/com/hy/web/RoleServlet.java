package com.hy.web;

import com.hy.pojo.RoleBean;
import com.hy.services.RoleServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class RoleServlet {
    @Autowired
    private RoleServices roleServices;
    @RequestMapping("/queryAll1.do")
    @ResponseBody
    public List<RoleBean> queryAll1(){
        return roleServices.queryAll();
    }
}
