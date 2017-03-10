package com.finartz.service;

import com.finartz.dao.UserDao;
import com.finartz.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ae on 07.03.2017.
 */
@Service
public class UserServiceImplementation implements UserService {

    @Autowired
    UserDao userDao;

    public List<User> listUser() {
        return userDao.listUser();
    }

    public void add(User user) {
        userDao.add(user);
    }

    public void update(User user) {
        userDao.update(user);
    }

    public void delete(User user) {
        userDao.delete(user);
    }

    public User findUserById(String id) {
        return userDao.findUserById(id);
    }
}
