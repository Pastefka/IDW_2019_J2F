package biofarm_j2f;

public class Product {
	private  int id;
	private String name;
	private String category;
	private float fat;
	private float carbs;
	private float prot;
	private float kcal;
	private boolean seasonal;
	private float price;
	private int amount;
	
	
	
	
	
	
	public Product() {
		this.id = 0;
		this.name = null;
		this.category = null;
		this.fat = 0;
		this.carbs = 0;
		this.prot = 0;
		this.kcal = 0;
		this.seasonal = false;
		this.price = 0;
		this.amount = 0;
	}
	
	public Product(int id, String name, String category, float fat, float carbs, float prot, float kcal,
			boolean seasonal, float price, int amount) {
		this.id = id;
		this.name = name;
		this.category = category;
		this.fat = fat;
		this.carbs = carbs;
		this.prot = prot;
		this.kcal = kcal;
		this.seasonal = seasonal;
		this.price = price;
		this.amount = amount;
	}
	
	@Override
	public String toString() {
		return this.getName() + "          " + this.getAmount() +" x " + this.getPrice() + " Euro";
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public float getFat() {
		return fat;
	}
	public void setFat(float fat) {
		this.fat = fat;
	}
	public float getCarbs() {
		return carbs;
	}
	public void setCarbs(float carbs) {
		this.carbs = carbs;
	}
	public float getProt() {
		return prot;
	}
	public void setProt(float prot) {
		this.prot = prot;
	}
	public float getKcal() {
		return kcal;
	}
	public void setKcal(float kcal) {
		this.kcal = kcal;
	}
	public boolean isSeasonal() {
		return seasonal;
	}
	public void setSeasonal(boolean seasonal) {
		this.seasonal = seasonal;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	
	
	
	
}
