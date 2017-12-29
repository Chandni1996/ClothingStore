package ClothingStore.Category;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
public class Category {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	int Category_Id;
	private String Main;
	private String Sub1;
	private String Sub2;
	
	public int getCategory_Id() {
		return Category_Id;
	}
	public void setCategory_Id(int category_Id) {
		Category_Id = category_Id;
	}
	public String getMain() {
		return Main;
	}
	public void setMain(String main) {
		Main = main;
	}
	public String getSub1() {
		return Sub1;
	}
	public void setSub1(String sub1) {
		Sub1 = sub1;
	}
	public String getSub2() {
		return Sub2;
	}
	public void setSub2(String sub2) {
		Sub2 = sub2;
	}
	
}	
	