package comDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import comVO.diaryVO;
import comVO.usersVO;

public class diaryDAO {

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
	
	public int upload_diary(diaryVO vo, usersVO user_vo) {
		conn();
		
		String sql = "INSERT INTO DIARIES (DIARY_TITLE, DIARY_DATE, DIARY_IMAGE, DIARY_CONTENT, USER_EMAIL, HASH_TAG, OPEN_YN, COMMENT_YN, HTIS, AD_SEQ VALUES(?, SYSDATE, ?, ?, ?, ?, ?, ? , 0, NULL)";
		
		int cnt = 0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getTitle());
			psmt.setString(2, vo.getImageURL());
			psmt.setString(3, vo.getContent());
			psmt.setString(4, user_vo.getUser_email());
			psmt.setString(5, vo.getHash_tag());
			psmt.setString(6, vo.getOpen_yn());
			psmt.setString(7, vo.getCommet_yn());
			
			int cnt = psmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}
}
