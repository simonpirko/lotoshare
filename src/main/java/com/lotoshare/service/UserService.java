package com.lotoshare.service;

import com.lotoshare.entity.User;

public interface UserService {
    User findByCook(String cook);
    User getUserById(Long id);
    void saveUser(User user);
}
