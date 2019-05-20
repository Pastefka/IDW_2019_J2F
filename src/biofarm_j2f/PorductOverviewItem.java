package biofarm_j2f;

public class PorductOverviewItem {

	private String name;
	private String category;
	private int amount;
	private float sprice;
	private String farmer;
	
	
	public PorductOverviewItem() {
		this.name = null;
		this.category = null;
		this.amount = 0;
		this.sprice = 0;
		this.farmer = null;
	}
	
	public PorductOverviewItem(String name, String category, int amount, float sprice, String farmer) {
		this.name = name;
		this.category = category;
		this.amount = amount;
		this.sprice = sprice;
		this.farmer = farmer;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public float getSprice() {
		return sprice;
	}
	public void setSprice(float sprice) {
		this.sprice = sprice;
	}
	public String getFarmer() {
		return farmer;
	}
	public void setFarmer(String farmer) {
		this.farmer = farmer;
	}
	@Override
	public String toString() {
		return this.getName() + "          " + this.getAmount() +" x " + this.getSprice() + " Euro from: " + this.getFarmer();
		
	}
	
}
