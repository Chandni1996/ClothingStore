package ClothingStore;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Function;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.swing.plaf.basic.BasicScrollPaneUI.HSBChangeListener;
import javax.validation.Valid;

import org.cloudinary.json.JSONArray;
import org.hibernate.jpa.internal.HEMLogging;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

import ClothingStore.Cart.Cart;
import ClothingStore.Cart.CartDAO;
import ClothingStore.Category.Category;
import ClothingStore.Category.CategoryDAO;
import ClothingStore.Products.Products;
import ClothingStore.Products.ProductsDAO;
import ClothingStore.SignUp.SignUpCat;
import ClothingStore.SignUp.SignUpDAO;

@Controller
public class MasterController {
	
	   Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
	              "cloud_name", "cloud-chandni",
	              "api_key", "435138834155583",
	              "api_secret", "0xwRb4kIAKNkOnGH-qc7BNxILrE"));


	   public String test()
		{
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		    if (auth != null && !auth.getName().equals("anonymousUser"))
		    {    
		    	System.out.println(auth.getName());
		    	//System.out.println("User present");
		    	return "false";
		    }
		    else
		    {
		    	System.out.println("User not present");
		    	return "true";
		    }
		    
		    
			
		}
	   
	@Autowired
	SignUpDAO sdao;
	
	@Autowired
	CategoryDAO cdao;
	
	@Autowired
	ProductsDAO pdao;
	
	@Autowired
	CartDAO ctdao;
	
	@Autowired
	ServletContext context;
	
@RequestMapping(value="/AddSignUpToDB", method=RequestMethod.POST)
	
	ModelAndView AddSignUpToDB( @Valid @ModelAttribute("sign") SignUpCat s123, BindingResult bind )
	{
		ModelAndView modelAndView = new ModelAndView("redirect:/");
		if (bind.hasErrors())
		{
			modelAndView=new ModelAndView("SignUpForm");
			modelAndView.addObject("myerrors", "myerrors");
			return modelAndView;
		}
		else
		{
			
			
			if( !s123.getPwd().equals(s123.getCon_pwd()) )
			{
				modelAndView = new ModelAndView("SignUpForm");
				modelAndView.addObject("mypasswordmismatch", "trypasswordmismatch");
				return modelAndView;
			}
			else
			{
				List<SignUpCat> l = sdao.getAllCategories();
					boolean found = false;
				for( SignUpCat s1 : l )
				{
					if( s1.getUsr().equals(s123.getUsr()) )
					{
						found = true;
						break;
					}
				}
				
				if( found )
				{
					modelAndView = new ModelAndView("SignUpForm");
					modelAndView.addObject("useralreadyexists", "useralreadyexists");
					return modelAndView;
				}
				else
				{
					modelAndView = new ModelAndView("redirect:/");
					sdao.insert(s123);
					
					return modelAndView;
				}
				
				
			}
				
		}
		
	}
@RequestMapping("/SignUpForm")
ModelAndView sign(){
ModelAndView modelAndView = new ModelAndView("SignUpForm");
modelAndView.addObject("sign", new SignUpCat() );
return modelAndView;
}


@RequestMapping("/AddCategory")
ModelAndView AddCategory()
{
	ModelAndView modelAndView = new ModelAndView("AddCategory");

	modelAndView.addObject("cat", new Category());
	
	return modelAndView;
}

@RequestMapping("/ShowCategory")
ModelAndView Category()
{
	ModelAndView modelAndView = new ModelAndView("ShowCategory");

	modelAndView.addObject("catlist", cdao.getAllCategory() );
	
	return modelAndView;
}

@RequestMapping("/AddCategoryToDB")
ModelAndView AddCategoryToDB( @ModelAttribute("cat") Category c123 )
{
	ModelAndView modelAndView = new ModelAndView("redirect:/AddCategory");
	
	cdao.insert(c123);
	
	return modelAndView;
}

@RequestMapping("/DeleteCategoryFromDB/{cid}")
ModelAndView DeleteCategory1FromDB( @PathVariable("cid") int Category_Id )
{
	ModelAndView modelAndView = new ModelAndView("redirect:/ShowCategory");
	
	cdao.delete(Category_Id);
	
	return modelAndView;
}

@RequestMapping("/UpdateCategory/{Category_Id}")
ModelAndView update1( @PathVariable("Category_Id") int id )
{
	ModelAndView modelAndView = new ModelAndView("UpdateCategory");

	Category t = cdao.getCategory(id);
	
	modelAndView.addObject("cat", t );
	
	return modelAndView;
}

@RequestMapping("/UpdateCategoryToDB")
ModelAndView DeleteCategoryFromDB( @ModelAttribute("cat") Category t )
{
	ModelAndView modelAndView = new ModelAndView("redirect:/ShowCategory");
	
	cdao.update(t);
	
	return modelAndView;
}

@RequestMapping("/AddProducts")
ModelAndView AddProduct()
{
	ModelAndView modelAndView = new ModelAndView("AddProducts");

	modelAndView.addObject("pro", new Products());
	
	return modelAndView;
}

@RequestMapping("/ShowProducts")
ModelAndView product()
{
	ModelAndView modelAndView = new ModelAndView("ShowProducts");

	modelAndView.addObject("Product_list", pdao.getAllProduct() );
	   JSONArray  jarr = new JSONArray();
        for( Products i: pdao.getAllProduct())
        {
            jarr.put(i.getJSON());
        } 
                
        System.out.println(jarr.toString());
                
        modelAndView.addObject("productData",jarr);
	
	return modelAndView;
}

@RequestMapping("/AddProductToDB")
ModelAndView AddProductToDB( @ModelAttribute("pro") Products p123 )
{
	ModelAndView modelAndView = new ModelAndView("redirect:/AddProducts");
	
	pdao.insert(p123);
	try{
        String path = context.getRealPath("/");
        
        System.out.println(path);
        
        File directory = null;
        
        if (p123.getFile().getContentType().contains("image"))
        {
            File convFile = new File(p123.getFile().getOriginalFilename());
            convFile.createNewFile();
            FileOutputStream fos = new FileOutputStream(convFile); 
            fos.write(p123.getFile().getBytes());
            fos.close();
             Map uploadResult = cloudinary.uploader().upload( convFile , ObjectUtils.emptyMap());
              System.out.println( uploadResult.get("secure_url") );
             p123.setProduct_image( ((java.util.Map) uploadResult).get("secure_url").toString() );
            
             System.out.println("*********"+p123.getProduct_image());
             pdao.update(p123);
         }
    }
    catch( Exception e )
    {
        e.printStackTrace();
    }
    
 	return modelAndView;

}

@RequestMapping("/DeleteProductFromDB/{pid}")
ModelAndView DeleteProductFromDB( @PathVariable("pid") int Product_Id )
{
	ModelAndView modelAndView = new ModelAndView("redirect:/ShowProducts");
	
	pdao.delete(Product_Id);
	
	return modelAndView;
}

@RequestMapping("/UpdateProduct/{Product_Id}")
ModelAndView update( @PathVariable("Product_Id") int id )
{
	ModelAndView modelAndView = new ModelAndView("UpdateProducts");

	Products t = pdao.getProduct(id);
	
	modelAndView.addObject("pro", t );
	
	return modelAndView;
}

@RequestMapping("/UpdateProductToDB")
ModelAndView DeleteProductFromDB( @ModelAttribute("pro") Products t )
{
	ModelAndView modelAndView = new ModelAndView("redirect:/ShowProducts");
	
	pdao.update(t);
	
	try{
        String path = context.getRealPath("/");
        
        System.out.println(path);
        
        File directory = null;
        
        if (t.getFile().getContentType().contains("image"))
        {
            File convFile = new File(t.getFile().getOriginalFilename());
            convFile.createNewFile();
            FileOutputStream fos = new FileOutputStream(convFile); 
            fos.write(t.getFile().getBytes());
            fos.close();
             Map uploadResult = cloudinary.uploader().upload( convFile , ObjectUtils.emptyMap());
              System.out.println( uploadResult.get("secure_url") );
             t.setProduct_image( ((java.util.Map) uploadResult).get("secure_url").toString() );
            
             System.out.println("*********"+t.getProduct_image());
             pdao.update(t);
        }
    }
    catch( Exception e )
    {
        e.printStackTrace();
    }
	return modelAndView;

}

@RequestMapping("/LinkProducts/{id}")
ModelAndView Products( @PathVariable("id") int id )
{
	ModelAndView modelAndView = new ModelAndView("LinkProducts");

	modelAndView.addObject("Product_list", pdao.getProductWithoutId() );
	   JSONArray  jarr = new JSONArray();
        for( Products i: pdao.getProductWithoutId())
        {
            jarr.put(i.getJSON());
        } 
                
        System.out.println(jarr.toString());
                
        modelAndView.addObject("productData",jarr);
        modelAndView.addObject("catId",id);
        
	return modelAndView;
}
@RequestMapping( value = "/LinkProductsWithCategory", method=RequestMethod.POST)
ModelAndView LinkProductsWithCategory( HttpServletRequest req )
{
	ModelAndView modelAndView = new ModelAndView("redirect:/ShowCategory");
	
	String catId = req.getParameter("catId");
	
	System.out.println("CATID:"+ catId);
	
	String params[] = req.getParameterValues("Products");
	
	for( String s: params )
	{
		System.out.println(s);
	
		Products p = pdao.getProduct(Integer.parseInt(s));
		
		p.setPro_Id(Integer.parseInt(catId));
		
		pdao.update(p);
	}
	
	return modelAndView;
}
@RequestMapping( value = "/ViewProducts/{Category_Id}", method = RequestMethod.GET)
ModelAndView ViewProducts(@PathVariable("Category_Id") int id )
{
	ModelAndView modelAndView = new ModelAndView("ViewProducts");
	
	modelAndView.addObject("catid", id);
	
	List<Products> list1 = pdao.getAllProduct();
	List<Products> list2 = new ArrayList<Products>();
	
	for( Products product : list1 )
	{
		if( product.getPro_Id()==(id))
			list2.add(product);
	}
	
	modelAndView.addObject("itemsincat", list2);
	
	return modelAndView;
}
@RequestMapping("/forCategoryDeleteProductFromDB/{pid}")
ModelAndView DeleteProductsFromDB( @PathVariable("pid") int Product_Id,@RequestParam("catid") int catid )
{
	ModelAndView modelAndView = new ModelAndView("redirect:/ViewProducts/"+catid);
	
	pdao.delete(Product_Id);
	
	return modelAndView;
}

HashSet<String> getMain(List<Category> c1)
{
	HashSet<String> hs = new HashSet<String>();
	
	for(Category c : cdao.getAllCategory())
	{
		hs.add(c.getMain());
	}
	
	return hs;
}

HashSet<String> getSub1(List<Category> c1 , String main)
{
	HashSet<String> hs = new HashSet<String>();
	
	for(Category c : cdao.getAllCategory())
	{
		if( c.getMain().equals(main) )
			hs.add(c.getSub1());
	}
	
	return hs;
}

HashSet<String> getSub2(List<Category> c1 , String main , String sub1)
{
	HashSet<String> hs = new HashSet<String>();
	
	for(Category c : cdao.getAllCategory())
	{
		if( c.getMain().equals(main) && c.getSub1().equals(sub1) )
			hs.add(c.getSub2());
	}
	
	return hs;
}
HashSet<Integer> getPro_Id(List<Category> c1 , String main , String sub1 , String sub2)
{
	HashSet<Integer> hs = new HashSet<Integer>();
	
	for(Category c : cdao.getAllCategory())
	{
		for(Products p : pdao.getAllProduct())
		{
		if( c.getMain().equals(main) && c.getSub1().equals(sub1) && c.getSub2().equals(sub2) )
			hs.add(p.getPro_Id());
		}
	}
	
	return hs;
}

@RequestMapping(value = "/Show", method = RequestMethod.GET)
public ModelAndView get() {
	
	ModelAndView mv = new ModelAndView( "Show" );
	
	List<Category> l = cdao.getAllCategory();
	List<Products> listP = pdao.getAllProduct();	
	HashMap<String, List<Products>> hm = new HashMap<String, List<Products>>();
	
	for( Category c : cdao.getAllCategory() )
	{
		hm.put(c.getCategory_Id()+"", pdao.fetchProductWithCategoryId( c.getCategory_Id() ));
	}
	
	System.out.println("###############################################################################");
	System.out.println(hm);
	System.out.println("###############################################################################");
	
    mv.addObject("catDataMap", hm);
	mv.addObject("AllCategories", l );
	
	

	HashMap<String, Object> HM1 = new HashMap();
	
	for(Category c:l){
		
		if( HM1.get(c.getMain()) == null )
		{
			HashMap x = new HashMap();
			
			List list = new ArrayList();
			
			list.add( c.getSub2() + ";;" + c.getCategory_Id() );
			
			x.put(c.getSub1(), list);
			
			HM1.put(c.getMain(), x);
		}
		else
		{
			HashMap x = (HashMap)HM1.get(c.getMain());
			
			if( x.get( c.getSub1() ) == null )
			{
				List list = new ArrayList();
				
				list.add( c.getSub2() + ";;" + c.getCategory_Id() );
				
				x.put(c.getSub1(), list);
				
				HM1.put(c.getMain(), x);
			}
			else
			{
				List list = (ArrayList) x.get( c.getSub1() ) ;
				
				list.add( c.getSub2() + ";;" + c.getCategory_Id() );
				
				x.put(c.getSub1(), list);
				
				HM1.put(c.getMain(), x);
			}
			
		}
		
	}
	System.out.println("###############################################################################");
	System.out.println(HM1);
	System.out.println("###############################################################################");
	
	mv.addObject("catTree", HM1);
	
	return mv;
}

@RequestMapping("/LoginForm")
ModelAndView LoginForm()
{
	ModelAndView modelAndView = new ModelAndView("LoginForm");
	
	return modelAndView;
}

@RequestMapping("/Navbar")
ModelAndView Navbar()
{
	ModelAndView modelAndView = new ModelAndView("Navbar");
	
	return modelAndView;
}

@RequestMapping("/Head")
ModelAndView Head()
{
	ModelAndView modelAndView = new ModelAndView("Head");
	
	return modelAndView;
}

@RequestMapping(value="/Navbar123", method = RequestMethod.GET)
String Navbar123()
{
	return "Navbar";
}

@RequestMapping("/Home")
ModelAndView Home()
{
	ModelAndView modelAndView = new ModelAndView("Home");
	
	return modelAndView;
}

@RequestMapping(value="/", method=RequestMethod.GET)
ModelAndView nourl()
{
	ModelAndView modelAndView = new ModelAndView("Home");
	
	return modelAndView;
}

@RequestMapping("/index")
ModelAndView index()
{
	ModelAndView modelAndView = new ModelAndView("Home");
	
	return modelAndView;
}

@RequestMapping("/AboutUs")
ModelAndView AboutUs()
{
	ModelAndView modelAndView = new ModelAndView("AboutUs");
	
	return modelAndView;
}

@RequestMapping("/ProductDetails/{pid}")
ModelAndView ProductDetails( @PathVariable("pid") int pid )
{
	ModelAndView modelAndView = new ModelAndView("ProductDetails");
	
	modelAndView.addObject("pid", pid);
	
	return modelAndView;
}

@RequestMapping(value="/AddToCart",method=RequestMethod.POST)
ModelAndView addToCart( @RequestParam("cartQuantity") String cartQuantity,@RequestParam("cartproductid") int Product_Id,HttpServletRequest req )
{
    ModelAndView modelAndView = new ModelAndView("redirect:/cart");
    
    Products i = pdao.getProduct(Product_Id);
    
    Cart c = new Cart();

    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    if (auth != null && !auth.getName().equals("anonymousUser"))
    {   
    	System.out.println( auth.getName() );
    	c.setUserName(auth.getName());
        
    }
    
    c.setProduct_name(i.getProduct_name());
    c.setCartQuantity(cartQuantity);
    c.setProduct_Id(i.getProduct_Id());
    c.setProduct_image(i.getProduct_image());
    c.setProduct_price(i.getProduct_price());
        
    ctdao.insert(c);
    return modelAndView;
}

@RequestMapping( value = "/ProductDetails/{ppid}", method = RequestMethod.GET)
ModelAndView viewitemsincat(@PathVariable("ppid") int id )
{
	ModelAndView modelAndView = new ModelAndView("ProductDetails");
	
	List<Products> list1 = pdao.getAllProduct();
	List<Products> list2 = new ArrayList<Products>();
	
	for( Products product : list1 )
	{
		if( product.getProduct_Id()==(id) )
			list2.add(product);
	}
	
	modelAndView.addObject("itemsinview", list2);
	
	return modelAndView;
}
@RequestMapping(value = "/Show/{arg1}/{arg2}", method = RequestMethod.GET)
public ModelAndView get1( @PathVariable("arg1") String arg , @PathVariable("arg2") String arg2 ) {
	
	ModelAndView mv = new ModelAndView( "Show" );
	
	mv.addObject("arg",arg);
	
	List<Category> l = cdao.getAllCategory();
	List<Products> listP = pdao.getAllProduct();	
	HashMap<String, List<Products>> hm = new HashMap<String, List<Products>>();
	
	for( Category c : cdao.getAllCategory() )
	{
		
			hm.put(c.getCategory_Id()+"", pdao.fetchProductWithCategoryId( c.getCategory_Id() ));
	}
	
	System.out.println("###############################################################################");
	System.out.println(hm);
	System.out.println("###############################################################################");
	
    mv.addObject("catDataMap", hm);
	mv.addObject("AllCategories", l );
	
	

	HashMap<String, Object> HM1 = new HashMap();
	
	for(Category c:l){
		
		if( c.getMain().equals(arg) && c.getSub2().equals(arg2) )
		if( HM1.get(c.getMain()) == null )
		{
			HashMap x = new HashMap();
			
			List list = new ArrayList();
			
			list.add( c.getSub2() + ";;" + c.getCategory_Id() );
			
			x.put(c.getSub1(), list);
			
			HM1.put(c.getMain(), x);
		}
		else
		{
			HashMap x = (HashMap)HM1.get(c.getMain());
			
			if( x.get( c.getSub1() ) == null )
			{
				List list = new ArrayList();
				
				list.add( c.getSub2() + ";;" + c.getCategory_Id() );
				
				x.put(c.getSub1(), list);
				
				HM1.put(c.getMain(), x);
			}
			else
			{
				List list = (ArrayList) x.get( c.getSub1() ) ;
				
				list.add( c.getSub2() + ";;" + c.getCategory_Id() );
				
				x.put(c.getSub1(), list);
				
				HM1.put(c.getMain(), x);
			}
			
		}
		
	}
	System.out.println("###############################################################################");
	System.out.println(HM1);
	System.out.println("###############################################################################");
	
	mv.addObject("catTree", HM1);
	
	return mv;
}

@RequestMapping(value = "/ShowCloth/{arg1}", method = RequestMethod.GET)
public ModelAndView get2( @PathVariable("arg1") String arg) {
	
	ModelAndView mv = new ModelAndView( "ShowCloth" );
	
	mv.addObject("arg",arg);
	
	List<Category> l = cdao.getAllCategory();
	List<Products> listP = pdao.getAllProduct();	
	HashMap<String, List<Products>> hm = new HashMap<String, List<Products>>();
	
	for( Category c : cdao.getAllCategory() )
	{
		
			hm.put(c.getCategory_Id()+"", pdao.fetchProductWithCategoryId( c.getCategory_Id() ));
	}
	
	System.out.println("###############################################################################");
	System.out.println(hm);
	System.out.println("###############################################################################");
	
    mv.addObject("catDataMap", hm);
	mv.addObject("AllCategories", l );
	
	

	HashMap<String, Object> HM1 = new HashMap();
	
	for(Category c:l){
		
		if( c.getMain().equals(arg))
		if( HM1.get(c.getMain()) == null )
		{
			HashMap x = new HashMap();
			
			List list = new ArrayList();
			
			list.add( c.getSub2() + ";;" + c.getCategory_Id() );
			
			x.put(c.getSub1(), list);
			
			HM1.put(c.getMain(), x);
		}
		else
		{
			HashMap x = (HashMap)HM1.get(c.getMain());
			
			if( x.get( c.getSub1() ) == null )
			{
				List list = new ArrayList();
				
				list.add( c.getSub2() + ";;" + c.getCategory_Id() );
				
				x.put(c.getSub1(), list);
				
				HM1.put(c.getMain(), x);
			}
			else
			{
				List list = (ArrayList) x.get( c.getSub1() ) ;
				
				list.add( c.getSub2() + ";;" + c.getCategory_Id() );
				
				x.put(c.getSub1(), list);
				
				HM1.put(c.getMain(), x);
			}
			
		}
		
	}
	System.out.println("###############################################################################");
	System.out.println(HM1);
	System.out.println("###############################################################################");
	
	mv.addObject("catTree", HM1);
	
	return mv;
}

}