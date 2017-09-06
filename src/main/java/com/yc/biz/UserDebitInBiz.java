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
	 * 后台查询所有的未审核借贷信息
	 * @param map
	 * @return
	 */
	public JsonModel findAllUserDebitInunCheck(Map<String, Integer> map);
	
	/**
	 * 后台查询所有的以审核借贷信息
	 * @param map
	 * @return
	 */
	public JsonModel findAllUserDebitInCheck(Map<String, Integer> map);

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
	/**
	 * 修改用户借贷状态   0  未审核状态   1  审核完成 凑款状态   2 筹款完成待放款状态   3 还款状态(借了未还)   4  完成还款 （失败 ）   
	 * @param udi
	 * @return
	 */
	public boolean updateUserDebitInStatus(UserDebitIn udi);
	/**
	 * 后台修改用户权重    权重越大     借贷信息的位置越靠前
	 * @param udi
	 * @return
	 */
	public boolean updateUserDebitInWeight(UserDebitIn udi);
	/**
	 * 后台单表查询查找所有的借贷用户    修改权重
	 * @param map
	 * @return
	 */
	public JsonModel findAllSingerUserDebitIn(Map<String, Integer> map);
	/**
	 * 后台单表修改借贷用户的信息   
	 * @param udi
	 * @return
	 */
	public boolean updateSingerUserDebitIn(UserDebitIn udi);
	/**
	 * 添加U计划信息
	 * @param udi
	 */
	public boolean addNewUplan(UserDebitIn udi);
	/**
	 * 添加U计划类型信息
	 * @param udit
	 */
	public boolean addNewUplanType(UserDebitInType udit);
	/**
	 * 查询所有的U计划借贷信息
	 * @param map
	 * @return
	 */
	public JsonModel findAllUplanManagerInfo(Map<String, Integer> map);
	/**
	 * 删除U计划借贷信息
	 * @param udi
	 * @return
	 */
	public boolean delUplanManagerInfo(UserDebitIn udi);
	/**
	 * 删除U计划类型借贷信息
	 * @param udit
	 * @return
	 */
	public boolean delUplanTypeManagerInfo(UserDebitInType udit);
	/**
	 * 更新U计划借贷信息
	 * @param udi
	 * @return
	 */
	public boolean updateNewUplanManagerInfo(UserDebitIn udi);
	/**
	 * 更新U计划借贷类型信息
	 * @param udit
	 * @return
	 */
	public boolean updateNewUplanTypeManagerInfo(UserDebitInType udit);
	/**
	 * 单表查询所有的U计划借贷信息
	 * @param map
	 * @return
	 */
	public JsonModel findSingleUplanManagerInfo(Map<String, Integer> map);






	

}
