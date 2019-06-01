package com.xuecheng.manage_course.dao;

import com.xuecheng.framework.domain.course.TeachplanMediaPub;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TeachplanMediaPubRepository extends JpaRepository<TeachplanMediaPub,String> {
    //根据课程id删除记录
    long deleteByCourseId(String courseId);
}
