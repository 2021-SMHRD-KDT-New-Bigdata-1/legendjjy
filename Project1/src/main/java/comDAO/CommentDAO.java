package comDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import comVO.Comment;

public class CommentDAO {

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
	

	public String getDate() {//현재 서버 시간 가져오기
		String SQL="select now()";//현재 시간을 가져오는 mysql문장
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);//sql문장을 실행 준비 단계로
			rs=pstmt.executeQuery();//실행결과 가져오기
			if(rs.next()) {
				return rs.getString(1);//현재 날짜 반환
			}
			
		} catch(Exception e) {
			e.printStackTrace();//오류 발생
		}
		return "";//데이터베이스 오류
	}
	
	public int getNext() {
		String SQL="SELECT commentID from COMMENT order by commentID DESC";//마지막 게시물 반환
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 첫 번째 게시물인 경우
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}
	
	public int write(String commentContent, String userID, int bbsID) {
		String SQL="insert into COMMENT VALUES (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, commentContent);
			pstmt.setInt(2, getNext());
			pstmt.setString(3, userID);
			pstmt.setInt(4, 1);
			pstmt.setString(5, getDate());
			pstmt.setInt(6, bbsID);
			return pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}

	public ArrayList<Comment> getList(int bbsID){//특정한 리스트를 받아서 반환
		String SQL="SELECT * from comment where bbsID = ? AND commentAvailable = 1 order by bbsID desc limit 10";//마지막 게시물 반환, 삭제가 되지 않은 글만 가져온다.
		ArrayList<Comment> list = new ArrayList<Comment>();
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Comment comment = new Comment();
				comment.setCommentContent(rs.getString(1));
				comment.setCommentID(rs.getInt(2));
				comment.setUserID(rs.getString(3));
				comment.setCommentAvailable(rs.getInt(4));
				comment.setCommentDate(rs.getString(5));
				comment.setBbsID(rs.getInt(6));
				list.add(comment);
			}			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;//댓글 리스트 반환
	}
	
	public Comment getComment(int commentID) {//하나의 댓글 내용을 불러오는 함수
		String SQL="SELECT * from comment where commentID = ?";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, commentID);
			rs=pstmt.executeQuery();//select
			if(rs.next()) {//결과가 있다면
				Comment comment = new Comment();
				comment.setCommentContent(rs.getString(1));
				comment.setCommentID(rs.getInt(2));
				comment.setUserID(rs.getString(3));
				comment.setCommentAvailable(rs.getInt(4));
				comment.setCommentDate(rs.getString(5));
				comment.setBbsID(rs.getInt(6));
				return comment;
			}			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int bbsID, int commentID,String commentContent ) {
		String SQL="update comment set commentContent = ? where bbsID = ? and commentID = ?";//특정한 아이디에 해당하는 제목과 내용을 바꿔준다. 
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, commentContent);//물음표의 순서
			pstmt.setInt(2, bbsID);
			pstmt.setInt(3, commentID);
			return pstmt.executeUpdate();//insert,delete,update			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}
	
	public int delete(int commentID) {
		String SQL = "update COMMENT set commentAvailable = 0 where commentID = ?";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, commentID);
			return pstmt.executeUpdate();			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}

	
}
