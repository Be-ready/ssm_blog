package com.sswang.mapper.user;

import com.sswang.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface IUserMapper {

    // 保存用户
    void save(User user);

    // 按id查找用户
    User findOneById(Integer id);

    /**
     *  按用户名和密码查找
     *  @Param 使用后，多个参数不必再xml中使用ResultMap
     */
    User findByNameAndPwd(@Param("username")String username,
                          @Param("password")String password);

}
