package com.example.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.*;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.Employee;
import com.example.service.EmployeeService;
import com.google.gson.Gson;

@Controller
public class EmployeeController {

	@Autowired
	EmployeeService employeeService;

	@RequestMapping(path="/", method=RequestMethod.GET)
	public String goHome(){
		
//		List<Employee> list = employeeService.getAllEmployees();
//		JSONObject jsonObj = new JSONObject(list);
		return "index1";
	}

	@RequestMapping(path="/employees", method=RequestMethod.GET)
//	@ResponseBody
	public void getEmployees(HttpServletRequest request, HttpServletResponse response){
		
		List<Employee> list = employeeService.getAllEmployees();
//		JSONObject jsonObj = new JSONObject(list);
		String json = new Gson().toJson(list);
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.print(json);
//		return list;
	}
}
