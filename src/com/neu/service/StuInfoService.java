package com.neu.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.neu.dao.StuInfoDao;
import com.neu.util.ConvertUtil;

/**
 * 
 * 该类中的方法 对应页面中的具体操作
 *
 */
public class StuInfoService {

	private StuInfoDao stuInfoDao;
	
	public StuInfoService(){
		this.stuInfoDao=new StuInfoDao();
	}
	
	public boolean doReg(Map<String,String[]> params){
		boolean flag=false;
		Map<String,String> map=ConvertUtil.convertMap(params);
		int row=stuInfoDao.insert(map);
		if(row>0){
			flag=true;
		}
		return flag;
	}
	
	public List<Map<String,String>> findByParams(Map<String,String[]> params){
		List<Map<String,String>> list=null;
		Map<String,String> map=ConvertUtil.convertMap(params);
		list=stuInfoDao.search(map);
		return list;
	}
	
	public boolean doDelete(Map<String,String[]> params){
		boolean flag=false;
		Map<String,String> map=ConvertUtil.convertMap(params);
		int row=stuInfoDao.delete(map);
		if(row>0){
			flag=true;
		}
		return flag;
	}
	
	public Map<String, String> checkLogin(Map<String,String[]> params){
		Map<String, String> item=null;
		Map<String,String> map=ConvertUtil.convertMap(params);
		List<Map<String, String>> list=stuInfoDao.search(map);
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
		where.put("stu_id", map.get("stu_id"));
//		必须把作为条件的列从map中移除
		System.out.println(map);
		
		String t=map.get("stu_iswork");
		if(t.equals("on")){
			map.put("stu_iswork","1");
		}else{
			map.put("stu_iswork","0");
		}
		map.remove("stu_id");
		int row=stuInfoDao.update(map, where);
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
		Map<String, String> stu_=new HashMap<>();
		stu_.put("stu_psd", map.get("re_psd"));
		where.put("stu_id", map.get("stu_id"));
		where_psd.put("stu_id", map.get("stu_id"));
		re_psd.put("re_psd", map.get("re_psd"));
		new_psd.put("new_psd", map.get("new_psd"));
		System.out.println("1"+where_psd);
		System.out.println("2"+re_psd);
		System.out.println("3"+new_psd);
		System.out.println("where"+new_psd);
		System.out.println("stu_"+stu_);
		List<Map<String, String>> list = stuInfoDao.search(where_psd);
		int flag = 0;//023不存在该id 、插入成功、插入失败
		if(list.size() > 0){
			where_psd.put("stu_psd", map.get("stu_psd"));
			get_list_id.put("stu_id", list.get(0).get("stu_psd"));//这里的园艺师后面的where得到的是一个map不是数字1
				if(list.get(0).get("stu_psd").equals(where_psd.get("stu_psd"))){
					flag = 1;
				}
		}

		if(flag == 1){
			flag=3;
			map.remove("re_psd");
			//map.remove("new_psd");
			map.remove("stu_id");
			map.put("stu_psd", map.get("new_psd"));
			map.remove("new_psd");
			int row=stuInfoDao.update(map, where);
			System.out.println(map+"zc "+row+" "+where);
			if(row>0){
				flag=2;
			}
		}
		return flag;
	}

	
}
