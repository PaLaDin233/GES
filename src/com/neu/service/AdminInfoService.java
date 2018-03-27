package com.neu.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.neu.dao.AdmInfoDao;
import com.neu.util.ConvertUtil;

/**
 * 
 * 该类中的方法 对应页面中的具体操作
 *
 */
public class AdminInfoService {

	private AdmInfoDao adminInfoDao;
	
	public AdminInfoService(){
		this.adminInfoDao=new AdmInfoDao();
	}
	
	public boolean doReg(Map<String,String[]> params){
		boolean flag=false;
		Map<String,String> map=ConvertUtil.convertMap(params);
		int row=adminInfoDao.insert(map);
		if(row>0){
			flag=true;
		}
		return flag;
	}
	
	public List<Map<String,String>> findByParams(Map<String,String[]> params){
		List<Map<String,String>> list=null;
		Map<String,String> map=ConvertUtil.convertMap(params);
		list=adminInfoDao.search(map);
		return list;
	}
	
	public boolean doDelete(Map<String,String[]> params){
		boolean flag=false;
		Map<String,String> map=ConvertUtil.convertMap(params);
		int row=adminInfoDao.delete(map);
		if(row>0){
			flag=true;
		}
		return flag;
	}
	
	public Map<String, String> checkLogin(Map<String,String[]> params){
		Map<String, String> item=null;
		Map<String,String> map=ConvertUtil.convertMap(params);
		List<Map<String, String>> list=adminInfoDao.search(map);
		if(list.size()>0){
			item=list.get(0);
		}
		return item;
	}
	public Map<String,String> findById(Map<String,String[]> params){
		Map<String,String> item=null;
		Map<String,String> map=ConvertUtil.convertMap(params);
		List<Map<String,String>> list=adminInfoDao.search(map);
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
		String t=map.get("emp_status");
		System.out.println(map.get("emp_status"));
		if(t.equals("0")){
			map.put("emp_status","0");
		}else if(t.equals("1")){
			map.put("emp_status","1");
		}
		else{
			
		}
		int row=adminInfoDao.update(map, where);
		if(row>0){
			flag=true;
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
		Map<String, String> admin_=new HashMap<>();
		admin_.put("adm_psd", map.get("re_psd"));
		where.put("adm_id", map.get("adm_id"));
		where_psd.put("adm_psd", map.get("adm_psd"));
		where_psd.put("adm_id", map.get("adm_id"));//条件
		re_psd.put("re_psd", map.get("re_psd"));
		new_psd.put("new_psd", map.get("new_psd"));
		System.out.println("1"+where_psd);
		System.out.println("2"+re_psd);
		System.out.println("3"+new_psd);
		System.out.println("where"+where);
		System.out.println("admin_"+admin_);
		List<Map<String, String>> list = adminInfoDao.search(where);
		System.out.println("zc"+list.get(0).get("adm_psd"));
		int flag = 0;//023不存在该id 、插入成功、插入失败
		if(list.size() > 0){
			if(list.get(0).get("adm_psd").equals(where_psd.get("adm_psd"))){
				flag = 1;
			}
		}

		if(flag == 1){
			flag=3;
			map.remove("re_psd");
			//map.remove("new_psd");
			map.remove("adm_id");
			map.put("adm_psd", map.get("new_psd"));
			map.remove("new_psd");
			int row=adminInfoDao.update(map, where);
			System.out.println(map+"zc "+row+" "+where);
			if(row>0){
				flag=2;
			}
		}
		return flag;
	}

}
