package ClothingStore.Cart;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity

public class Cart implements Serializable {
	
	int Product_Id;
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	int Id;
	private String cartQuantity;
	private String Product_name;
	private String Product_price;
	private String Product_image;
	private String billingaddress;
	private String UserName;
	@Transient
	MultipartFile file;
	public int getProduct_Id() {
		return Product_Id;
	}
	public void setProduct_Id(int product_Id) {
		Product_Id = product_Id;
	}
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getCartQuantity() {
		return cartQuantity;
	}
	public void setCartQuantity(String cartQuantity) {
		this.cartQuantity = cartQuantity;
	}
	public String getProduct_name() {
		return Product_name;
	}
	public void setProduct_name(String product_name) {
		Product_name = product_name;
	}
	public String getProduct_price() {
		return Product_price;
	}
	public void setProduct_price(String product_price) {
		Product_price = product_price;
	}
	public String getProduct_image() {
		return Product_image;
	}
	public void setProduct_image(String product_image) {
		Product_image = product_image;
	}
	public String getBillingaddress() {
		return billingaddress;
	}
	public void setBillingaddress(String billingaddress) {
		this.billingaddress = billingaddress;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
}