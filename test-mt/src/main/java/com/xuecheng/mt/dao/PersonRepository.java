package com.xuecheng.mt.dao;
 
import com.xuecheng.mt.domain.AddressList;
import com.xuecheng.mt.domain.Person;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface PersonRepository extends JpaRepository<Person,Long> {
 
}