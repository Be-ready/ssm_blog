package com.sswang.service;

import com.sswang.entity.User;

public interface IUserService {

    void save(User user);
    User findOneById(Integer id);
    int findByNameAndPwd(String username, String password);
}
