package ClothingStore.Category;
import java.util.List;
public interface CategoryDAO {
	public void insert(Category c);
	public void update(Category c);
	public void delete(int cid);
	public List<Category> getAllCategory();
	public Category getCategory(int cid);
}