package biofarm_j2f;
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PostgresConnection {

	final String dbUrl = "jdbc:postgresql://localhost:5432/biofarm_j2f_db";
	final String dbUser = "postgres";
	final String dbPassword = "datenbank1234";

	private Connection conn = null;

	public PostgresConnection() {
		try {
			Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		try {
			this.conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

	}
	
	public int CheckFarmerId(String user, String password) {
		//	Funktion prüft ob Farmer enthalten ist und gibt die ID zurück
		// returns 0 falls nicht enthalten
		
		int farmerId = 0;
		
		try {
			String sql = "SELECT id FROM public.farmer where benutzer = ? and password = ?";
			PreparedStatement pstm = this.conn.prepareStatement(sql);
			pstm.setString(1, user);
			pstm.setString(2, password);
			ResultSet rs = pstm.executeQuery();
			while(rs.next()) {
				farmerId = rs.getInt("id");
			}
			rs.close();
			pstm.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return farmerId;
	}

	public int CheckCustomerId(String user, String password) {
		//	Funktion prüft ob Customer enthalten ist und gibt die ID zurück
		// returns 0 falls nicht enthalten
		
		int customerId = 0;
		
		try {
			String sql = "SELECT id FROM public.customer where benutzer = ? and password = ?";
			PreparedStatement pstm = this.conn.prepareStatement(sql);
			pstm.setString(1, user);
			pstm.setString(2, password);
			ResultSet rs = pstm.executeQuery();
			while(rs.next()) {
				customerId = rs.getInt("id");
			}
			rs.close();
			pstm.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return customerId;
	}
	
	public void insertMyProduct(int farmerId, int productId, int amount, float price) {
		String sql ="INSERT INTO public.productlists(farmerid, productid, amount, sprice)" + 
				"	VALUES (?, ?, ?, ?);";
		
		try {
			PreparedStatement pstm = this.conn.prepareStatement(sql);
			pstm.setInt(1, farmerId);
			pstm.setInt(2, productId);
			pstm.setInt(3, amount);
			pstm.setFloat(4, price);
			pstm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<Product> getProductList(int farmerId) {
		
		String sql = "select product.*, productlists.sprice::money::numeric::float8, productlists.amount from product" + 
				"	inner join productlists" + 
				"		on productlists.productid = product.id" + 
				"		where farmerid = ?";
		
		PreparedStatement pstm;
		ArrayList<Product> products = null;
		try {
			pstm = this.conn.prepareStatement(sql);
			pstm.setInt(1, farmerId);
			ResultSet rs = pstm.executeQuery();
			products = new ArrayList<Product>();
			while(rs.next()) {
				Product pr = new Product();
				pr.setName(rs.getString("name"));
				pr.setCategory(Strings.category[rs.getInt("category")]);
				pr.setSeasonal(rs.getBoolean("seasonal"));
				pr.setKcal(rs.getFloat("kcal"));
				pr.setCarbs(rs.getFloat("carbs"));
				pr.setFat(rs.getFloat("fat"));
				pr.setProt(rs.getFloat("prot"));
				pr.setId(rs.getInt("id"));
				pr.setPrice(rs.getFloat("sprice"));
				pr.setAmount(rs.getInt("amount"));
				products.add(pr);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return products;		
	}
	
	public ArrayList<PorductOverviewItem> getProductListOverview(){
		String sql = "select product.name, product.category,productlists.amount, productlists.sprice::money::numeric::float8, farmer.benutzer \r\n" + 
				"from product\r\n" + 
				"	inner join productlists\r\n" + 
				"		on productlists.productid = product.id\r\n" + 
				"			inner join farmer\r\n" + 
				"				on productlists.farmerid = farmer.id\r\n" + 
				"	order by product.name asc";
		ArrayList<PorductOverviewItem> list = null;
		try {
			list = new ArrayList<PorductOverviewItem>();
			PreparedStatement pstm = this.conn.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			while(rs.next()) {
				PorductOverviewItem pr = new PorductOverviewItem();
				pr.setName(rs.getString("name"));
				pr.setAmount(rs.getInt("amount"));
				pr.setSprice(rs.getFloat("sprice"));
				pr.setCategory(Strings.category[rs.getInt("category")]);
				pr.setFarmer(rs.getString("benutzer"));
				
				list.add(pr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	public void insertProduct(String name, int category, float fat, float carbs, float prot, float kcal, boolean seasonal) {
		
		String sql ="INSERT INTO public.product(name, category, fat, carbs, prot, kcal, seasonal)" + 
				"	VALUES ( ?, ?, ?, ?, ?, ?, ?);";
		try {
			PreparedStatement pstm = this.conn.prepareStatement(sql);
			pstm.setString(1, name);
			pstm.setInt(2, category);
			pstm.setFloat(3, fat);
			pstm.setFloat(4, carbs);
			pstm.setFloat(5, prot);
			pstm.setFloat(6, kcal);
			pstm.setBoolean(7, seasonal);
			pstm.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}
	
	public void insertProductList(int farmerId, int productId, int amount, float sprice) {
		
		String sql = "INSERT INTO public.productlists(farmerid, productid, amount, sprice)" + 
				"	VALUES (?, ?, ?, ?);";
		try {
			PreparedStatement pstm = this.conn.prepareStatement(sql);
			pstm.setInt(1, farmerId);
			pstm.setInt(2, productId);
			pstm.setInt(3, amount);
			pstm.setFloat(4, sprice);
			pstm.execute();			
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}
	
	public int selectProductId(String name) {
		
		int id = 0;
		String sql = "Select product.id from product where name = ?";
		try {
			PreparedStatement pstm = this.conn.prepareStatement(sql);
			pstm.setString(1, name);
			ResultSet rs = pstm.executeQuery();
			while(rs.next()) {
				id = rs.getInt("id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}

	
	
}
