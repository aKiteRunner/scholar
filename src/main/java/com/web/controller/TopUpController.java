package com.web.controller;

import com.web.bean.CreditOrder;
import com.web.bean.User;
import com.web.service.CreditOrderService;
import com.web.service.UserService;
import com.web.utils.Setting;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

// 充值
@Controller
public class TopUpController {
    private final CreditOrderService creditOrderService;
    private final UserService userService;

    @Autowired
    public TopUpController(CreditOrderService creditOrderService, UserService userService) {
        this.creditOrderService = creditOrderService;
        this.userService = userService;
    }

    @RequestMapping(value = "/setting/topup", method = RequestMethod.POST)
    @ResponseBody
    // price 代表用户付款金额
    // credit 为兑换后的积分总额
    public HashMap<String, String> topUp(@RequestBody String json, HttpSession session) {
        if (session.getAttribute("logined") == null) {
            return null;
        }
        JSONObject jsonObject = new JSONObject(json);
        int price = jsonObject.getInt("price");
        Integer userId = (Integer) session.getAttribute("id");
        HashMap<String, String> map = new HashMap<>();
        try {
            BigDecimal money = new BigDecimal(price);
            int credit = money.multiply(new BigDecimal(Setting.CREDIT_PRICE)).intValue();
            CreditOrder order = new CreditOrder();
            order.setCredit(credit);
            order.setPrice(money);
            order.setTime(new Date());
            order.setUserId(userId);
            creditOrderService.insertOrder(order);
            User user = userService.getUser((userId));
            int oldCredit = user.getCredit();
            user.setCredit(credit + oldCredit);
            userService.updateCredit(user);
            userService.updateExpAndDegree(userService.getUser(userId).getUsername(), Setting.CREDIT_EXP);
            map.put("info", "操作成功");
        } catch (NumberFormatException e) {
            map.put("errorInfo", "金额不合法");
        }
        return map;
    }

    @RequestMapping(value = "/setting/topup", method = RequestMethod.GET)
    @ResponseBody
    // JSON返回所有订单，时间倒序
    public HashMap<String, List<CreditOrder>> topUp(HttpSession session) {
        if (session.getAttribute("logined") == null) {
            return null;
        }
        Integer userId = (Integer) session.getAttribute("id");
        HashMap<String, List<CreditOrder>> map = new HashMap<>();
        List<CreditOrder> orders = creditOrderService.selectCreditOrderByUser(userId);
        orders = orders.stream()
                .sorted(Comparator.comparing(CreditOrder::getTime).reversed())
                .collect(Collectors.toList());
        map.put("order", orders);
        return map;
    }
}
