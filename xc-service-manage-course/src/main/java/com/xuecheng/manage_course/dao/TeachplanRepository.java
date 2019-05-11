package com.xuecheng.manage_course.dao;

import com.xuecheng.framework.domain.course.Teachplan;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TeachplanRepository extends JpaRepository<Teachplan,String> {
    //SELECT * FROM teachplan WHERE courseid = '297e7c7c62b888f00162b8a7dec20000' AND parentid='0'
    List<Teachplan> findByCourseidAndParentid(String courseId, String parentId);
}
