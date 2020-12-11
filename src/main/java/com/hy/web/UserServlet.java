package com.hy.web;

import com.hy.pojo.JsonPage;
import com.hy.pojo.UserBean;
import com.hy.services.RoleServices;
import com.hy.services.UserServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.List;

@Controller
public class UserServlet {
    @Autowired
    public UserServices userServices;
    @Autowired
    public RoleServices roleServices;

    public void setUserServices(UserServices userServices) {
        this.userServices = userServices;
    }

/*    @RequestMapping("/queryAll.do")
    public ModelAndView queryAll1(String page){
        if(page == null){
            page="1";
        }
        ModelAndView modelAndView=new ModelAndView();
        List list=userServices.queryAll(page);
        modelAndView.addObject("list",list);
        modelAndView.addObject("page",Integer.parseInt(page));
        modelAndView.setViewName("/QueryAllUser.jsp");
        return modelAndView;
    }*/
    @RequestMapping("/queryAll.do")
    @ResponseBody
    public JsonPage queryAll(int page,int limit ,UserBean userBean){
      JsonPage jsonPage=  new JsonPage();
      jsonPage.setData(userServices.queryAll(page, limit,userBean));
      jsonPage.setCode(0);
      jsonPage.setCount(userServices.countPage());
      jsonPage.setMsg("hallo word");
      return jsonPage;
    }
    @RequestMapping("/queryById.do")
    public ModelAndView queryById(@RequestParam(value = "id") Integer id){
        System.out.println("password:"+id);
        ModelAndView modelAndView=new ModelAndView();
        UserBean userBean=userServices.queryById(id);
        List rlist=roleServices.queryAll();
        modelAndView.addObject("ulist",userBean);
        modelAndView.addObject("rlist",rlist);
        modelAndView.setViewName("/updateUser.jsp");
        return modelAndView;
    }
   /* @RequestMapping("/delete.do")
    public ModelAndView delete(@RequestParam(value = "uid") Integer id){
        System.out.println("id:"+id);
        ModelAndView modelAndView=new ModelAndView();
        userServices.delete(id);
        modelAndView.setViewName("/queryAll.do");
        return modelAndView;
    }*/
    @RequestMapping("/delete.do")
    @ResponseBody
    public boolean delete(Integer uid){
        System.out.println("id:"+uid);
        try {
            userServices.delete(uid);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
   /* @RequestMapping("/add.do")
    public ModelAndView add(UserBean userBean){
        System.out.println("====="+userBean);
        ModelAndView modelAndView=new ModelAndView();
        userServices.add(userBean);
        modelAndView.setViewName("/queryAll.do");
        return modelAndView;
    }*/
    @RequestMapping("/add.do")
    @ResponseBody
    public boolean add(UserBean userBean){
        try {
            userServices.add(userBean);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    @RequestMapping("/update.do")
    public ModelAndView update(UserBean userBean){
        ModelAndView modelAndView=new ModelAndView();
        userServices.update(userBean);
        modelAndView.setViewName("/queryAll.do");
        return modelAndView;
    }
   /* @RequestMapping("/deleteAll.do")
    public ModelAndView  deleteAll(Integer[] ids){
        ModelAndView modelAndView=new ModelAndView();
        for (int i=0;i<ids.length;i++) {
            //userServices.delete(ids[i]);
            System.out.println(ids[i]);
        }
        modelAndView.setViewName("/queryAll.do");
        return modelAndView;
    }*/
    @RequestMapping("/deleteAll.do")
    @ResponseBody
    public boolean deleteAll(String str){
       List a= Arrays.asList(str.split(","));
        try {
            for (int i=0;i<a.size();i++){
               //System.out.println(a.get(i));
               userServices.delete(Integer.parseInt(a.get(i).toString()));
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

   /* @RequestMapping("/queryByName.do")
    public ModelAndView  queryByName(UserBean userBean){
        ModelAndView modelAndView=new ModelAndView();
        List<UserBean> list=userServices.queryByName(userBean);
        modelAndView.addObject("list",list);
        modelAndView.setViewName("/QueryAllUser.jsp");
        return modelAndView;
    }*/
       @RequestMapping("/queryByName.do")
       @ResponseBody
       public JsonPage  queryByName(UserBean userBean){
           JsonPage jsonPage=  new JsonPage();
           jsonPage.setData(userServices.queryByName(userBean));
           jsonPage.setCode(0);
           jsonPage.setCount(userServices.countPage());
           jsonPage.setMsg("hallo word");
           return jsonPage;
       }
}
