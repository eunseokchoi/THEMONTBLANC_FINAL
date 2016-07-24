package mont.blanc.common;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;

import com.oreilly.servlet.MultipartRequest;

import mont.blanc.common.*;

public class DBSQL {
	private Connection CN;
	private Statement ST;
	private PreparedStatement PST;
	private ResultSet RS;
	private String sql;
	private String sqry;
	private int total;
	private int total1;

	private int limit=10;
	private String pnum;
   	private int pageNUM;
	private int pageCount;
	private int start;
	private int end;
	private int temp; 
	private int startPage;
	private String returnPage; 
	
	public DBSQL() {
		CN = DB.getConnection();
	}

	// MEMBET PART ================================================================================
	public int dbLogin(String id,String pw){
		int result=0;
			try {			
				String sql ="select count(*) as cnt from mb_login where id=? and pw=?";
				PST=CN.prepareStatement(sql);
				PST.setString(1, id);
				PST.setString(2, pw);
				RS = PST.executeQuery();
				RS.next();
				result = RS.getInt("cnt");
				if(id.equals("admin")){
					result+=1;
				}
			}catch (Exception e){}			
		return result;
	}
	
	public int dbSearch(String ID){
		int result=0;
		try{
			String qry="select count(*) as cnt from mb_login where id=?";
			PST=CN.prepareStatement(qry);
			PST.setString(1, ID);
			RS=PST.executeQuery();
			RS.next();
			result=RS.getInt("cnt");
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return result;
	}
	
	public int dbJoinMember(DBbean bean){
		int result = 0;
		try {
			String sql = "insert into mb_login values(membernum_seq.nextval,?,?,?,?,?,?,?,?,?)";
			PST = CN.prepareStatement(sql);
			PST.setString(1, bean.getId());
			PST.setString(2, bean.getPw());
			PST.setString(3, bean.getGender());
			PST.setString(4, bean.getEngname());
			PST.setString(5, bean.getKorname());
			PST.setString(6, bean.getBirthday());
			PST.setString(7, bean.getAddr());
			PST.setString(8, bean.getTel());
			PST.setString(9, bean.getEmail());
			
			result = PST.executeUpdate();	
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return result;
	}
	
	public void dbDelete(String id){
		String sql = "delete from mb_login where id='"+id+"'";
		try {
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			RS.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}
	
	public DBbean dbInfoMember(String id){
		DBbean bean = new DBbean();
		try{
			String sql ="select * from mb_login where id=?";
			PST = CN.prepareStatement(sql);
			PST.setString(1, id);
			RS = PST.executeQuery();
			RS.next();
			
			bean.setId(RS.getString("id"));
			bean.setPw(RS.getString("pw"));
			bean.setGender(RS.getString("Gender"));
			bean.setEngname(RS.getString("Engname"));
			bean.setKorname(RS.getString("Korname"));
			bean.setBirthday(RS.getString("Birthday"));
			bean.setAddr(RS.getString("Addr"));
			bean.setEmail(RS.getString("Email"));
			bean.setTel(RS.getString("Tel"));
			System.out.println(RS.getString("Addr"));
			}catch(Exception ex){}
		return bean;
	}
	
	public int dbUpdate(DBbean bean){
		int result = 0;
		  try{
			  String sql="update mb_login set gender=?,engname=?,korname=?,birthday=?,addr=?,email=?,tel=? where id=?";
			  PST=CN.prepareStatement(sql);
			  PST.setString(1, bean.getGender());
			  PST.setString(2, bean.getEngname());
			  PST.setString(3, bean.getKorname());
			  PST.setString(4, bean.getBirthday());
			  PST.setString(5, bean.getAddr());
			  PST.setString(6, bean.getEmail());
			  PST.setString(7, bean.getTel());
			  PST.setString(8, bean.getId());
			  PST.executeUpdate(); 
			  result+=1;
		  }catch(Exception ex){ }
		  return result;
	}
	
	public List<DBbean> dbSelect(String pnum, String sql3){
		List<DBbean> LT = new ArrayList<DBbean>();
		try{
			if(pnum==null) pnum="1";
			pageNUM=Integer.parseInt(pnum);
			
			start=((pageNUM-1)*limit)+1;
			end=pageNUM*limit;
			sql="select * from (select rownum rn, id, pw, gender, engname, birthday, tel, email from (select * from mb_login "+sql3+"))";
			sql+=" where rn between "+start+" and "+end;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
	
			while(RS.next()==true){
				DBbean bean = new DBbean();
				bean.setId(RS.getString("id"));
				bean.setPw(RS.getString("pw"));
				bean.setEngname(RS.getString("engname"));
				bean.setGender(RS.getString("gender"));
				bean.setBirthday(RS.getString("birthday"));
				bean.setTel(RS.getString("tel"));
				bean.setEmail(RS.getString("email"));
				LT.add(bean);
			}
		}catch(Exception ex){System.out.println("회원리스트 DBSQL Error : " + ex.toString());}
		return LT;
	}
			
	public int dbCount(String sql3){
		int total = 0;
		try {
			String msg = "select count(*) as cnt from mb_login "+sql3;
			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
			RS.next();
			if(RS.next()==true){
				total=RS.getInt("cnt");
			}
		} catch (Exception ex) {}
		return total;
	}

	public int dbSearchCount(String skey, String sval) {
		int total = 0;
		try {
			String sqry = " where " + skey + " like '%" + sval + "%' ";
			String msg = "select count(*) as cnt from mb_login " + sqry;
			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
			RS.next();
			total = RS.getInt("cnt");
		} catch (Exception ex) {
		}
		return total;
	}
	
	// RESERVATION PART ===========================================================================
	public List revOk(String in, String out){
		List no = new ArrayList() ;
		List ok = new ArrayList() ;
		String sql1 = "select distinct(revRoomID) from mb_reservation ";
		sql1+="where ('"+in+"'>=revIn and '"+in+"'<revOut) or ";
		sql1+="('"+in+"'<=revIn and '"+out+"'>=revOut) or ('"+out+"'>revIn and '"+out+"'<=revOut)";
		try{
			ST = CN.createStatement() ;
			RS = ST.executeQuery(sql1) ;
			while(RS.next()==true){
				no.add(RS.getInt("revRoomID"));
			}

			String sql2 ;
			String sql3 = " order by roomID asc" ;
	         
			if(no.size()==0) {
				sql2 = "select roomID from mb_room" ;
			}else {
				sql2 = "select roomID from mb_room where" ;
				for(int i=0 ; i<no.size() ; i++){
					if(i==0){
						sql2 = sql2+" roomId !="+String.valueOf(no.get(i)) ;
					}else {
						sql2 = sql2+" and roomId !="+String.valueOf(no.get(i)) ;
					}
				}
			}

			RS = ST.executeQuery(sql2+sql3) ;
			while(RS.next()==true){
				ok.add(RS.getInt("roomID")); 
			}
			System.out.println("예약가능한 방개수 : "+ok.size()) ;   
		}catch(Exception ex){System.out.println("revNo"+ex.toString());}
			return ok ;
		}

	public List okType(List ok){
		List okType = new ArrayList() ;      
		String sql1 ,sql2;
		try{         
			if(ok.size()==0) {
				okType=null ;
			}else {
				sql1 = "select roomType from(";
				sql2 = "select distinct(roomType),(roomCap) from mb_room where" ;
				for(int i=0 ; i<ok.size() ; i++){
	               if(i==0) {
	                  sql2 = sql2+" roomID in("+Integer.parseInt(String.valueOf(ok.get(i))) ; 
	               }else {
	                  sql2 = sql2+", "+Integer.parseInt(String.valueOf(ok.get(i))) ;
	               }              
	            }
				sql2 = sql2+") order by roomCap)" ;
	            
	            RS = ST.executeQuery(sql1+sql2) ;
	            while(RS.next()==true){
	            	okType.add(RS.getString("roomType")); 
	            }
	         }       

		}catch(Exception ex){System.out.println("revOkType : "+ex.toString()) ;}
			return okType ;
	}


	public DBbean revOkAll(String type, List room){
		DBbean bean = new DBbean();
		try{ 
			String sql1 = "select * from mb_room where roomType = '"+type+"' and roomID in(" ;
			String sql2 = "";
			for(int i=0 ; i<room.size(); i++) {
				if(i==0){
					sql2 = sql2 + ((Integer)room.get(i)).intValue() ; 
				}else {
					sql2 = sql2 + ", "+((Integer)room.get(i)).intValue() ;
				}        
			}            
			String sql3 = ")" ;
			RS = ST.executeQuery(sql1+sql2+sql3) ;   
			while(RS.next()){
				bean.setRoomID(RS.getInt("roomID")) ;
				bean.setRoomType(RS.getString("roomType")) ;
				bean.setRoomCost(RS.getInt("roomCost")) ;
				bean.setRoomCap(RS.getInt("roomCap")) ;
				bean.setRoomThumb(RS.getString("roomThumb")) ;
				bean.setRoomUse(RS.getInt("roomUse")) ;
				bean.setRoomInfo1(RS.getString("roomInfo1")) ;
				bean.setRoomInfo2(RS.getString("roomInfo2")) ;
				bean.setRoomInfo3(RS.getString("roomInfo3")) ;
				break ;            
			}
		}catch(Exception ex){System.out.println("revOkAll : "+ex.toString()) ;}
			return bean;      
	}

	public int revInsert(DBbean revdbbean){
		int ok=0;
		try {
			sql="insert into mb_reservation values(revID.nextval,?, ?, ?, ?, '"+revdbbean.getRevIn()+"',";
			sql+=" '"+revdbbean.getRevOut()+"', ?, sysdate)";
			PST = CN.prepareStatement(sql);
			PST.setString(1, revdbbean.getRevMember());
			PST.setInt(2, revdbbean.getRevRoomID());	
			PST.setInt(3, (revdbbean.getRevCost()*revdbbean.getRevTerm()));	
			PST.setInt(4, revdbbean.getRevCap());			
			PST.setInt(5, revdbbean.getRevTerm());

			ok = PST.executeUpdate();
			ok=1;
		} catch (Exception ex) {System.out.println("에러: "+ex.toString());}
		return ok;
	}

	public List<DBbean> revList(String revMember){
		List<DBbean> reser_List = new ArrayList<DBbean>() ;
		
		String sql="select * from mb_reservation where revMember='"+revMember+"'" + "order by revDate desc";
		try{
			ST = CN.createStatement() ;
			RS = ST.executeQuery(sql) ;
			System.out.println("쿼리문 실행");
			while(RS.next()==true){
				DBbean bean = new DBbean();
				bean.setRevCap(RS.getInt("revCap"));
				bean.setRevCost(RS.getInt("revCost"));
				bean.setRevDate(RS.getDate("revDate"));
				bean.setRevId(RS.getInt("revId"));
				bean.setRevIn(RS.getString("revIn"));
				bean.setRevMember(RS.getString("revMember"));
				bean.setRevOut(RS.getString("revOut"));
				bean.setRevRoomID(RS.getInt("revRoomID"));
				bean.setRevTerm(RS.getInt("revTerm"));
				reser_List.add(bean);
			}
		}catch(Exception ex){System.out.println(ex.toString());}
			return reser_List;
		}

	public int revDelete (String revID){
		int DelOK=0;		
		String sql="delete from mb_reservation where revID =" +revID ;
		try{
			ST = CN.createStatement() ;
			RS = ST.executeQuery(sql) ;
			DelOK=1;
		}catch(Exception ex){System.out.println(ex.toString());}
			return DelOK;
	}
	
	public int revDelete(int ID){
		int ok = 0; 
		String sql = "delete from mb_reservation where revID = "+ID ;
		try{
			ST = CN.createStatement() ;
			ok = ST.executeUpdate(sql);						
		}catch(Exception ex){System.out.println("revDelete : "+ex.toString());}
		return ok ;
	}
	
	public List roomAll(){
		List roomAll = new ArrayList() ;
		String sql = "select roomID, roomType from mb_room order by roomCost asc, roomID asc" ;
		try{
			ST = CN.createStatement() ;
			RS = ST.executeQuery(sql) ;
			while(RS.next()){
				DBbean bean = new DBbean() ;
				bean.setRoomID(RS.getInt("roomID")) ;
				bean.setRoomType(RS.getString("roomType")) ;
				roomAll.add(bean);
			}
		}catch(Exception ex){System.out.println("roomAll : "+ex.toString());}
		return roomAll ;
	}
	
	public List revAll(String start, String end){
		List revAll = new ArrayList();
		String sql = "select revRoomID, revIn, revOut, revTerm from mb_reservation where " ;
		sql +="(revIn>='"+start+"' and revIn<='"+end+"') or (revIn<='"+start+"' and revOut>='"+start+"') order by revIn asc" ;
		try{
			ST = CN.createStatement() ;
			RS = ST.executeQuery(sql) ;
			while(RS.next()){
				DBbean bean = new DBbean() ;
				bean.setRevRoomID(RS.getInt("revRoomID")) ;
				bean.setRevIn(RS.getString("revIn")) ;
				bean.setRevOut(RS.getString("revOut")) ;
				bean.setRevTerm(RS.getInt("revTerm")) ;
				
				revAll.add(bean);			
			}
		}catch(Exception ex){System.out.println("roomAll"+ex.toString());}		
		return revAll ;
	}
	
	public List revBoard(String sort, String order){
		List revBoard = new ArrayList() ;
		String sql = "select * from mb_reservation, login, mb_room where mb_reservation.revMember = login.id and mb_reservation.revRoomID = mb_room.roomID" ;
		String sql2 = " order by "+order+" "+sort ;
		try{			
			ST = CN.createStatement() ;
			RS = ST.executeQuery(sql+sql2) ;
			while(RS.next()){
				DBbean bean = new DBbean() ;
				bean.setRevId(RS.getInt("revID")) ;
				bean.setRevMember(RS.getString("revMember")) ;
				bean.setRevRoomID(RS.getInt("revRoomID")) ;
				bean.setRevCost(RS.getInt("revCost")) ;
				bean.setRevCap(RS.getInt("revCap")) ;
				bean.setRevIn(RS.getString("revIn")) ;
				bean.setRevOut(RS.getString("revOut")) ;
				bean.setRevTerm(RS.getInt("revTerm")) ;
				bean.setRevDate(RS.getDate("revDate")) ;
				bean.setRevName(RS.getString("name")) ;
				bean.setRevRoomType(RS.getString("roomType")) ;
				
				revBoard.add(bean) ;
			}
		}catch(Exception ex){System.out.println("revBoard() : "+ex.toString());}
		
		return revBoard;
	}
	
	// NOTICE PART ================================================================================
	public int notice_dbInsert(DBbean bean){
		int suck = 0;
			try{
				sql="insert into mb_notice values(mb_seq.nextval,?,?,?,sysdate,?)";
				PST = CN.prepareStatement(sql);
					
				PST.setString(1, bean.getTitle());
				PST.setString(2, bean.getContents());
				PST.setString(3, bean.getName());	
				PST.setInt(4, 0);
				suck = PST.executeUpdate();
			}catch(Exception ex){ ex.toString();}
		return suck;
	}
	
	public int notice_dbCount(){
		try{
			sql = "select count(*) as cnt from mb_notice";
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			if(RS.next()==true){ total = RS.getInt("cnt");}
		}catch(Exception ex){ ex.toString(); }
		return total;
	}
	
	public List<DBbean> notice_dbSelect(String pnum){
		List<DBbean> li = new ArrayList<DBbean>();
			try{
				limit=5;
				if(pnum == null) pnum="1";
				pageNUM = Integer.parseInt(pnum);
				start = (pageNUM - 1) * limit + 1 ;
				end = pageNUM * limit ;
				
				sql="select * from (select rownum as rn, num, title, contents, name ,sdate, hit from ";
				sql+=" (select * from mb_notice order by num desc))";
				sql+=" where rn between "+start+" and "+end;
				ST = CN.createStatement();
				RS = ST.executeQuery(sql);

				while(RS.next()==true){
					DBbean bean = new DBbean();
						bean.setRownum(RS.getInt("rn"));
						bean.setNum(RS.getInt("num"));
						bean.setTitle(RS.getString("title"));
						bean.setContents(RS.getString("contents"));
						bean.setName(RS.getString("name"));
						bean.setSdate(RS.getDate("sdate"));
						bean.setHit(RS.getInt("hit"));
						li.add(bean);
					}
			}catch(Exception ex){
				System.out.println("notice_dbSelect ERROR: "+ex.toString());
				}
		return li;
	}
	
	public DBbean notice_dbDetail(int data){
		DBbean bean = new DBbean();
		try{
			sql = "select * from mb_notice where num=" + data;
			
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			
			if(RS.next() == true){	
				int newcount = RS.getInt("hit") + 1 ;
				String sql2="update mb_notice set hit=" + newcount + "where num =" + data;
				bean.setNum(RS.getInt("num"));
				bean.setTitle(RS.getString("title"));
				bean.setContents(RS.getString("contents"));
				bean.setName(RS.getString("name"));
				bean.setSdate(RS.getDate("sdate"));
				bean.setHit(RS.getInt("hit"));
				ST.executeUpdate(sql2);
			}
		}catch(Exception ex){ ex.toString(); }
		return bean;
	}
	
	public void notice_dbDelete(int data){
		try{
			sql = "delete from mb_notice where num=" + data;
			ST = CN.createStatement();
			ST.executeUpdate(sql);
		}
		catch(Exception ex){ ex.toString(); }
	}
	
	public void notice_dbEditPre(String data){
		DBbean bean = new DBbean();
		try{
			sql = "update * from mb_notice where num=" + data;
			
			ST = CN.createStatement();
			ST.executeUpdate(sql);
			
			bean.setNum(RS.getInt("num"));
			bean.setTitle(RS.getString("title"));
			bean.setContents(RS.getString("contents"));
			bean.setName(RS.getString("name"));
			bean.setSdate(RS.getDate("sdate"));
			bean.setHit(RS.getInt("hit"));
			
		}catch(Exception ex){ ex.toString(); }
	}
	
	public int notice_dbEdit(DBbean bean){
		int success = 0;
		try{
			sql="update mb_notice set title=?, contents=? where num=?";

			PST = CN.prepareStatement(sql);
				PST.setString(1, bean.getTitle());
				PST.setString(2, bean.getContents());
				
				PST.setInt(3, bean.getNum());
			success = PST.executeUpdate();
			if(success > 0)
				System.out.println("NOTICE EDIT SUCCESS!!");
		}catch(Exception ex){ ex.toString(); }
		return success;
	}
	
	// EVENT PART =================================================================================
	public List dbSelectENow(int start, int end){
		ArrayList ENList = new ArrayList();
		try{
			sql = "select * from (select rownum as rn, e.num, e.mbevent_main, e.mbevent_thumb, e.title, ";
			sql += "e.content, e.e_start, e.e_end, e.time, e.hit from ";
			sql += "( select * from mb_event e where e_end >= sysdate order by e_end desc ) e ) ";
			sql += " where rn between " + start + " and " + end ;
			
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			
			while(RS.next()==true){
				DBbean bean = new DBbean();
					bean.setNum(RS.getInt("num"));
					bean.setMbevent_main(RS.getString("mbevent_main"));
					bean.setMbevent_thumb(RS.getString("mbevent_thumb"));
					bean.setTitle(RS.getString("title"));
					bean.setContent(RS.getString("content"));
					bean.setE_start(RS.getDate("e_start"));
					bean.setE_end(RS.getDate("e_end"));
					bean.setTime(RS.getDate("time"));
					bean.setHit(RS.getInt("hit"));
				ENList.add(bean);
			}
		}catch(Exception ex){ }
			
		return ENList;
	}
	
	
	public List dbSelectEPast(int start, int end){
		ArrayList ENList = new ArrayList();
		try{
			sql = "select * from (select rownum as rn, e.num, e.mbevent_main, e.mbevent_thumb, e.title, ";
			sql += "e.content, e.e_start, e.e_end, e.time, e.hit from ";
			sql += "( select * from mb_event e where e_end <= sysdate order by e_end desc ) e ) ";
			sql += " where rn between " + start + " and " + end ;
			
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			
			while(RS.next()==true){
				DBbean bean = new DBbean();
				bean.setNum(RS.getInt("num"));
				bean.setMbevent_main(RS.getString("mbevent_main"));
				bean.setMbevent_thumb(RS.getString("mbevent_thumb"));
				bean.setTitle(RS.getString("title"));
				bean.setContent(RS.getString("content"));
				bean.setE_start(RS.getDate("e_start"));
				bean.setE_end(RS.getDate("e_end"));
				bean.setTime(RS.getDate("time"));
				bean.setHit(RS.getInt("hit"));
				ENList.add(bean);
			}
		}catch(Exception ex){ }
			
		return ENList;
	}
	
	public int dbSelectAllENow() {
		int ENCount = 0;
		try {
			sql = "select count(*) as cnt from mb_event where e_end > sysdate";
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);

			if (RS.next()) {
				ENCount = RS.getInt("cnt");
			}
		} catch (Exception ex) {
		}
		return ENCount;
	}
	
	public int dbSelectAllEPast() {
		int EPCount = 0;
		try {
			sql = "select count(*) as cnt from mb_event where e_end < sysdate";
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);

			if (RS.next()) {
				EPCount = RS.getInt("cnt");
			}
		} catch (Exception ex) {
		}
		return EPCount;
	}
	
	public List dbDetailEAll(int num) {
		ArrayList EList = new ArrayList();
		try {
			sql = "select * from mb_event where num=" + num;
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);

			DBbean bean = new DBbean();

			while (RS.next() == true) {
				int hitCount = RS.getInt("hit") + 1;
				String sql2 = "update mb_event set hit=" + hitCount + " where num=" + num;

				bean.setNum(RS.getInt("num"));
				bean.setMbevent_main(RS.getString("mbevent_main"));
				bean.setMbevent_thumb(RS.getString("mbevent_thumb"));
				bean.setTitle(RS.getString("title"));
				bean.setContent(RS.getString("content"));
				bean.setE_start(RS.getDate("e_start"));
				bean.setE_end(RS.getDate("e_end"));
				bean.setTime(RS.getDate("time"));
				ST.executeUpdate(sql2);
				bean.setHit(hitCount);		
				EList.add(bean);
			}

		} catch (Exception ex) {
		}
		return EList;
	}
	
	public int dbInsertE(MultipartRequest mr)throws SQLException {
		int ok=0;
		try {
			sql = "insert into mb_event values(mb_event_num_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate , 0)";
			PST = CN.prepareStatement(sql);

			PST.setString(1, mr.getFilesystemName("mbevent_main"));
			PST.setString(2, mr.getFilesystemName("mbevent_thumb"));
			PST.setString(3, mr.getParameter("title"));
			PST.setString(4, mr.getParameter("content"));
			PST.setString(5, mr.getParameter("e_start"));
			PST.setString(6, mr.getParameter("e_end"));
			
			ok = PST.executeUpdate();

		} catch (Exception ex) {
		}
		return ok;
	}

	public int dbDeleteE(String num) {
		int delnum=0;
		try {
			sql = "delete from mb_event where num='" + num + "'";
			ST = CN.createStatement();
			delnum = ST.executeUpdate(sql);
		} catch (Exception ex) {
		}
		return delnum;
	}
	
	public DBbean dbPreModifyE(String num) {
		DBbean preModify = new DBbean();
		try {
			sql = "select * from mb_event where num=" + num;
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);

			while (RS.next() == true) {
				preModify.setNum(RS.getInt("num"));
				preModify.setMbevent_main(RS.getString("mbevent_main"));
				preModify.setMbevent_thumb(RS.getString("mbevent_thumb"));
				preModify.setTitle(RS.getString("title"));
				preModify.setContent(RS.getString("content"));
				preModify.setE_start(RS.getDate("e_start"));
				preModify.setE_end(RS.getDate("e_end"));
				preModify.setTime(RS.getDate("time"));
				preModify.setHit(RS.getInt("hit"));
			}
		} catch (Exception ex) {
		}
		return preModify;
	}
	
	public int dbModifyE(MultipartRequest mr) throws SQLException {
		int ok = 0;
		try {			
			sql = "update mb_event set mbevent_main=?, mbevent_thumb=?, title=?, content=?, e_start=?, e_end=?";
			sql += "where num=?";
			PST = CN.prepareStatement(sql);			
			PST.setString(1, mr.getFilesystemName("mbevent_main"));
			PST.setString(2, mr.getFilesystemName("mbevent_thumb"));
			PST.setString(3, mr.getParameter("title"));
			PST.setString(4, mr.getParameter("content"));
			PST.setString(5, mr.getParameter("e_start"));
			PST.setString(6, mr.getParameter("e_end"));
			PST.setString(7, mr.getParameter("num"));
			
			ok = PST.executeUpdate();		
			
		} catch (Exception ex) {
		}
		return ok;
	}
	
	// REQUEST PART ===================================================================================
	public int faqdbInsert(DBbean bean){
		int success=0;
		try{
			sql="insert into mb_request values(request_qno_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate)";
			PST = CN.prepareStatement(sql);
				PST.setString(1, bean.getQselect());
				PST.setString(2, bean.getQtitle());
				PST.setString(3, bean.getQname());
				PST.setString(4, bean.getQtel());
				PST.setString(5, bean.getQemail());
				PST.setString(6, bean.getQcontents());
				success = PST.executeUpdate();
				if(success>0){System.out.print("dbInsert(DBbean)저장성공!!!");}
		}catch(Exception ex){System.out.println(ex.toString());}
		return success;
	}
	
	public List<DBbean> faqdbSelect(int start, int end, String skey, String sval){
		List<DBbean> LT = new ArrayList<DBbean>();
		try{
			String subsql=" where "+skey+" like '%"+sval+"%'";	
			sql="select * from";
			sql+=" (select rownum as rn, qno, qselect, qtitle, qname, qtel, qemail, nalja from";
			sql+=" (select * from mb_request "+subsql+" order by nalja desc ))";
			sql+=" where rn between "+start+" and " + end;
			System.out.println(sql);
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);	
			while(RS.next()==true){
				DBbean bean = new DBbean();
				bean.setRn(RS.getInt("rn"));
				bean.setQno(RS.getInt("qno"));
				bean.setQselect(RS.getString("qselect"));
				bean.setQtitle(RS.getString("qtitle"));
				bean.setQname(RS.getString("qname"));
				bean.setQtel(RS.getString("qtel"));
				bean.setQemail(RS.getString("qemail"));
				bean.setNalja(RS.getDate("nalja"));
				
				LT.add(bean);
			}
		}catch(Exception ex){System.out.println(ex.toString());}
		return LT;
	}
	
	public DBbean faqdbDetail(int data){
		DBbean bean = new DBbean();
		try{
			sql="select * from mb_request where qno="+data;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
				
			while(RS.next()==true){		
				bean.setQselect(RS.getString("qselect"));
				bean.setQtitle(RS.getString("qtitle"));
				bean.setQname(RS.getString("qname"));
				bean.setQtel(RS.getString("qtel"));
				bean.setQemail(RS.getString("qemail"));
				bean.setQcontents(RS.getString("qcontents"));
				bean.setNalja(RS.getDate("nalja"));
			}
		}catch(Exception ex){}
		return bean;
	}
	
	public void faqdbDelete(int data){
		try{
			sql="select count(*) as cnt from mb_request where qno=" + data;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			if(RS.next()==true){total=RS.getInt("cnt");}
			if(total>0){
			sql="delete from mb_request where qno="+data;
			ST=CN.createStatement();
			ST.executeUpdate(sql);			
			System.out.println("\n"+data+"삭제성공");
			}
		}catch(Exception ex){System.out.println(ex.toString());}
	}
	
	public int faqdbTotal(){
		try{
			sql="select count(*) as cnt from mb_request";
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			if(RS.next()==true){
				total=RS.getInt("cnt");
			}
		}catch(Exception ex){System.out.println(ex.toString());}
		return total;
	}
	
	public int faqdbTotal(String skey, String sval){
		try{
			sql="select count(*) as cnt from mb_request where "+skey+" like '%"+sval+"%' ";
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			if(RS.next()==true){
				total=RS.getInt("cnt");
			}
		}catch(Exception ex){System.out.println(ex.toString());}
		return total;
	}
	
	// BOARD PART =================================================================================	
	public int G_boardInsert(DBbean bean){
		int success=0;
		
		try{
			sql="insert into mb_reviewboard values(review_seq.nextval, ?, ?, ?, sysdate, 0, 0, '1234',?,?)";
			PST=CN.prepareStatement(sql);
			
			PST.setString(1, bean.getTitle());
			PST.setString(2, bean.getContents());
			PST.setString(3, bean.getWriter());
			PST.setString(4, bean.getCategory());
			PST.setInt(5, bean.getRate());
			
			success=PST.executeUpdate();
			if(success>0){
				System.out.println("Board Insert Success");
				}
		}catch(Exception ex){ System.out.println("Board Insert Failed : "+ex.toString()); }
		return success;
	}
	
	public List<DBbean> G_boardSelect(String pnum){
		List<DBbean> list=new ArrayList<DBbean>();
		try{
			if(pnum==null) pnum="1";
			pageNUM=Integer.parseInt(pnum);
			
			start=G_total()-((pageNUM-1)*limit);
			end=G_total()-((pageNUM*limit)-1);
			System.out.println(G_total()+", "+start+", "+end);
			sql="select * from (select rownum as rn, e.* from (select * from mb_reviewboard order by wdate) e )";
			sql+=" where rn between "+end+" and "+start+" order by rn desc  ";
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			
			while(RS.next()==true){
				DBbean bean=new DBbean();
				bean.setRn(RS.getInt("rn"));
				bean.setNum(RS.getInt("num"));
				bean.setTitle(RS.getString("title"));
				bean.setContents(RS.getString("contents"));
				bean.setWriter(RS.getString("writer"));
				bean.setWdate(RS.getDate("wdate"));
				bean.setCount(RS.getInt("count"));
				bean.setReco(RS.getInt("reco"));
				bean.setCategory(RS.getString("category"));
				bean.setRate(RS.getInt("rate"));
				list.add(bean);
			}
		}catch(Exception ex){ System.out.println("Board List Error : "+ex.toString()); }
		return list;
	}
	
	public List<DBbean> G_boardSelect(String pnum,String keyfield2,String keyword,String category_type){
		List<DBbean> list=new ArrayList<DBbean>();
		try{
			if(pnum==null) pnum="1";
			pageNUM=Integer.parseInt(pnum);
			if(keyword == null || keyword=="null"){keyword = "" ;}
			if(category_type==null || category_type=="" || category_type.equals("all")) category_type="";
			if(keyfield2.equals("all")||keyfield2==null){
				keyfield2 = "title like '%"+keyword+"%' or contents " ; 
			}
			int sub = G_subtotal(category_type, keyfield2, keyword);
			if(sub==0){
				start=G_total()-((pageNUM-1)*limit);
				end=G_total()-((pageNUM*limit)-1);
			}else{
			start=sub-(pageNUM-1)*limit;
			end=start-(limit-1);
			}
			
			sqry="category like '%"+category_type+"%' and "+ keyfield2+" like '%"+keyword+"%' ";
			System.out.println(sqry);
			 
			sql="select * from (";
			sql+="select a.*, rownum rn from";
			sql+="(select * from mb_reviewboard where "+sqry+" order by wdate) a )";
		    sql+=" where rn between "+end+" and "+start+" order by rn desc ";
		    System.out.println(sql);
		    		    
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			while(RS.next()==true){
				DBbean bean=new DBbean();
				bean.setNum(RS.getInt("num"));
				bean.setCategory(RS.getString("category"));
				bean.setWriter(RS.getString("writer"));
				bean.setPwd(RS.getString("pwd"));
				bean.setTitle(RS.getString("title"));
				bean.setContents(RS.getString("contents"));
				bean.setWdate(RS.getDate("wdate"));
				bean.setCount(RS.getInt("count"));
				bean.setRate(RS.getInt("rate"));
				bean.setReco(RS.getInt("reco"));
				bean.setRn(RS.getInt("rn"));
				list.add(bean);
			}
		}catch(Exception ex){ System.out.println("Board List Error : "+ex.toString()); ex.printStackTrace(); }
		return list;
	}
	
	public int G_total(){
		try{
			String sql2="select count(*) as cnt from mb_reviewboard ";
			ST=CN.createStatement();
			RS=ST.executeQuery(sql2);
			if(RS.next()==true){
				total=RS.getInt("cnt");
			}
		}catch(Exception ex){ }
		return total;
	}
	
	public int G_subtotal(String category_type, String type2, String keyword){
		int subtotal=0;
		
		if(category_type==null || category_type=="" || category_type.equals("all")){ category_type="";}
		if(type2.equals("all")){
			type2 = "title like '%"+keyword+"%' or contents " ; 
		}
		String sqry="where category like '%"+category_type+"%' and "+ type2+" like '%"+keyword+"%' ";
		
		try{
			String sql2="select count(*) as cnt from mb_reviewboard "+sqry;
			System.out.println("sql2 = "+sql2);
			ST=CN.createStatement();
			RS=ST.executeQuery(sql2);
			if(RS.next()==true){
				subtotal=RS.getInt("cnt");
			}
		}catch(Exception ex){ }
		return subtotal;
	}
	
	public DBbean G_boardDetail(String nn){
		DBbean bean=new DBbean();
		try{
			sql="select * from mb_reviewboard where num="+nn;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			
			if(RS.next()==true){
				bean.setNum(RS.getInt("num"));
				bean.setTitle(RS.getString("title"));
				bean.setContents(RS.getString("contents"));
				bean.setCount(RS.getInt("count"));
				bean.setWriter(RS.getString("writer"));
				bean.setWdate(RS.getDate("wdate"));
				bean.setCategory(RS.getString("category"));
				bean.setReco(RS.getInt("reco"));
				bean.setRate(RS.getInt("rate"));
			}
		}catch(Exception ex){ System.out.println("Board Detail Error : "+ex.toString());  }
		return bean;
	}
	
	public DBbean G_boardDetail(String nn, String reco, String wflag){
		DBbean bean=new DBbean();
		if(wflag==null){
			readCount(nn);
		}
		try{
			if(reco!=null){
				sql="update mb_reviewboard set reco=reco+1, count=count-1 where num="+nn;
				PST=CN.prepareStatement(sql);
				PST.executeUpdate();
			}
			
			sql="select * from (select rownum as rn, e.* from (select * from mb_reviewboard order by wdate) e ) where num ="+nn;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			
			if(RS.next()==true){
				bean.setNum(RS.getInt("num"));
				bean.setRn(RS.getInt("rn"));
				bean.setTitle(RS.getString("title"));
				bean.setContents(RS.getString("contents"));
				bean.setCount(RS.getInt("count"));
				bean.setWriter(RS.getString("writer"));
				bean.setWdate(RS.getDate("wdate"));
				bean.setReco(RS.getInt("reco"));
				bean.setRate(RS.getInt("rate"));
				bean.setCategory(RS.getString("category"));
			}
		}catch(Exception ex){ System.out.println("Board Detail Error : "+ex.toString());  }
		return bean;
	}
	
	public DBbean G_boardDetail(String nn, String reco){ 
		DBbean bean=new DBbean();		
			readCount(nn);		
		try{
			if(reco!=null){
				sql="update mb_reviewboard set reco=reco+1, count=count-1 where num="+nn;
				PST=CN.prepareStatement(sql);
				PST.executeUpdate();
			}
			
			sql="select * from (select rownum as rn, e.* from (select * from mb_reviewboard order by wdate) e ) where num ="+nn;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			
			if(RS.next()==true){
				bean.setNum(RS.getInt("num"));
				bean.setRn(RS.getInt("rn"));
				bean.setTitle(RS.getString("title"));
				bean.setContents(RS.getString("contents"));
				bean.setCount(RS.getInt("count"));
				bean.setWriter(RS.getString("writer"));
				bean.setWdate(RS.getDate("wdate"));
				bean.setReco(RS.getInt("reco"));
				bean.setRate(RS.getInt("rate"));
				bean.setCategory(RS.getString("category"));
			}
		}catch(Exception ex){ System.out.println("Board Detail Error : "+ex.toString());  }
		return bean;
	}

	
	public int G_dbEdit(DBbean bean){
		int ok=0;
		try{
			sql="update mb_reviewboard set title=?, contents=? where num="+bean.getNum()+" " ;
			System.out.println(sql);
			PST=CN.prepareStatement(sql);
			PST.setString(1, bean.getTitle());
			PST.setString(2, bean.getContents());
			
			ok=PST.executeUpdate();
			System.out.println(ok);
		}catch(Exception ex){ System.out.println("Board Modify Error :" + ex.toString());  }
		return ok;
	}
	
	public void G_dbDelete(String data1){
		try{
			sql="delete from mb_reviewboard where num="+data1;
			ST=CN.createStatement();
			int ok=ST.executeUpdate(sql);
			if(ok>0){
				System.out.println("Board Delete Success");
				}
		}catch(Exception ex){ System.out.println("Board Delete Error :"+ex.toString()); }
	}
	
	public void readCount(String num){
		String sql = "update mb_reviewboard set count = count + 1 where num=?";
		int n=Integer.parseInt(num);
		try{
			PST = CN.prepareStatement(sql);
			PST.setInt(1, n);
			int res = PST.executeUpdate();
		}catch(Exception e){  System.out.println("Board Count Error : "+e.toString());  }
	}
	
	// BOARD COMMENT PART =========================================================================
	public int coInsert(DBbean bean, String data){	
		DBbean bean1=new DBbean();
		int success=0;
		try{
			sql="insert into mb_cmtreply values(co_seq.nextval, ?, ?, ?, ?)";
			PST=CN.prepareStatement(sql);
			PST.setString(1, bean.getCowriter());
			Date date=new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
			PST.setString(2, sdf.format(date));
			PST.setString(3, bean.getCmt());
			PST.setInt(4, Integer.parseInt(data));
			
			success=PST.executeUpdate();
			if(success>0){  System.out.println("Board Comment Insert Success");}
		}catch(Exception ex){ System.out.println("Board Comment Insert Error : "+ex.toString()); }
		return success;
	}
	
	public List<DBbean> coSelect(String num){
		List<DBbean> list=new ArrayList<DBbean>();
		try{			
			sql="select conum, cowriter, codate, cmt from mb_cmtreply where num="+num+"order by conum";
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			while(RS.next()==true){
				DBbean bean=new DBbean();
				bean.setConum(RS.getInt("conum"));
				bean.setCowriter(RS.getString("cowriter"));
				bean.setCodate(RS.getString("codate"));
				bean.setCmt(RS.getString("cmt"));
				list.add(bean);
			}
		}catch(Exception ex){ System.out.println("Board Comment List Error : "+ex.toString()); }
		return list;
	}
	
	public int cototal(int num){
		try{
			String sql="select count(*) as cnt from mb_cmtreply where num="+num;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			if(RS.next()==true){
				total1=RS.getInt("cnt");
			}
		}catch(Exception ex){ }
		return total1;
	}
	
	public void coDelete(String data1){
		try{
			sql="delete from mb_cmtreply where conum="+data1;
			ST=CN.createStatement();
			int ok=ST.executeUpdate(sql);
			if(ok>0){	System.out.println("Board Comment Delete Success");  }
		}catch(Exception ex){ System.out.println("Board Comment Delete Error :"+ex.toString()); }
	}
}