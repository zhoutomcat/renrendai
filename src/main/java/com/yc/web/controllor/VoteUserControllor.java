package com.yc.web.controllor;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.yc.bean.VoteUser;
import com.yc.biz.VoteUserBiz;
import com.yc.web.model.JsonModel;


@RestController //类注解,同时使用@Controller 和@ResponseBody
public class VoteUserControllor {
	@Resource(name="voteUserBizImpl")
	private VoteUserBiz voteUserBiz;
	
	
	@RequestMapping("/voteUser_login.action")
	public JsonModel login(VoteUser voteUser,HttpServletRequest request,HttpSession session){
		JsonModel jm=new JsonModel();
		//为什么有三个参数?   因为name，password是user对象中有的，且zccode是在类中没有的，所以要在request中取
		//另外rand是存在session中，所以还要Httpsession
		String zccode=request.getParameter("zccode");
		String rand=session.getAttribute("rand").toString();
		if(!rand.equals(zccode)){
			jm.setCode(0);
			jm.setMsg("验证码错误");
		}else{
			try {
				voteUser=voteUserBiz.login(voteUser);
				if(voteUser!=null){
				session.setAttribute("user", voteUser);
				jm.setCode(1);
				voteUser.setPwd(null);   //设为空后，密码就不会传到页面
				jm.setObj(voteUser);
				}else{
					jm.setCode(0);
					jm.setMsg("用户名或密码错误");
				}
			} catch (Exception e) {
				e.printStackTrace();
				jm.setCode(0);
				jm.setMsg(e.getMessage());
			}
		}
		return jm;		
	}
	
	@RequestMapping("/voteUser_register.action")
	public JsonModel register(VoteUser voteUser,HttpServletRequest request,HttpSession session){
		JsonModel jm=new JsonModel();
		String repwd=request.getParameter("repwd");
		String zccode=request.getParameter("zccode");
		String rand=session.getAttribute("rand").toString();
		if(!rand.equals(zccode)){
			jm.setCode(0);
			jm.setMsg("验证码错误");
			return jm;
		}
		if(!repwd.equals(voteUser.getPwd())){
			jm.setCode(0);
			jm.setMsg("两次输入的密码不一致");
			return jm;
		}
		try {
			voteUserBiz.saveOrUpdate(voteUser);    //添加时voteuser没有id   但更新一定有  所以可以写到一起
			jm.setCode(1);
		} catch (Exception e) {
			e.printStackTrace();
			jm.setCode(0);
			jm.setMsg(e.getMessage());
		}
		return jm;
	}
	
	@RequestMapping("/voteUser_isUnameExist.action")
	public JsonModel isUnameExist(VoteUser voteUser){
		JsonModel jm=new JsonModel();
		try {
			VoteUser vu=voteUserBiz.isUnameExist(voteUser);
			if(vu==null){
				jm.setCode(1);
			}else{
				jm.setCode(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
			jm.setCode(0);
			jm.setMsg(e.getMessage());
		}
		return jm;
	}

			
	


}
