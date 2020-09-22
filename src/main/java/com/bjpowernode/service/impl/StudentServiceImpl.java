package com.bjpowernode.service.impl;

import com.bjpowernode.dao.StudentDao;
import com.bjpowernode.domain.Student;
import com.bjpowernode.service.StudentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
//加注解@Service 创建Dao对象
@Service
public class StudentServiceImpl implements StudentService {
    //引用类型的自动注入
    @Resource
    //声明StudentDao
    private StudentDao studentDao;
    @Override
    public int addStudent(Student student) {
        int nums = studentDao.insertStudent(student);
        return nums;
    }

    @Override
    public List<Student> findStudents() {

        return studentDao.selectStudents();
    }
}
