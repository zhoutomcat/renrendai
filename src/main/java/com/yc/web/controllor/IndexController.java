package com.yc.web.controllor;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
//@RestController //类注解  同时使用   @Controller  和  @ResponseBody
public class IndexController {
		@RequestMapping(value="/index.action",method=RequestMethod.GET)
		public String index(){
			return "login";
		}
		
		@RequestMapping(value="/toRegister.action",method=RequestMethod.GET)
		public String toRegister(){
			return "register"; 
			//return "/WEB-INF/pages/login.jsp";   //没有视图解析器  InternalResoureceViewResolver
		}
		
		/**
		 * 官方文档：
		@RestController is a stereotype annotation that combines @ResponseBody and @Controller.
		意思是：
		@RestController注解相当于@ResponseBody ＋ @Controller合在一起的作用。

		1)如果只是使用@RestController注解Controller，则Controller中的方法无法返回jsp页面，配置的视图解析器InternalResourceViewResolver不起作用，返回的内容就是Return 里的内容。

		例如：本来应该到success.jsp页面的，则其显示success.


		2)如果需要返回到指定页面，则需要用 @Controller配合视图解析器InternalResourceViewResolver才行。
		3)如果需要返回JSON，XML或自定义mediaType内容到页面，则需要在对应的方法上加上@ResponseBody注解。



		为Controller类使用@RestController注解

		为Controller类使用@RestController注解,Controller中的方法无法返回jsp页面
		配置的视图解析器InternalResourceViewResolver不起作用
		例如：return “hello" 不会返回hello.jsp页面,会直接输出hello字符串

		这里大家要清楚一个概念:

		1)返回到指定页面，则需要用 @Controller配合视图解析器InternalResourceViewResolver才行

		2)如果需要返回JSON，XML或自定义mediaType内容到页面显示，需要在对应的方法上加上@ResponseBody注解。

		 */
}
