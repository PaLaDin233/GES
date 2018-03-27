package com.neu.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.neu.dao.ComInfoDao;
import com.neu.dao.EmpInfoDao;
import com.neu.dao.StuInfoDao;
import com.neu.util.ConvertUtil;

public class ComInfoService {
	private ComInfoDao comInfoDao;
	private EmpInfoDao empInfoDao;
	private StuInfoDao stuInfoDao;
	
	public ComInfoService(){
		this.comInfoDao=new ComInfoDao();
		this.empInfoDao = new EmpInfoDao();
		this.stuInfoDao = new StuInfoDao();
		
	}
	public boolean doReg(Map<String,String[]> params){
		boolean flag=false;
		Map<String,String> map=ConvertUtil.convertMap(params);
		int row=comInfoDao.insert(map);
		if(row>0){
			flag=true;
		}
		return flag;
	}
	
	public List<Map<String,String>> findByParams(Map<String,String[]> params){
		List<Map<String,String>> list=null;
		Map<String,String> map=ConvertUtil.convertMap(params);
		list=comInfoDao.search(map);
		return list;
	}
	
	public boolean doDelete(Map<String,String[]> params){
		boolean flag=false;
		Map<String,String> map=ConvertUtil.convertMap(params);
		int row=comInfoDao.delete(map);
		if(row>0){
			flag=true;
		}
		return flag;
	}
	
	public Map<String, String> checkLogin(Map<String,String[]> params){
		Map<String, String> item=null;
		Map<String,String> map=ConvertUtil.convertMap(params);
		List<Map<String, String>> list=comInfoDao.search(map);
		if(list.size()>0){
			item=list.get(0);
		}
		return item;
	}
	
	public int doReg_com(Map<String, String[]> params){//params表示参数个数可变
	
		Map<String, String> map = ConvertUtil.convertMap(params);//convertutil为字符串与指定类型转换
		int flag = 3;//1数据库无改名字可以插入,2数据库有该名字,3插入失败
		Map<String,String> where=new HashMap<>();
		where.put("com_user", map.get("com_user"));
		List<Map<String, String>> list=comInfoDao.search(where);
		if(list.size()>0){
			flag=2;//如果有该名字不能注册
			return 2;
		}
		else{
			int row = comInfoDao.insert(map);
			if(row > 0){
				flag = 1;
			}
			return flag;
		}
	}
	
	public int doReg_com1(Map<String, String[]> params){//release_empDao
		
		int flag = 0;
		Map<String, String> map = ConvertUtil.convertMap(params);//convertutil为字符串与指定类型转换
		List<Map<String, String>> list=empInfoDao.search(map);
			int row = empInfoDao.insert(map);
			System.out.println(row);
			if(row > 0){
				flag = 1;
			}
			return flag;
	}
	
	public int doReg_com2(Map<String, String[]> params){//admin_manageDao
		
		Map<String, String> map = ConvertUtil.convertMap(params);//convertutil为字符串与指定类型转换
		int flag = 0;//1数据库无改名字可以插入,2数据库有该名字,3插入失败
		List<Map<String, String>> list=stuInfoDao.search(map);
			int row = stuInfoDao.insert(map);
			if(row > 0){
				flag = 1;
			}
			return flag;
		}
	
	
	public int check_psd(Map<String,String[]> params){
		Map<String, String> map=ConvertUtil.convertMap(params);
		System.out.println(map);
		Map<String, String> where_psd=new HashMap<>();
		Map<String, String> get_list_id=new HashMap<>();
		Map<String, String> re_psd=new HashMap<>();
		Map<String, String> new_psd=new HashMap<>();
		Map<String, String> where=new HashMap<>();
		Map<String, String> com_=new HashMap<>();
		com_.put("com_psd", map.get("re_psd"));
		where.put("com_id", map.get("com_id"));
		where_psd.put("com_psd", map.get("com_psd"));
		where_psd.put("com_id", map.get("com_id"));//条件
		re_psd.put("re_psd", map.get("re_psd"));
		new_psd.put("new_psd", map.get("new_psd"));
		System.out.println("1"+where_psd);
		System.out.println("2"+re_psd);
		System.out.println("3"+new_psd);
		System.out.println("where"+where);
		System.out.println("com_"+com_);
		List<Map<String, String>> list = comInfoDao.search(where);
		System.out.println("zc"+list.get(0).get("com_psd"));
		int flag = 0;//023不存在该id 、插入成功、插入失败
		if(list.size() > 0){
			if(list.get(0).get("com_psd").equals(where_psd.get("com_psd"))){
				flag = 1;
			}
		}

		if(flag == 1){
			flag=3;
			map.remove("re_psd");
			//map.remove("new_psd");
			map.remove("com_id");
			map.put("com_psd", map.get("new_psd"));
			map.remove("new_psd");
			int row=comInfoDao.update(map, where);
			System.out.println(map+"zc "+row+" "+where);
			if(row>0){
				flag=2;
			}
		}
		return flag;
	}

}
