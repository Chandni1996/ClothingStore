package ClothingStore.Cart;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

@Repository
@EnableTransactionManagement
@Transactional
public class CartDAOImpl implements CartDAO{
	 @Autowired
	 SessionFactory sessionFactory;
	
	 public Cart getcartByid( int cartid){
		 List l = sessionFactory.getCurrentSession().createQuery("from Cart where cartid = :cartid").setInteger("cartid", cartid).list();
	        
	        if( l.size() > 0 )
	            return (Cart)l.get(0);
	        else
	            return null;
	            }
		
    public Cart getcartbyUserName(String name){
    	 List l = sessionFactory.getCurrentSession().createQuery("from Cart where name = :name").setString("name", name).list();
         
         if( l.size() > 0 )
             return (Cart)l.get(0);
         else
             return null;
     }	
    
	public String checkUserName(String name){
		 List l = sessionFactory.getCurrentSession().createQuery("from Cart where UserName = :UserName").setString("UserName", name).list();
	        
	        if( l.size() == 0 )
	            return "success";
	        else
	            return "failure";	
	}
	public void insert(Cart c){
		  // TODO Auto-generated method stub
        sessionFactory.getCurrentSession().save(c);
		
	}
	public void update(Cart c){
		   // TODO Auto-generated method stub
        sessionFactory.getCurrentSession().update(c);
	}
	public void delete(int cid){
		// TODO Auto-generated method stub
        //sessionfactory.getcurrentsession().delete;
        sessionFactory.getCurrentSession().createQuery("delete from Cart c where c.id = :cid").setInteger("cid", cid).executeUpdate();
	}
	public void deletebyCartid( int cartid){
		sessionFactory.getCurrentSession().createQuery("delete from Cart as i where i.cartid = :cartid").setInteger("cartid", cartid).executeUpdate();
		
	}
	public List<Cart> getAllcategories(){
		// TODO Auto-generated method stub
        return sessionFactory.getCurrentSession().createQuery("from Cart").list();	
	}
	public Cart getcategory(int cid){
		 // TODO Auto-generated method stub
        return (Cart)sessionFactory.getCurrentSession().createQuery("from Cart c where c.cartid = :cid").setInteger("cid", cid).list().get(0);	
	}
	public  Cart getProductWithMaxId(){
		  // TODO Auto-generated method stub
        return (Cart)sessionFactory.getCurrentSession().createQuery("from Cart c where c.cartid =( select max(cartid) from Cart )").list().get(0);	
	}

	public List<Cart> getAllProductsInCart() {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().createQuery("from Cart").list();
	}

}
