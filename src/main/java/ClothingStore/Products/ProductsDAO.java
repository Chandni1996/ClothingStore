package ClothingStore.Products;
import java.util.List;
public interface ProductsDAO {
	public void insert(Products p);
	public void update(Products p);
	public void delete(int pid);
	public List<Products> getAllProduct();
	public  Products getProduct(int pid);
	public  List<Products> getProductWithoutId();
	public  List<Products> fetchProductWithCategoryId( int cid );
}