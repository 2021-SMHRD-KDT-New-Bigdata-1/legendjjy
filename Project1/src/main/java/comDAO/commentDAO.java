package comDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSet;
import java.util.ArrayList;

public class commentDAO {

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
	

	public ArrayList<Reply> getList(int diary_seq){
		String SQL="SELECT * FROM REPLIES WHERE user_email<? AND replyAvailable=1 AND diary_seq=? ORDER BY user_email DESC";
		ArrayList<Reply> list=new ArrayList<Reply>();
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, diary_seq);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Reply reply=new Reply();
				reply.setUserID(rs.getString(1));
				reply.setReplyID(rs.getInt(2));
				reply.setReplyContent(rs.getString(3));
				reply.setdiary_seq(diary_seq);
				reply.setReplyAvailable(1); // rs.getInt(5) => out of index 오류
				list.add(reply);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int getNext() {
		String SQL="select replyID FROM REPLY ORDER BY replyID DESC";
		try {
		
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				System.out.println(rs.getInt(1)); // select문에서 첫번째 값
				return rs.getInt(1)+1;  // 현재 인덱스(현재 게시글 개수) +1 반환
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int write(int bbsID,String replyContent,String userID) {
		String SQL="INSERT INTO REPLIES VALUES(?,?,?,?,?)";
		
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,user_email);
			pstmt.setInt(2, getNext());
			pstmt.setString(3, replyContent);
			pstmt.setInt(4,diary_seq);
			pstmt.setInt(5,1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
}
	
	
}
