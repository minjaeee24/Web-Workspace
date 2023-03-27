package com.test.member.model.service;
import java.sql.Connection;
import java.sql.SQLException;

import com.test.common.JDBCTemplate;
import com.test.member.model.dao.MemberDao;
import com.test.member.model.vo.Member;

public class MemberService {

   public Member loginMember(String userId, String userPwd) {
      Connection conn = JDBCTemplate.getConnection();
      
      Member m = new MemberDao().loginMember(conn, userId, userPwd);
      
      try {
          conn.close();
       } catch (SQLException e) {
          e.printStackTrace();
       }
       
      return m;
   }
   
   public int insertMember(Member m) {
	   
	   Connection conn = JDBCTemplate.getConnection();
	   
	   int result = new MemberDao().insertMember(conn, m);
	   
	   if(result > 0) {
		   JDBCTemplate.commit(conn);
	   }else {
		   JDBCTemplate.rollback(conn);
	   }
	   
	   JDBCTemplate.close(conn);
	   return result;
   }
   
   
   /**
    * 회원 정보 수정용 서비스
    * @param m : 수정할 회원의 정보를 담은 Member객체
    * @return => 수정한 회원의 갱신된 정보
    */
   public Member updateMember(Member m) {
	   
	   Connection conn = JDBCTemplate.getConnection();
	   
	   int result = new MemberDao().updateMember(conn, m);

	   Member updateMem = null;
	   
	   if(result > 0) {
		   JDBCTemplate.commit(conn);
		   
		   updateMem = new MemberDao().selectMember(conn, m.getUserId());
	   }else {
		   JDBCTemplate.rollback(conn);
	   }
	   
	   JDBCTemplate.close(conn);
	   
	   return updateMem;
   }
   
}