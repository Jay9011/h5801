package command;

// 작성자: 낙경
// 2020-06-01  23:00 수정
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbcommon.DAOPassword;
import dbcommon.DTOPassword;

public class SelectCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		DAOPassword dao = new DAOPassword();
		DTOPassword [] arr = null; 
		int uid;
		// 매개변수 받아오기
		if(request.getSession().getAttribute("uid") != null) {
			uid = (int)(request.getSession().getAttribute("uid"));
		} else {
			uid = 0;
			return;
		}
		
		
		try {
			arr = dao.selectByUid(uid);
			
			request.setAttribute("select_arr", arr);
		} catch (Exception e) {
			e.printStackTrace();
		}

	} // end execute()

}
