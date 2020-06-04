package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;
import command.JoinCommand;
import command.LoginCommand;
import command.LogoutCommand;


@WebServlet("*.hol")
public class HolicController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public HolicController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionHo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionHo(request, response);
	}
	protected void actionHo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("actionHo() 호출");
		
		request.setCharacterEncoding("UTF-8");
		
		String viewPage = null;
		Command command = null;
		
		//URL 로 부터,URI, ContextPath, Command 분리
		String uri= request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		switch (com) {
		case "/User/login.ho":
			viewPage = "login.jsp";
			break;
		case "/User/loginOk.ho":
			command = new LoginCommand();
			command.execute(request, response);
			viewPage = "loginOk.jsp";
			break;
		case "/User/joinchk.ho":
			viewPage = "joinchk.jsp";
			break;
		case "/User/join.ho":
			viewPage = "join.jsp";
			break;
		case "/User/joinOk.ho":
			command = new JoinCommand();
			command.execute(request, response);
			viewPage = "joinOk.jsp";
			break;
		case "/index.ho":
			viewPage = "index.jsp";
			break;
		case "/User/logout.ho":
			command = new LogoutCommand();
			command.execute(request, response);
			viewPage = "logout.jsp";
			break;

		default:
			break;
		}
		if(viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}
}
