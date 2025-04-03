package com.disep.disepbank.model;

import lombok.*;

import java.time.LocalDateTime;

@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class User
{
    private double balance;
    private String firstName;
    private String lastName;
    private String phoneNo;
    private String email;
    private String gender;
    private String accountNo;
    private String accountType;
    private LocalDateTime dateCreated;
    private boolean status;
}
