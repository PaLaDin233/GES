package com.neu.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.neu.dao.EmpInfoDao;
import com.neu.util.ConvertUtil;

/**
 * 
 * 该类中的方法 对应页面中的具体操作
 *
 */
public class admin_auditService {

	private EmpInfoDao EmpInfoDao;
	
	public admin_auditService(){
		this.EmpInfoDao=new EmpInfoDao();
	}
	
	public boolean doReg(Map<String,String[]> params){
		boolean flag=false;
		Map<String,String> map=ConvertUtil.convertMap(params);
		int row=EmpInfoDao.insert(map);
		if(row>0){
			flag=true;
		}
		return flag;
	}
	
	public List<Map<String,String>> findByParams(Map<String,String[]> params){
		List<Map<String,String>> list=null;
		Map<String,String> map=ConvertUtil.convertMap(params);
		list=EmpInfoDao.search(map);
		return list;
	}
	
	public boolean doDelete(Map<String,String[]> params){
		boolean flag=false;
		Map<String,String> map=ConvertUtil.convertMap(params);
		int row=EmpInfoDao.delete(map);
		if(row>0){
			flag=true;
		}
		return flag;
	}
	
	public Map<String, String> checkLogin(Map<String,String[]> params){
		Map<String, String> item=null;
		Map<String,String> map=ConvertUtil.convertMap(params);
		List<Map<String, String>> list=EmpInfoDao.search(map);
		if(list.size()>0){
			item=list.get(0);
		}
		return item;
	}
	public Map<String,String> findById(Map<String,String[]> params){
		Map<String,String> item=null;
		Map<String,String> map=ConvertUtil.convertMap(params);
		List<Map<String,String>> list=EmpInfoDao.search(map);
		if(list.size()>0){
			item=list.get(0);
		}
		return item;
	}
	
	public boolean doUpdate(Map<String, String[]> params){
		boolean flag=false;
		Map<String, String> map=ConvertUtil.convertMap(params);
//		存放 修改语句的条件
		Map<String,String> where=new HashMap<String, String>();
		where.put("emp_id", map.get("emp_id"));
//		必须把作为条件的列从map中移除
		map.remove("emp_id");
		int i=Integer.parseInt(map.get("emp_status"));
		String str=i==1?"已通过":"未通过";
		map.put("emp_status", str);
		int row=EmpInfoDao.update(map, where);
		if(row>0){
			flag=true;
		}
		return flag;
	}
	
}
