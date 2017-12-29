package ClothingStore.Products;
import java.util.List;



import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

@Repository
@EnableTransactionManagement
public class ProductsDAOImpl implements ProductsDAO{

	@Autowired
	SessionFactory sessionFactory;
	
	@Transactional
	public void insert(Products p) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(p);
	}
	@Transactional
	public void update(Products p) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().update(p);
	}

	@Transactional
	public void delete(int pid) {
		// TODO Auto-generated method stub
		//sessionfactory.getcurrentsession().delete;
		sessionFactory.getCurrentSession().createQuery("delete from Products p where p.Product_Id = :pid").setInteger("pid", pid).executeUpdate();
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Products> getAllProduct() {
		
		return sessionFactory.getCurrentSession().createQuery("from Products").list();
	}
	@Transactional
	public Products getProduct(int pid) {
		// TODO Auto-generated method stub
		return (Products)sessionFactory.getCurrentSession().createQuery("from Products p where p.Product_Id = :pid").setInteger("pid", pid).list().get(0);
	}
	@Transactional
	public List<Products> getProductWithoutId() {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().createQuery("from Products p where p.Pro_Id = -1 ").list();
	}
	@Transactional
	public List<Products> fetchProductWithCategoryId(int cid) {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().createQuery("from Products p where p.Pro_Id = :cid ").setInteger("cid", cid).list();
	}
}