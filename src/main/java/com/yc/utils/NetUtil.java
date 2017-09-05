package com.yc.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.MalformedURLException;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.URL;
import java.net.URLConnection;
import java.util.Enumeration;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;



public class NetUtil {
	
	/*
	 * 获取本机ip地址
	 */
	public static InetAddress getLocalHostIp() throws SocketException{
		Enumeration allNetInterfaces=NetworkInterface.getNetworkInterfaces();
		InetAddress ip=null;
		while(allNetInterfaces.hasMoreElements()){
			NetworkInterface netInterface=(NetworkInterface) allNetInterfaces.nextElement();
			//System.out.println(netInterface.getName());
			Enumeration addresses=netInterface.getInetAddresses();
			while(addresses.hasMoreElements()){
				ip=(InetAddress) addresses.nextElement();
				if(ip!=null && ip instanceof Inet4Address){
					System.out.println("本机的ip="+ip.getHostAddress());
					break;
				}
			}
		}
		return ip;
	}
	/*
	 * 获取本机外网ip地址
	 */
	public static String getV4IP(){
		String ip="";
		String chinaz="http://ip.chinaz.com";
		StringBuffer inputLine=getNetResponse(chinaz);
		//正则表达式
		//<dd class="fz24">59.51.114.211</dd>
		//			  ()分组->取的值
		//正则表达式：要取出的部分是59.51.114.211，以分组的形式取出()
		//正则表达式的开头 \\  \
		Pattern p=Pattern.compile("\\<dd class\\=\"fz24\">(.*?)\\<\\/dd>");//<dd class="fz24">106.18.65.221</dd>  //模式
		Matcher m=p.matcher(inputLine.toString()); //匹配好的结果	 Matcher的结构是一个数组
		if(m.find()){
			String ipstr=m.group(1);	//取第一个满足要求的值
			ip=ipstr;
		}
		return ip;
	}
	
	
	/**
	 * 根据地址访问网络上的页面，得到这个页面的响应
	 * @param address
	 * @return
	 */
	public static StringBuffer getNetResponse(String address) {
		StringBuffer inputLine=new StringBuffer();
		String read="";
		URL url=null; //统一资源定位符
		HttpURLConnection urlConnection=null;//http连接
		BufferedReader in=null;
		try {
			url=new URL(address);
			urlConnection=(HttpURLConnection)url.openConnection();
			//将网络数据以流的形式打开，带缓冲的字符流
			in=new BufferedReader(new InputStreamReader(urlConnection.getInputStream(),"UTF-8"));
			while((read=in.readLine())!=null){
				inputLine.append(read+"\r\n");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(in!=null){
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return inputLine;
	}
	
	public static StringBuffer getNetResponse(String address,Map<String,String> paramster) {
		StringBuffer inputLine=new StringBuffer();
		String read="";
		URL url=null; //统一资源定位符
		HttpURLConnection urlConnection=null;//http连接
		BufferedReader in=null;
		try {
			url=new URL(address);
			urlConnection=(HttpURLConnection)url.openConnection();	//打开网络连接
			if(paramster!=null && paramster.size()>0){
				urlConnection.setDoOutput(true);//允许连接提交信息
				urlConnection.setRequestMethod("POST");//网页提交方式“GET”、“POST”
				urlConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
				urlConnection.setRequestProperty("Connection", "Keep-Alive");
				StringBuffer sb = new StringBuffer();
				for(Map.Entry<String, String> entry:paramster.entrySet()){
					sb.append("&"+entry.getKey()+"="+entry.getValue());	//&account=a&password=b&key=c
				}
				String paramString=sb.toString().substring(1);
				OutputStream os=urlConnection.getOutputStream();
				os.write(paramString.getBytes());
			}
			//将网络数据以流的形式打开，带缓冲的字符流
			in=new BufferedReader(new InputStreamReader(urlConnection.getInputStream(),"UTF-8"));
			while((read=in.readLine())!=null){
				inputLine.append(read+"\r\n");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(in!=null){
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return inputLine;
	}
	
	/**
	 * 根据url,得到访问页面的内容
	 * @param url：	http://ws.webxml.com.cn/WebServices/IpAddressSearchWebService.asmx/getCountryCityByIp?theIPAddress=106.18.65.221
	 * @param host：	http://ws.webxml.com.cn/WebServices/
	 * @return	InputStream
	 */
	public static InputStream getSoapInputStream(String url,String host){
		InputStream inputStream=null;
		try {
			URL urlObj=new URL(url);
			//openConnection 方法创建连接对象。
			URLConnection urlConn=urlObj.openConnection();
			//设置一般请求属性
			urlConn.setRequestProperty("Host", host);//具体webService相关
			urlConn.connect();
			inputStream=urlConn.getInputStream();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return inputStream;
		
	}
	
	public static void main(String[] args) throws SocketException {
		//getLocalHostIp();
		//System.out.println(getNetResponse("http://ip.chinaz.com"));
		//System.out.println(getV4IP());
		//System.out.println(getNetResponse("http://www.baidu.com"));
		getLocalHostIp();
	}
	
}
