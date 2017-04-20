package reserv_list.model;

import java.io.Serializable;

import com.schedule.model.ReservVO;

public class ReservListVO implements Serializable {
	private ReservVO reservVO;
	private Integer servNo;
	private Integer servPrice;
	private Integer servTime;
	private String servName;
	public ReservVO getReservVO() {
		return reservVO;
	}
	public void setReservVO(ReservVO reservVO) {
		this.reservVO = reservVO;
	}
	public Integer getServNo() {
		return servNo;
	}
	public void setServNo(Integer servNo) {
		this.servNo = servNo;
	}
	public Integer getServPrice() {
		return servPrice;
	}
	public void setServPrice(Integer servPrice) {
		this.servPrice = servPrice;
	}
	public Integer getServTime() {
		return servTime;
	}
	public void setServTime(Integer servTime) {
		this.servTime = servTime;
	}
	public String getServName() {
		return servName;
	}
	public void setServName(String servName) {
		this.servName = servName;
	}
}
