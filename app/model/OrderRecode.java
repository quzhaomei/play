package model;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

import play.db.ebean.Model;

@Entity

public class OrderRecode extends Model {
	/**
	 */
	private static final long serialVersionUID = 1L;
	public static final Integer STATUS_READY=0;//服务中
	public static final Integer STATUS_SUCCESS=1;//已结账
	public static final Integer STATUS_FAIL=2;//退单
	
	@Id
	public Integer orderId;
	public String tableCode;
	public String userCode;
	public Integer totalPrice;
	public Date createDate;
	
	public Date priceDate;//买单时间
	public Integer realPrice;//实付金额
	
	public Integer status;//
	
	 @ManyToMany(cascade={CascadeType.PERSIST,CascadeType.PERSIST,CascadeType.MERGE})  
	    @JoinTable(name="order_food",    
	        joinColumns={    
	            @JoinColumn(name="order_id",referencedColumnName="order_id")    
	            },    
	            inverseJoinColumns={    
	             @JoinColumn(name="food_id",referencedColumnName="food_id")    
	       }    
	    )  
	public List<Food> orderFood;
	
	public static Finder<Integer,OrderRecode> find = 
            new Finder<Integer,OrderRecode>(Integer.class, OrderRecode.class);
	
	public static List<OrderRecode> findAll() {
		return find.all();
	}
	
	public static OrderRecode findById (Integer orderId) {
	    return find.where().eq("orderId", orderId).findUnique();
	}
	
	public static OrderRecode  instance(Integer status,String table,
			int total){
		OrderRecode order=new OrderRecode();
		order.createDate=new Date();
    	order.status=status;
    	order.tableCode=table;
    	order.totalPrice=total;
    	order.userCode=UUID.randomUUID().toString();
    	return order;
	}
}
