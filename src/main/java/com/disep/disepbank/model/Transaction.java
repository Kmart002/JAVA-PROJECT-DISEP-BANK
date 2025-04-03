package com.disep.disepbank.model;

import lombok.*;

import java.time.LocalDateTime;

@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Transaction
{
    private int transactionID;
    private TransactionTypes transType;
    private String accountNo;
    private String senderID;
    private String receiverID;
    private String status;
    private String dateCreated;
    private double amount;
}
