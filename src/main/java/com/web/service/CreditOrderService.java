package com.web.service;

import com.web.bean.CreditOrder;
import com.web.dao.CreditOrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

// 充值
@Service
public class CreditOrderService {
    private final CreditOrderMapper creditOrderMapper;

    @Autowired
    public CreditOrderService(CreditOrderMapper creditOrderMapper) {
        this.creditOrderMapper = creditOrderMapper;
    }

    public int insertOrder(CreditOrder creditOrder) {
        return creditOrderMapper.insert(creditOrder);
    }

    public List<CreditOrder> selectCreditOrderByUser(Integer userId) {
        return creditOrderMapper.selectByUser(userId);
    }
}
