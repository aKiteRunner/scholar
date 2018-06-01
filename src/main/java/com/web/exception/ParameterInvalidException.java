package com.web.exception;

// 参数错误时，抛出异常
public class ParameterInvalidException extends Exception {
    public ParameterInvalidException() {
        super();
    }

    public ParameterInvalidException(String message) {
        super(message);
    }
}
