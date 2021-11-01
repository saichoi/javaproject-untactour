package board.vo;

public class PurchaseVo {
	private String purchase_id;
	private String item_id;
	private String customer_id;
	private String cnt;
	private String regdate;
	
	public PurchaseVo() {}
	public PurchaseVo(String purchase_id, String item_id, String customer_id, String cnt, String regdate) {
		this.purchase_id = purchase_id;
		this.item_id = item_id;
		this.customer_id = customer_id;
		this.cnt = cnt;
		this.regdate = regdate;
	}
	
	public String getPurchase_id() {
		return purchase_id;
	}
	public void setPurchase_id(String purchase_id) {
		this.purchase_id = purchase_id;
	}
	public String getItem_id() {
		return item_id;
	}
	public void setItem_id(String item_id) {
		this.item_id = item_id;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "PurchaseVo [purchase_id=" + purchase_id + ", item_id=" + item_id + ", customer_id=" + customer_id
				+ ", cnt=" + cnt + ", regdate=" + regdate + "]";
	}
}
