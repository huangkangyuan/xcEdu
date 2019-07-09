package com.xuecheng.mt.controller;

import com.xuecheng.mt.dao.UserRepository;
import com.xuecheng.mt.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.Optional;


@RestController
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/user/{id}")
    public User findById(@PathVariable Long id) {
        Optional<User> userOptional = userRepository.findById(id);
        if (userOptional.isPresent()) {
            return userOptional.get();
        }
        return null;
    }

    @GetMapping("/user/add/")
    public void addUser() {
        User user = new User();
        user.setAge(1);
        user.setUsername("黄康远");
        userRepository.save(user);
    }
}