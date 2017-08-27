package com.yc.biz;

import java.util.List;
import java.util.Map;

import com.yc.bean.UserDebitIn;
import com.yc.bean.UserDebitInType;
import com.yc.web.model.JsonModel;

public interface UserDebitInBiz {

	/**
	 * 查询所有的借贷类型
	 * 
	 * @return
	 */
	public List<UserDebitInType> findAllUserDebitInType();

	/**
	 * 通过类型名查询所有的借贷钱数
	 * 
	 * @param userDebitInType
	 * @return
	 */
	public double findAllUserDebitInMoneyByUserDebitInTypeName(UserDebitInType userDebitInType);

	/**
	 * 查询所有u计划的用户总投入的钱、为用户赚的钱、加入的总人数 数据
	 * 
	 * @return
	 */
	public List<UserDebitIn> findAllUplanData();

	/**
	 * 查询所有u计划的李历史记录（每期投资数，累积利率等等）
	 * 
	 * @return
	 */
	public List<UserDebitIn> findAllUplanHistory(UserDebitIn userDebitIn);

	/**
	 * 查询所有u计划的李历史记录Count（每期投资数，累积利率等等）
	 * 
	 * @return
	 */
	public int findAllUplanHistoryCount();

	/**
	 * 查询所有的除u计划之外的散标的历史记录
	 * @param userDebitIn
	 * @return
	 */
	public List<UserDebitIn> findAllSanbiaoHistory(UserDebitIn userDebitIn);
	
	/**
	 * 查询所有的除u计划之外的散标的历史记录Count（每期投资数，累积利率等等）
	 * 
	 * @return
	 */
	public int findAllSanbiaoHistoryCount();
	/**
	 * 后台查询所有的借贷信息
	 * @param map
	 * @return
	 */
	public JsonModel findAllUserDebitIn(Map<String, Integer> map);

	/**
	 * 添加借款信息的个人信息
	 * @param udi
	 */
	public boolean AddUserDebitIn(UserDebitIn udi);
	/**
	 * 添加借款信息类型的个人信息
	 * @param udit
	 * @return
	 */
	public boolean AddUserDebitInType(UserDebitInType udit);
	/**
	 * 修改借贷表的审核状态信息为可用
	 * @param udi
	 * @return
	 */
	public boolean updateUserDebitInCheckStatus(UserDebitIn udi);
	

}
