package comDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import comVO.UpdateDiaryVO;
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
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int upload_diary(diaryVO vo, usersVO user_vo) {
		conn();

		int cnt = 0;

		String sql = "INSERT INTO DIARIES VALUES(DIARIES_SEQ.NEXTVAL, ?, SYSDATE, ?, ?, ?, ?, ?, ? , 0, NULL)";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getTitle());
			psmt.setString(2, vo.getimageName());
			psmt.setString(3, vo.getContent());
			psmt.setString(4, user_vo.getUser_email());
			psmt.setString(5, vo.getHash_tag());
			psmt.setString(6, vo.getOpen_yn());
			psmt.setString(7, vo.getCommet_yn());

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public ArrayList<entireDiaryVO> look_diary() {
		conn();

		String sql = "SELECT * FROM DIARIES WHERE OPEN_YN = 'y' ORDER BY DIARY_SEQ DESC";

		ArrayList<entireDiaryVO> diary_list = new ArrayList<entireDiaryVO>();
		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			entireDiaryVO vo = null;
			while (rs.next()) {
				int diary_seq = rs.getInt(1);
				String diary_title = rs.getString(2);
				String diary_date = rs.getString(3);
				String diary_image = rs.getString(4);
				String diary_content = rs.getString(5);
				String user_email = rs.getString(6);
				String hash_tag = rs.getString(7);
				String open_yn = rs.getString(8);
				String comment_yn = rs.getString(9);
				int hits = rs.getInt(10);
				int ad_seq = rs.getInt(11);

				vo = new entireDiaryVO(diary_seq, diary_title, diary_date, diary_image, diary_content, user_email,
						hash_tag, open_yn, comment_yn, hits, ad_seq);

				diary_list.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return diary_list;
	}

	public ArrayList<entireDiaryVO> search_diary(String word) {
		conn();

		String sql = "SELECT * FROM DIARIES D INNER JOIN USERS U ON D.USER_EMAIL = U.USER_EMAIL WHERE HASH_TAG LIKE ? OR U.USER_NICK = ?";

		ArrayList<entireDiaryVO> diary_list = new ArrayList<entireDiaryVO>();
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, "%" + word + "%");
			psmt.setString(2, word);

			rs = psmt.executeQuery();

			entireDiaryVO vo = null;
			while (rs.next()) {
				int diary_seq = rs.getInt(1);
				String diary_title = rs.getString(2);
				String diary_date = rs.getString(3);
				String diary_image = rs.getString(4);
				String diary_content = rs.getString(5);
				String user_email = rs.getString(6);
				String hash_tag = rs.getString(7);
				String open_yn = rs.getString(8);
				String comment_yn = rs.getString(9);
				int hits = rs.getInt(10);
				int ad_seq = rs.getInt(11);

				vo = new entireDiaryVO(diary_seq, diary_title, diary_date, diary_image, diary_content, user_email,
						hash_tag, open_yn, comment_yn, hits, ad_seq);

				diary_list.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return diary_list;
	}

	public int delete_diary(int seq) {
		conn();

		String sql = "DELETE FROM DIARIES WHERE DIARY_SEQ = ?";

		int cnt = 0;
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public entireDiaryVO select_diary(int seq) {
		conn();

		String sql = "SELECT * FROM DIARIES WHERE DIARY_SEQ = ?";

		entireDiaryVO enVO = null;

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);

			rs = psmt.executeQuery();

			if (rs.next()) {
				int diary_seq = rs.getInt(1);
				String diary_title = rs.getString(2);
				String diary_date = rs.getString(3);
				String diary_image = rs.getString(4);
				String diary_content = rs.getString(5);
				String user_email = rs.getString(6);
				String hash_tag = rs.getString(7);
				String open_yn = rs.getString(8);
				String comment_yn = rs.getString(9);
				int hits = rs.getInt(10);
				int ad_seq = rs.getInt(11);
				enVO = new entireDiaryVO(diary_seq, diary_title, diary_date, diary_image, diary_content, user_email,
						hash_tag, open_yn, comment_yn, hits, ad_seq);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return enVO;
	}

	public ArrayList<entireDiaryVO> personal_diary(String email) {
		conn();

		String sql = "SELECT * FROM DIARIES WHERE USER_EMAIL = ? ORDER BY DIARY_SEQ DESC";

		ArrayList<entireDiaryVO> diary_list = new ArrayList<entireDiaryVO>();
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);

			rs = psmt.executeQuery();

			entireDiaryVO vo = null;
			while (rs.next()) {
				int diary_seq = rs.getInt(1);
				String diary_title = rs.getString(2);
				String diary_date = rs.getString(3);
				String diary_image = rs.getString(4);
				String diary_content = rs.getString(5);
				String user_email = rs.getString(6);
				String hash_tag = rs.getString(7);
				String open_yn = rs.getString(8);
				String comment_yn = rs.getString(9);
				int hits = rs.getInt(10);
				int ad_seq = rs.getInt(11);

				vo = new entireDiaryVO(diary_seq, diary_title, diary_date, diary_image, diary_content, user_email,
						hash_tag, open_yn, comment_yn, hits, ad_seq);

				diary_list.add(vo);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return diary_list;
	}
	
	public ArrayList<entireDiaryVO> other_personal_diary(String email) {
		conn();

		String sql = "SELECT * FROM DIARIES WHERE USER_EMAIL = ? AND OPEN_YN = 'y' ORDER BY DIARY_SEQ DESC";

		ArrayList<entireDiaryVO> diary_list = new ArrayList<entireDiaryVO>();
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);

			rs = psmt.executeQuery();

			entireDiaryVO vo = null;
			while (rs.next()) {
				int diary_seq = rs.getInt(1);
				String diary_title = rs.getString(2);
				String diary_date = rs.getString(3);
				String diary_image = rs.getString(4);
				String diary_content = rs.getString(5);
				String user_email = rs.getString(6);
				String hash_tag = rs.getString(7);
				String open_yn = rs.getString(8);
				String comment_yn = rs.getString(9);
				int hits = rs.getInt(10);
				int ad_seq = rs.getInt(11);

				vo = new entireDiaryVO(diary_seq, diary_title, diary_date, diary_image, diary_content, user_email,
						hash_tag, open_yn, comment_yn, hits, ad_seq);

				diary_list.add(vo);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return diary_list;
	}

	public int update_diary(UpdateDiaryVO diary_vo) {

		conn();

		int cnt = 0;

		String sql = "UPDATE DIARIES SET DIARY_TITLE = ?, DIARY_CONTENT = ? , DIARY_IMAGE = ? , HASH_TAG = ?, OPEN_YN = ?, COMMENT_YN = ? WHERE DIARY_SEQ = ?";

		try {

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, diary_vo.getDiary_title());
			psmt.setString(2, diary_vo.getDiary_content());
			psmt.setString(3, diary_vo.getDiary_image());
			psmt.setString(4, diary_vo.getHash_tag());
			psmt.setString(5, diary_vo.getOpen_yn());
			psmt.setString(6, diary_vo.getComment_yn());
			psmt.setInt(7, diary_vo.getDiary_seq());

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	public int hits_up(int diary_seq) {
		conn();
		
		String sql = "UPDATE DIARIES SET HITS = HITS + 1 WHERE DIARY_SEQ = ?";
		
		int cnt = 0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, diary_seq);
			
			cnt = psmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}
	
	public ArrayList<Integer> find_diary_seq(String email) {
		conn();
		
		String sql = "SELECT DIARY_SEQ FROM MYSCRAPS WHERE USER_EMAIL = ?";
		
		ArrayList<Integer> seq_list = new ArrayList<Integer>();
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				seq_list.add(rs.getInt(1)); 
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return seq_list;
	}
	
	public ArrayList<entireDiaryVO> today_diary() {
		conn();
		
		String sql = "SELECT * FROM DIARIES WHERE OPEN_YN = 'y' ORDER BY HITS DESC";
		
		ArrayList<entireDiaryVO> today_list = new ArrayList<entireDiaryVO>();
		try {
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				
				int diary_seq = rs.getInt(1);
				String diary_title = rs.getString(2);
				String diary_date = rs.getString(3);
				String diary_image = rs.getString(4);
				String diary_content = rs.getString(5);
				String user_email = rs.getString(6);
				String hash_tag = rs.getString(7);
				String open_yn = rs.getString(8);
				String comment_yn = rs.getString(9);
				int hits = rs.getInt(10);
				int ad_seq = rs.getInt(11);

				entireDiaryVO vo = new entireDiaryVO(diary_seq, diary_title, diary_date, diary_image, diary_content, user_email, hash_tag, open_yn, comment_yn, hits, ad_seq);

				today_list.add(vo);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return today_list;
	}
}