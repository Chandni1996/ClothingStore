package ClothingStore.Products;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.json.simple.JSONObject;
import org.omg.CORBA.PRIVATE_MEMBER;
import org.springframework.web.multipart.MultipartFile;

@Entity

public class Products {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	int Product_Id;
	private int Pro_Id = -1;
	private String Product_name;
	private String Product_price;
	private String Product_image;
	
	@Transient
	MultipartFile file;
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	public int getProduct_Id() {
		return Product_Id;
	}
	public int getPro_Id() {
		return Pro_Id;
	}
	public void setPro_Id(int pro_Id) {
		Pro_Id = pro_Id;
	}
	public void setProduct_Id(int product_Id) {
		Product_Id = product_Id;
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
	public Products() {
		
	}
		public JSONObject getJSON()
    {
        JSONObject jobj = new JSONObject();
        jobj.put("Product_Id", Product_Id);
        jobj.put("Product_name", Product_name);
        jobj.put("Product_price", Product_price);
        jobj.put("Product_image", Product_image);
        return jobj;
        
    }   
}	
	