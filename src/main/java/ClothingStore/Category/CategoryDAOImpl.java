package ClothingStore.Category;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

@Repository
@EnableTransactionManagement
public class CategoryDAOImpl implements CategoryDAO{

	@Autowired
	SessionFactory sessionFactory;
	
	@Transactional
	public void insert(Category c) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(c);
	}
	@Transactional
	public void update(Category c) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().update(c);
	}

	@Transactional
	public void delete(int cid) {
		// TODO Auto-generated method stub
		//sessionfactory.getcurrentsession().delete;
		sessionFactory.getCurrentSession().createQuery("delete from Category c where c.Category_Id = :cid").setInteger("cid", cid).executeUpdate();
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Category> getAllCategory() {
		
		return sessionFactory.getCurrentSession().createQuery("from Category").list();
	}
	@Transactional
	public Category getCategory(int cid) {
		// TODO Auto-generated method stub
		return (Category)sessionFactory.getCurrentSession().createQuery("from Category c where c.Category_Id = :cid").setInteger("cid", cid).list().get(0);
	}
}
