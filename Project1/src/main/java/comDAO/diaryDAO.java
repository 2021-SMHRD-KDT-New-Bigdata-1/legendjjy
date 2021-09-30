package comDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import comVO.diaryVO;
import comVO.entireDiaryVO;
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
		
		int cnt = 0;
		if(vo.getImageURL()==null) {
			String sql = "INSERT INTO DIARIES VALUES(DIARIES_SEQ.NEXTVAL, ?, SYSDATE, ?, ?, ?, ?, ?, ? , 0, NULL)";

			try {
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, vo.getTitle());
				psmt.setString(2, vo.getImageURL());
				psmt.setString(3, vo.getContent());
				psmt.setString(4, user_vo.getUser_email());
				psmt.setString(5, vo.getHash_tag());
				psmt.setString(6, vo.getOpen_yn());
				psmt.setString(7, vo.getCommet_yn());

				cnt = psmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			}else {
				String sql = "INSERT INTO DIARIES (DIARY_SEQ, DIARY_TITLE, DIARY_DATE, DIARY_CONTENT, USER_EMAIL, HASH_TAG, OPEN_YN, COMMENT_YN, HTIS, AD_SEQ) VALUES(DIARIES_SEQ.NEXTVAL, ?, SYSDATE, ?, ?, ?, ?, ? , 0, NULL)";

				try {
					psmt = conn.prepareStatement(sql);
					psmt.setString(1, vo.getTitle());
					psmt.setString(2, vo.getContent());
					psmt.setString(3, user_vo.getUser_email());
					psmt.setString(4, vo.getHash_tag());
					psmt.setString(5, vo.getOpen_yn());
					psmt.setString(6, vo.getCommet_yn());

					cnt = psmt.executeUpdate();
					
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					close();
				}
			}
		return cnt;
	}
	
	public ArrayList<entireDiaryVO> look_diary() {
		conn();
		
		String sql = "SECECT * FROM DIARIES ORDER BY DIARY_SEQ";
		
		ArrayList<entireDiaryVO> diary_list = new ArrayList<entireDiaryVO>();
		try {
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			entireDiaryVO vo = null;
			while(rs.next()) {
				int diary_seq = rs.getInt(1);
				String diary_title = rs.getString(2);
				String diary_date = rs.getString(3);
				String diary_image = rs.getString(4);
				String diary_content = rs.getString(5);
				String user_eamil = rs.getString(6);
				String hash_tag = rs.getString(7);
				String open_yn = rs.getString(8);
				String comment_yn = rs.getString(9);
				int hits = rs.getInt(10);
				
				vo = new entireDiaryVO(diary_seq, diary_title, diary_date, diary_image, diary_content, user_eamil, hash_tag, open_yn, comment_yn, hits, diary_seq);
				
				diary_list.add(vo);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return diary_list;
	}
}
