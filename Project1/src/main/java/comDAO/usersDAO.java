package comDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import comVO.appVO;
import comVO.entireDiaryVO;
import comVO.followVO;
import comVO.usersVO;

public class usersDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	public void conn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String dbid = "cgi_6_1";
			String dbpw = "smhrd1";
			conn = DriverManager.getConnection(url, dbid, dbpw);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if(rs!=null) {
				rs.close();
			}
			if(psmt!=null) {
				psmt.close();
			}
			if(conn!=null) {
				conn.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int join(String email, String pw, String nick, String admin_yn) {
		conn();
		
		String sql = "INSERT INTO USERS VALUES(?, ?, ?, SYSDATE, ?)";
		
		int cnt = 0;
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);
			psmt.setString(2, pw);
			psmt.setString(3, nick);
			psmt.setString(4, admin_yn);
			
			cnt = psmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}
	
	public usersVO login(String email, String pw) {
		conn();
		
		String sql = "SELECT USER_EMAIL, USER_NICK, ADMIN_YN FROM USERS WHERE USER_EMAIL = ? AND USER_PW = ?";
		
		usersVO vo = null;
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);
			psmt.setString(2, pw);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				String user_email = rs.getNString(1);
				String user_nick = rs.getNString(2);
				String admin_yn = rs.getNString(3);
				
				vo = new usersVO(user_email, user_nick, admin_yn);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return vo;
	}
	
	public int editPass(String pass2, String email) {
		conn();
		
		String sql = "UPDATE USERS SET USER_PW = ? WHERE USER_EMAIL = ?";
		
		int cnt = 0;
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, pass2);
			psmt.setString(2, email);
			
			cnt = psmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}
	
	public int editNick(String nick, String email) {
		conn();
		
		String sql = "UPDATE USERS SET USER_NICK = ? WHERE USER_EMAIL = ?";
		
		int cnt = 0;
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, nick);
			psmt.setString(2, email);
			
			cnt = psmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}
	
	public int editDelete(usersVO vo) {
		conn();
		
		String sql = "DELETE FROM USERS WHERE USER_EMAIL = ?";
		
		int cnt = 0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getUser_email());
			
			cnt = psmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}
	
	public int app(String email, String content, int design) {
		conn();
		
		String sql = "INSERT INTO APPLICATION VALUES(APPLICATION_SEQ.NEXTVAL, ?, ?, ?, SYSDATE)";
		
		int cnt = 0;
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);
			psmt.setString(2, content);
			psmt.setInt(3, design);
			
			cnt = psmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}
	
	public ArrayList<appVO> application_list(){
		conn();
		
		String sql = "SELECT * FROM APPLICATION ORDER BY APP_SEQ ";
		
		ArrayList<appVO> app_list = new ArrayList<appVO>();
		try {
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int app_seq = rs.getInt(1);
				String user_email = rs.getString(2);
				String app_require = rs.getString(3);
				int pick_design = rs.getInt(4);
				String app_date = rs.getString(5);
				
				appVO vo = new appVO(app_seq, user_email, app_require, pick_design, app_date);
				
				app_list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return app_list;
	}
	
	public ArrayList<followVO> follow_list(usersVO vo){
		conn();
		
		String sql = "SELECT FOLLOW_EMAIL FROM FOLLOWINGS WHERE USER_EMAIL = ? ORDER BY FOLLOW_SEQ DESC";
		
		ArrayList<followVO> follow_list = new ArrayList<followVO>();
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,vo.getUser_email());
			
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				
				String follow_email = rs.getString(1);
				
				followVO vo2 = new followVO(follow_email);
				
				follow_list.add(vo2);
			 	}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return follow_list;
		
		}
	
	
	public String findNick(entireDiaryVO vo) {
		conn();
		
		String sql = "SELECT USER_NICK FROM USERS WHERE USER_EMAIL = ?";
		
		String result = "";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getUser_email());
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getString(1);
			}else {
				result = "";
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}
}
