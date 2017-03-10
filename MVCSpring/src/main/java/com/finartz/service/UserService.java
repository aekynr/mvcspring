package com.finartz.service;

import com.finartz.model.User;

import java.util.List;

/**
 * Created by ae on 07.03.2017.
 */
public interface UserService {
    public List<User> listUser();

    public void add(User user);

    public void update(User user);

    public void delete(User user);

    public User findUserById(String id);
}
