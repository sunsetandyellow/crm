package com.fh.controller.system.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.system.Employee;
import com.fh.entity.system.Menu;
import com.fh.service.system.employee.EmployeeManager;
import com.fh.util.AppUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;

@Controller
@RequestMapping(value="/employee")
public class EmployeeController extends BaseController{
	
	@Resource(name="employeeService")
	private EmployeeManager employeeService;
	/**
	 * 显示员工列表
	 * @param model
	 * @return
	 */
	@RequestMapping
	public ModelAndView list()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			List<Employee> employeeList = employeeService.listAll();
			mv.addObject("employeeList", employeeList);
			mv.setViewName("system/employee/menu_list");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 请求新增员工
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/toAdd")
	public ModelAndView toAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		try{
			PageData pd = new PageData();
			pd = this.getPageData();
			mv.addObject("MSG", "add");	
			mv.setViewName("system/employee/menu_edit");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 保存员工信息
	 * @param menu
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/add")
	public ModelAndView add(Employee employee)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			employeeService.saveEmployee(employee);
		} catch(Exception e){
			logger.error(e.toString(), e);
			mv.addObject("msg","failed");
		}
		mv.setViewName("redirect:/employee.do"); //保存成功跳转到列表页面
		return mv;
	}
	
	/**
	 * 请求编辑菜单页面
	 * @param 
	 * @return
	 */
	@RequestMapping(value="/toEdit")
	public ModelAndView toEdit(String ID)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("id", ID);
		try{
			Employee employee = employeeService.getEmployeeById(pd);
			mv.addObject("employee", employee);
			mv.addObject("MSG", "edit");
			mv.setViewName("system/employee/menu_edit");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 保存编辑
	 * @param 
	 * @return
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit(Employee employee)throws Exception{
		ModelAndView mv = this.getModelAndView();
		try{
			employeeService.editEmployee(employee);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		mv.setViewName("redirect:/employee.do"); //保存成功跳转到列表页面
		return mv;
	}
	
/**
 * 
 * @param MENU_ID
 * @return
 * @throws Exception
 */
	@RequestMapping(value="/deleteEmployee")
	@ResponseBody
	public ModelAndView deleteEmployee(String ID)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("id", ID);
		try{
			employeeService.deleteEmployee(pd);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		mv.setViewName("redirect:/employee.do"); //保存成功跳转到列表页面
		return mv;
	}
}
