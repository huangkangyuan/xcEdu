package com.xuecheng.mt.dao;
 
import com.xuecheng.mt.domain.AddressList;
import com.xuecheng.mt.domain.Person;
import com.xuecheng.mt.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface AddressListRepository extends JpaRepository<AddressList,Long> {
 
}