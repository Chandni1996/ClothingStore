package ClothingStore;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.UriComponentsBuilder;

import ClothingStore.Cart.Cart;
import ClothingStore.Cart.CartDAO;

@org.springframework.web.bind.annotation.RestController

public class RestController {

    @Autowired
    CartDAO cadao;
    @Autowired
    ServletContext context;
    
    @RequestMapping(value="/getAllItemsInCart",method=RequestMethod.POST)
    public ResponseEntity<String> getAllProductsInCart()
    {    
        List<Cart> list = cadao.getAllProductsInCart();
        System.out.println("**********??***********");
        JSONArray jsonArray = new JSONArray();

        String user = "";
        
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && !auth.getName().equals("anonymousUser"))
        {  
        	user = auth.getName();
        }
        for( Cart c : list )
        {
        	 if( c.getUserName() != null && c.getUserName().equals(user) )
             {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("cid", c.getId());
            jsonObject.put("pid", c.getProduct_Id());
            jsonObject.put("pname", c.getProduct_name());
            jsonObject.put("pprice", c.getProduct_price());
            jsonObject.put("pimage", c.getProduct_image());
            jsonObject.put("pQuantity", c.getCartQuantity());
            
            jsonArray.add(jsonObject);
            
        }
        }
        System.out.println("*********************");
        System.out.println( jsonArray.toJSONString() );
        
        return new ResponseEntity<String>(jsonArray.toJSONString(),HttpStatus.OK);
    }
    
    @RequestMapping(value="/removeFromCart",method=RequestMethod.POST)
    public ResponseEntity<String> removeFromCart()
    {    
        System.out.println("removeFromCart");
        
        JSONParser jsonParser = new JSONParser();
        
        JSONObject responseJSON = new JSONObject();
        
     String user = "";
        
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && !auth.getName().equals("anonymousUser"))
        {  
        	user = auth.getName();
        }
        
        try
        {
            
            //JSONObject jsonObject = (JSONObject)jsonParser.parse(data);
            
            for( Cart c : cadao.getAllProductsInCart() )
            {
                if( c.getUserName() != null && c.getUserName().equals(user) )
                {
                	cadao.delete(c.getId());
                }
                
            }
            
            responseJSON.put("message", "deleted");
        }
            catch( Exception e )
        {
            e.printStackTrace();
            responseJSON.put("message", "failed");
        }
        
            
        return new ResponseEntity<String>(responseJSON.toJSONString(),HttpStatus.OK);
    }
    @CrossOrigin
    @RequestMapping(value = "/updateAddresses", method = RequestMethod.POST)
    public ResponseEntity<String> updateAddresses(HttpServletRequest request, HttpServletResponse response, @RequestBody String inputdata, UriComponentsBuilder ucBuilder) 
    {
        JSONParser jpar = new JSONParser();
        
        JSONObject jobj = new JSONObject();
        
        try
        {
            jobj = (JSONObject)jpar.parse(inputdata);
        }
        catch(Exception e)
        {
            System.out.println("ERROR READING ADDRESSES");
        }
        
        System.out.println(jobj.get("adr").toString());
        System.out.println(jobj.get("billingaddress").toString());
        
        List<Cart> list = cadao.getAllProductsInCart();
        
        String user = "";
        
        System.out.println("In Update Addresses");
        
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
           if (auth != null && !auth.getName().equals("anonymousUser"))
           {    
               user = auth.getName();
           }
        
           System.out.println(list);
           
           for( Cart item:list )
           {
            
               System.out.println(user);
               System.out.println(item.getProduct_name());
               
               try
               {
                   System.out.println( item.getUserName().equals(user) );
                   
                   if( item.getUserName().equals(user) )
                   {
                       
                       item.setBillingaddress(jobj.get("billingaddress").toString());
                       
                       cadao.update(item);
                   }
               }
               catch( Exception e )
               {
                   e.printStackTrace();
               }
               
            
           }
         
           JSONObject res = new JSONObject();
           
           res.put("status", "updated");
           
        return new ResponseEntity<String>(res.toJSONString(), HttpStatus.CREATED);
    }
    
    //***************************************************************************************************
    
}