package com.bjpowernode.controller;


import com.bjpowernode.domain.Student;
import com.bjpowernode.service.StudentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
//RequestMapping在类上，绑定类和地址，地址要加斜杠，有句话叫做前端不加后端加
@RequestMapping("/student")
public class StudentController {
    //声明service
    //自动注入
    @Resource
    private StudentService service;
    //注册学生
    //RequestMapping在方法上，绑定方法和地址，地址要加斜杠，有句话叫做前端不加后端加
    @RequestMapping("/addStudent.do")
    //参数输入对象则前端参数传来的值会自动赋予给创建的对象（参数）所对应的属性（参数名和前端的name必须一样）自动封装对象

    public ModelAndView addStudent(Student student){
        //创建数据视图对象,用于处理数据也页面的转发
        ModelAndView mv = new ModelAndView();
        //默认tips是注册失败
        String tips ="注册失败";
        //调用service处理student
        int nums= service.addStudent(student);

        if (nums>0){
            //返回值大于0注册成功
            tips="学生【"+student.getName()+"】注册成功";
        }
        //添加数据,储存在request域中
        mv.addObject("tips",tips);
        //指定结果页面,配准文件中必须添加前缀和后缀
        mv.setViewName("result");
        return mv;

    }


    @RequestMapping("/queryStudent.do")
    //表示返回的是一个Json
    @ResponseBody
    //处理查询,响应ajax
    public List<Student> queryStudent(){
        //参数检查,简单的数据处理
        List<Student> students= service.findStudents();
        //将查询结果返回，会自动被框架转成json数组
        return students;
    }

}
