package ticket1;

import util.Parameter;
import java.sql.Timestamp;

import member.MemberVO;

public class PointVo {
	
	
	private int point_no;
	private int member_pk;
	private int usePoint;
	private String memo;
	private Timestamp pointRegistDate;
	
	

	public int getPoint_no() {
		return point_no;
	}
	
	public void setPoint_no(int point_no) {
		this.point_no = point_no;
	}
	public int getMember_pk() {
		return member_pk;
	}
	public void setMember_pk(int member_pk) {
		this.member_pk = member_pk;
	}
	public int getUsePoint() {
		return usePoint;
	}
	public void setUsePoint(int usePoint) {
		this.usePoint = usePoint;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public Timestamp getPointRegistDate() {
		return pointRegistDate;
	}
	public void setPointRegistDate(Timestamp pointRegistDate) {
		this.pointRegistDate = pointRegistDate;
	}
			
			
}
