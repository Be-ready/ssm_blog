package com.sswang.service.impl;

import com.sswang.entity.User;
import com.sswang.mapper.user.IUserMapper;
import com.sswang.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service
@Transactional(readOnly = true, rollbackFor=Exception.class)
public class UserServiceImpl implements IUserService {
    @Resource
    IUserMapper iUserMapper;


    @Override
    @Transactional(readOnly = false, propagation = Propagation.REQUIRED)
    public void save(User user) {
        iUserMapper.save(user);
    }

    @Override
    public User findOneById(Integer id) {
        return iUserMapper.findOneById(id);
    }

    @Override
    public int findByNameAndPwd(String username, String password) {

        User u = iUserMapper.findByNameAndPwd(username, password);

        // 判断是否能得到结果
        if(u!=null){
            // 如果id!=null,说明查到结果
            return 1;
        }else {
            return 0;
        }
    }
}
