package ClothingStore.SignUp;
import java.util.List;

public interface SignUpDAO {
public void insert(SignUpCat s);
public List<SignUpCat> getAllCategories();
public  SignUpCat getCategory(int s_Id);
}

