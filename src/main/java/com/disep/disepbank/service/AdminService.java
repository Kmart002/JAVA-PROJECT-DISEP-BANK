package com.disep.disepbank.service;


import com.disep.disepbank.model.User;

public interface AdminService
{
    boolean fundAccount(double amount, String accountNo);
    int getUserCount();
    double getTransactionsVolume();
    boolean verifyUser(String email);
    User updateUserDetails(User user, String email);
}
