package com.web.controller;

import com.web.bean.CreditOrder;
import com.web.exception.ParameterInvalidException;
import com.web.service.TopUpService;
import com.web.service.UserService;
import com.web.utils.Setting;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.Date;

// 充值
@Controller
public class TopUpController {
    private final TopUpService topUpService;
    private final UserService userService;

    @Autowired
    public TopUpController(TopUpService topUpService, UserService userService) {
        this.topUpService = topUpService;
        this.userService = userService;
    }

    @ResponseBody
    @RequestMapping(value = "/topup/{userId}", method = RequestMethod.POST)
    // price 代表用户付款金额
    // credit 为兑换后的积分总额
    public String topUp(@RequestParam(value = "price") String price, @PathVariable(value = "userId") Integer userId, Model model) {
        try {
            BigDecimal money = new BigDecimal(price);
            if (!userService.userExist(userId)) {
                throw new ParameterInvalidException("用户不存在");
            }
            int credit = money.multiply(new BigDecimal(Setting.CREDIT_PRICE)).intValue();
            CreditOrder order = new CreditOrder();
            order.setCredit(credit);
            order.setPrice(money);
            order.setTime(new Date());
            order.setUserId(userId);
            topUpService.insertOrder(order);
            model.addAttribute("info", "操作成功");
        } catch (NumberFormatException e) {
            model.addAttribute("errorInfo", "金额不合法");
        } catch (ParameterInvalidException e) {
            model.addAttribute("errorInfo", e.getMessage());
        }
        return "topUpInfo";
    }
}
