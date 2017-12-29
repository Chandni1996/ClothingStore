package ClothingStore.Cart;

import java.util.List;

public interface CartDAO {

	public Cart getcartByid( int cartid);
	public Cart getcartbyUserName(String name);
	public String checkUserName(String name);
		public void insert(Cart c);
		public void update(Cart c);
		public void delete(int cid);
		public void deletebyCartid( int cartid);
		public List<Cart> getAllcategories();
		public List<Cart> getAllProductsInCart();
		public Cart getcategory(int cid);
		public  Cart getProductWithMaxId();
	}