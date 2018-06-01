package com.web.controller;

//import com.web.service.TopUpService;
import com.web.utils.Setting;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;

// 充值
//@Controller
//public class TopUpController {
//    @Autowired
//    private TopUpService topUpService;
//
//    @ResponseBody
//    @RequestMapping(value = "/topup/{id}", method = RequestMethod.POST)
//    public String topUp(@RequestParam(value = "price") String price, Model model) {
//        try {
//            BigDecimal money = new BigDecimal(price);
//            money = money.multiply(new BigDecimal(Setting.CREDIT_PRICE));
//            topUpService.insertOrder();
//        } catch (NumberFormatException e) {
//
//        }
//        return "topUpInfo";
//    }
//}
