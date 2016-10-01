package jiniShop.vo;

import java.util.Date;

public class MemberVO {
	private String id;
	private String name;
	private String email;
	private String mtemp;
	private String maddress1;
	private String maddress2;
	private Date birthday;
	private String info;
	private int point;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMtemp() {
		return mtemp;
	}
	public void setMtemp(String mtemp) {
		this.mtemp = mtemp;
	}
	public String getMaddress1() {
		return maddress1;
	}
	public void setMaddress1(String maddress1) {
		this.maddress1 = maddress1;
	}
	public String getMaddress2() {
		return maddress2;
	}
	public void setMaddress2(String maddress2) {
		this.maddress2 = maddress2;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
	
}
