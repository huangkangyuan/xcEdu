package com.xuecheng.ucenter.dao;

import com.xuecheng.framework.domain.ucenter.XcUser;
import org.springframework.data.jpa.repository.JpaRepository;

public interface XcUserRepository extends JpaRepository<XcUser,String> {
    //根据账号查询用户信息
    XcUser findByUsername(String username);
}
