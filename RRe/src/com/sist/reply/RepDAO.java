package com.sist.reply;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sun.corba.se.impl.ior.GenericTaggedComponent;
import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

public class RepDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static RepDAO dao;
	private final String URL="jdbc:oracle:thin:@211.238.142.229:1521:ORCL";
	
	public RepDAO(){
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (Exception e) {
			System.out.println("RepDAO():"+e.getMessage());
		}
	}
	//연결
	public void getConnection(){
		try{
			conn=DriverManager.getConnection(URL, "scott", "tiger");
		}catch(Exception ex){
			System.out.println("getConnection():"+ex.getMessage());
		}
	}
	
	//해제
	public void disConnection(){
		try{
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	
	//싱글턴
	public static RepDAO newInstance(){
		if(dao==null)
			dao=new RepDAO();
		return dao;
	}
		
	public ArrayList<ReVO> select(){
		ArrayList<ReVO> list = new ArrayList<ReVO>();
		try {
			getConnection();
			String sql ="SELECT no,name,content,pwd "
					+"FROM rr ORDER BY no DESC";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				ReVO vo = new ReVO();
				vo.setNo(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setContent(rs.getString(3));
				vo.setPwd(rs.getString(4));
				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			System.out.println("select():"+e.getMessage());
		} finally {
			disConnection();
		}
		return list;
	}
	
	public int insert(ReVO vo){
		int result=0;
		try {
			getConnection();
			String sql ="INSERT INTO rr(no,name,content,pwd) "
					+"VALUES(seq_r_no.NEXTVAL,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getContent());
			ps.setString(3, vo.getPwd());
			
			ps.executeUpdate();
			ps.close();
		} catch (Exception e) {
			System.out.println("insert():"+e.getMessage());
		} finally {
			disConnection();
		}
		return result;
	}
	
	//댓글 삭제
	public boolean delete(int no,String pwd){
		boolean bCheck =false;
		try {
			getConnection();
			String sql ="SELECT pwd FROM rr"
					+"WHERE no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			rs.next();
			String db_pwd = rs.getString(1);
			rs.close();
			ps.close();
			
			if(db_pwd.equals(pwd)){
				bCheck=true;
				sql ="DELETE FROM rr "
						+"WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, no);
				ps.executeUpdate();
			} else {
				bCheck=false;
			}
		} catch (Exception e) {
			System.out.println("delete():"+e.getMessage());
		} finally {
			disConnection();
		}
		return bCheck;
	}
	
	public int Delete(ReVO vo){
		int result=0;
		try {
			String sql="DELETE rr WHERE no=? AND pwd=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, vo.getNo());
			ps.setString(2, vo.getPwd());
			
			result = ps.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("delete():"+e.getMessage());
		}
		return result;
	}
}
