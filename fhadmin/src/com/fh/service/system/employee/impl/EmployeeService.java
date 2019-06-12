package com.fh.service.system.employee.impl;

import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.system.Employee;
import com.fh.entity.system.Menu;
import com.fh.service.system.employee.EmployeeManager;
import com.fh.util.PageData;

/**
 * 
 * @author liguisheng
 *
 */
@Service("employeeService")
public class EmployeeService implements EmployeeManager{
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Employee> listAll() throws Exception {
		return (List<Employee>) dao.findForList("EmployeeMapper.listAll","");
	}

	@Override
	public void saveEmployee(Employee employee) throws Exception {
		String id=new Random().nextInt(100000000)+"";
		employee.setID(id);
		dao.save("EmployeeMapper.insertEmployee", employee);
	}

	@Override
	public Employee getEmployeeById(PageData pd) throws Exception {
		return (Employee) dao.findForObject("EmployeeMapper.getEmployeeById", pd);
	}

	@Override
	public void editEmployee(Employee employee) throws Exception {
		dao.update("EmployeeMapper.updateEmployee", employee);
		
	}

	@Override
	public void deleteEmployee(PageData pd) throws Exception {
		dao.delete("EmployeeMapper.deleteEmployee", pd);
		
	}

	
}
