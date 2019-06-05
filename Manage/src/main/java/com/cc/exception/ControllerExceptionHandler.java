package com.cc.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cc.util.ManageResult;



@ControllerAdvice
public class ControllerExceptionHandler {
	@ExceptionHandler(Exception.class)
	@ResponseBody
	public ManageResult handleException(Exception e){
		System.out.println("exception");
		e.printStackTrace();
		return new ManageResult(e);
	}	
	@ExceptionHandler(RuntimeException.class)
	@ResponseBody
	public ManageResult handleException(RuntimeException e){
		System.out.println("runtime exception");
		e.printStackTrace();
		return new ManageResult(e);
	}
}








