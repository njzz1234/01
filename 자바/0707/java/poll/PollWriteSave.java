package poll;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DbConnect;

/**
 * Servlet implementation class PollWriteSave
 */
// 어노테이션 : 주석
@WebServlet("/pollWriteSave")
public class PollWriteSave extends HttpServlet {

	/**
	 * @see 설문저장
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse
			response) throws ServletException, IOException {
		
		Connection con = DbConnect.oracleCon();
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		
		String title = request.getParameter("title");
		String[] item = request.getParameterValues("item");
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");
		String use = request.getParameter("use"); // null, N
		
		if( title == null || title.trim().equals("")) {
			out.print("<script>"
					+ "alert('제목을 입력해주세요');"
					+ " history.back();"
					+ "</script>");
			 return;
		}
		if (use == null) use = "Y";
		
		try {
		
		String sql1= "INSERT INTO pollmain(code,title,"
				+ "sdate,"
				+ "edate,"
				+ "use,"
				+ "rdate) VALUES ("
				+ "pollmain_seq.nextval,"
				+ "'"+title+"',"
				+ "'"+sdate+"',"
				+ "'"+edate+"',"
				+ "'"+use+"',"
				+ "sysdate   )";
		
		Statement stmt = con.createStatement();
		int result = stmt.executeUpdate(sql1);
		int cnt = 0;
		
		if(result==1) { // 메인저장완료
			// 100102
			for(int i=0; i<item.length; i++) {
				String n = "";
				 if(item[i] != null && !item[i].trim().equals("")) {
					 cnt++;
				 	n = ((cnt<10)?"0":"")+cnt;
						String sql2 = "INSERT INTO pollsub(code,item) "
						+ " VALUES("
						+ "  pollmain_seq.currval||'"+n+"',"
						+ "'"+item[i]+"'  )";
								stmt.executeUpdate(sql2);
				}
			}	
		}
		if (result==1 && cnt > 0) {
			out.print("<script>"
					+ "alert('설문저장완료');"
					+ " location = 'poll/pollList.jsp'; "
					+ "</script>");
			
		}
		
	} catch (Exception e) { }
				
	}
}