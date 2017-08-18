package com.yc.biz;

import java.util.List;

import com.yc.bean.UserDebitIn;
import com.yc.bean.UserDebitInType;

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

}
