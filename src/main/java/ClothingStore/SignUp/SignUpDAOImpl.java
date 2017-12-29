package ClothingStore.SignUp;
import java.util.List;



import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

@Repository
@EnableTransactionManagement
public class SignUpDAOImpl implements SignUpDAO{

	@Autowired
	SessionFactory sessionFactory;
	
	@Transactional
	public void insert(SignUpCat s) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(s);
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<SignUpCat> getAllCategories() {
		
		return sessionFactory.getCurrentSession().createQuery("from SignUpCat").list();
	}
	@Transactional
	public SignUpCat getCategory(int s_Id) {
		// TODO Auto-generated method stub
		return (SignUpCat)sessionFactory.getCurrentSession().createQuery("from SignUpCat s where s.s_Id = :s_Id").setInteger("s_Id", s_Id).list().get(0);
	}

}