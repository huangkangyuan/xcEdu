package com.xuecheng.manage_course.dao;

import com.xuecheng.framework.domain.course.CourseMarket;
import com.xuecheng.framework.domain.course.Teacher;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CourseTeacherRepository extends JpaRepository<Teacher, String> {
}