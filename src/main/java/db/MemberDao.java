package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class MemberDao {
	DBOpen dbopen = null;
	DBClose dbclose = null;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	StringBuffer sql = null;
	
	public MemberDao() {
		dbopen = new DBOpen();
		System.out.println(dbopen);
		dbclose = new DBClose();
	}
	
	public int insert(MemberVO vo) {
		int flag = 0;
		try {
			con = dbopen.getConnection();
			sql = new StringBuffer();
			
			sql.append(" insert into custom_01 ");
			sql.append(" values (?,?,?,?,?) ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getTel());
			
			flag = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose.close(con, pstmt);
		}
		return flag;
	}
	
	public ArrayList<MemberVO> read(){
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		try {
			con = dbopen.getConnection();
			sql = new StringBuffer();
			sql.append("select p_id, c_name, c_email, c_tel from custom_01 order by p_id desc");
			
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setId(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setEmail(rs.getString(3));
				vo.setTel(rs.getString(4));
				list.add(vo);
			}
			
		}  catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose.close(con, pstmt, rs);
		}
		return list;
	}
}
