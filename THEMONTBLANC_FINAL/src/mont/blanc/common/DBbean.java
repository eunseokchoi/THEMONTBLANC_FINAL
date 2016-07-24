package mont.blanc.common;

import java.util.Date;

public class DBbean {
	// MEMBER PART ================================================================================
	private int membernum, rn;
	private String id, pw, birthday, tel, gender;
	private String engname, korname, addr, email, country;
	
	// RESERVATION PART ===========================================================================
	private int revId;
	private String revMember;
	private String revName;
	private int revRoomID;
	private int revCost;
	private int revCap;
	private String revIn;
	private String revOut;
	private int revTerm;
	private Date revDate;
	private String revRoomType;
	
	private int roomID;
	private String roomType;
	private int roomCost;
	private int roomCap;
	private String roomThumb;
	private int roomUse;
	private String roomInfo1;
	private String roomInfo2;
	private String roomInfo3;
	
	// NOTICE PART ===========================================================================
	private String contents;
	private String name;
	private java.util.Date sdate;
	private String skey;
	private String sval;
	
	// EVENT PART =================================================================================
	private int rownum;
	private int num;
	private String mbevent_main;
	private String mbevent_thumb;
	private String title;
	private String content;
	private java.util.Date e_start;
	private java.util.Date e_end;
	private java.util.Date time;
	private int hit;
	
	// REQUEST ====================================================================================
	private int qno;
	private String qselect;
	private String qtitle;
	private String qname;
	private String qtel;
	private String qemail;
	private String qcontents;
	private java.util.Date nalja;
	
	// BOARD PART =====================
	
	private String writer;
	private java.util.Date wdate;
	private int count;
	private int reco;
	private String pwd;
	private int cmtcount;
	private int rate;
	private String category ;
		
	// BOARD COMMENT PART =====================
	private int conum;
	private String cowriter;
	private String codate;
	private String cmt;
	private int b_num;
	private int co_rn;
	
	// MEMBER PART ================================================================================
	public int getMembernum() {
		return membernum;
	}
	public void setMembernum(int membernum) {
		this.membernum = membernum;
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEngname() {
		return engname;
	}
	public void setEngname(String engname) {
		this.engname = engname;
	}
	public String getKorname() {
		return korname;
	}
	public void setKorname(String korname) {
		this.korname = korname;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	// RESERVATION PART ===========================================================================
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public int getRevId() {
		return revId;
	}
	public void setRevId(int revId) {
		this.revId = revId;
	}
	public String getRevMember() {
		return revMember;
	}
	public void setRevMember(String revMember) {
		this.revMember = revMember;
	}
	public String getRevName() {
		return revName;
	}
	public void setRevName(String revName) {
		this.revName = revName;
	}
	public int getRevRoomID() {
		return revRoomID;
	}
	public void setRevRoomID(int revRoomID) {
		this.revRoomID = revRoomID;
	}
	public int getRevCost() {
		return revCost;
	}
	public void setRevCost(int revCost) {
		this.revCost = revCost;
	}
	public int getRevCap() {
		return revCap;
	}
	public void setRevCap(int revCap) {
		this.revCap = revCap;
	}
	public String getRevIn() {
		return revIn;
	}
	public void setRevIn(String revIn) {
		this.revIn = revIn;
	}
	public String getRevOut() {
		return revOut;
	}
	public void setRevOut(String revOut) {
		this.revOut = revOut;
	}
	public int getRevTerm() {
		return revTerm;
	}
	public void setRevTerm(int revTerm) {
		this.revTerm = revTerm;
	}
	public Date getRevDate() {
		return revDate;
	}
	public void setRevDate(Date revDate) {
		this.revDate = revDate;
	}
	public String getRevRoomType() {
		return revRoomType;
	}
	public void setRevRoomType(String revRoomType) {
		this.revRoomType = revRoomType;
	}
	
	public int getRoomID() {
		return roomID;
	}
	public void setRoomID(int roomID) {
		this.roomID = roomID;
	}
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	public int getRoomCost() {
		return roomCost;
	}
	public void setRoomCost(int roomCost) {
		this.roomCost = roomCost;
	}
	public int getRoomCap() {
		return roomCap;
	}
	public void setRoomCap(int roomCap) {
		this.roomCap = roomCap;
	}
	public String getRoomThumb() {
		return roomThumb;
	}
	public void setRoomThumb(String roomThumb) {
		this.roomThumb = roomThumb;
	}
	public int getRoomUse() {
		return roomUse;
	}
	public void setRoomUse(int roomUse) {
		this.roomUse = roomUse;
	}
	public String getRoomInfo1() {
		return roomInfo1;
	}
	public void setRoomInfo1(String roomInfo1) {
		this.roomInfo1 = roomInfo1;
	}
	public String getRoomInfo2() {
		return roomInfo2;
	}
	public void setRoomInfo2(String roomInfo2) {
		this.roomInfo2 = roomInfo2;
	}
	public String getRoomInfo3() {
		return roomInfo3;
	}
	public void setRoomInfo3(String roomInfo3) {
		this.roomInfo3 = roomInfo3;
	}
	
	// NOTICE PART ================================================================================
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public java.util.Date getSdate() {
		return sdate;
	}
	public void setSdate(java.util.Date sdate) {
		this.sdate = sdate;
	}
	public String getSkey() {
		return skey;
	}
	public void setSkey(String skey) {
		this.skey = skey;
	}
	public String getSval() {
		return sval;
	}
	public void setSval(String sval) {
		this.sval = sval;
	}
	
	// EVENT PART =================================================================================
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getMbevent_main() {
		return mbevent_main;
	}
	public void setMbevent_main(String mbevent_main) {
		this.mbevent_main = mbevent_main;
	}
	public String getMbevent_thumb() {
		return mbevent_thumb;
	}
	public void setMbevent_thumb(String mbevent_thumb) {
		this.mbevent_thumb = mbevent_thumb;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public java.util.Date getE_start() {
		return e_start;
	}
	public void setE_start(java.util.Date e_start) {
		this.e_start = e_start;
	}
	public java.util.Date getE_end() {
		return e_end;
	}
	public void setE_end(java.util.Date e_end) {
		this.e_end = e_end;
	}
	public java.util.Date getTime() {
		return time;
	}
	public void setTime(java.util.Date time) {
		this.time = time;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	// FAQ PART ===============================================================================
	public int getQno() {
		return qno;
	}
	public void setQno(int qno) {
		this.qno = qno;
	}
	public String getQselect() {
		return qselect;
	}
	public void setQselect(String qselect) {
		this.qselect = qselect;
	}
	public String getQtitle() {
		return qtitle;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	public String getQname() {
		return qname;
	}
	public void setQname(String qname) {
		this.qname = qname;
	}
	public String getQtel() {
		return qtel;
	}
	public void setQtel(String qtel) {
		this.qtel = qtel;
	}
	public String getQemail() {
		return qemail;
	}
	public void setQemail(String qemail) {
		this.qemail = qemail;
	}
	public String getQcontents() {
		return qcontents;
	}
	public void setQcontents(String qcontents) {
		this.qcontents = qcontents;
	}
	public java.util.Date getNalja() {
		return nalja;
	}
	public void setNalja(java.util.Date nalja) {
		this.nalja = nalja;
	}
	
	// BOARD PART =================================================================================
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public java.util.Date getWdate() {
		return wdate;
	}
	public void setWdate(java.util.Date wdate) {
		this.wdate = wdate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getReco() {
		return reco;
	}
	public void setReco(int reco) {
		this.reco = reco;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public int getCmtcount() {
		return cmtcount;
	}
	public void setCmtcount(int cmtcount) {
		this.cmtcount = cmtcount;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	// BOARD COMMENT PART =========================================================================
	public int getConum() {
		return conum;
	}
	public void setConum(int conum) {
		this.conum = conum;
	}
	public String getCowriter() {
		return cowriter;
	}
	public void setCowriter(String cowriter) {
		this.cowriter = cowriter;
	}
	public String getCodate() {
		return codate;
	}
	public void setCodate(String codate) {
		this.codate = codate;
	}
	public String getCmt() {
		return cmt;
	}
	public void setCmt(String cmt) {
		this.cmt = cmt;
	}
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	public int getCo_rn() {
		return co_rn;
	}
	public void setCo_rn(int co_rn) {
		this.co_rn = co_rn;
	}
}