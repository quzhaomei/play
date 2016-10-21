package model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;

import controllers.Application;
import play.cache.Cache;
import play.db.ebean.Model;

@Entity
public class Food extends Model {
	/**
	 */
	private static final long serialVersionUID = 1L;
	@Id
	public Integer foodId;
	public String name;
	public Integer price;
	public Food() {
		super();
	}
	public static Finder<Integer,Food> find = 
            new Finder<Integer,Food>(Integer.class, Food.class);
	
	public static List<Food> findAll() {
		@SuppressWarnings("unchecked")
		List<Food> foods=(List<Food>) Cache.get("allfoods");
    	if(foods==null){
    		synchronized (Application.class) {
    			foods=find.all();
    			Cache.set("allfoods", foods);
			}
    	}
		return foods;
	}
	    
	public static Food findById (Integer foodId) {
	    return find.where().eq("foodId", foodId).findUnique();
	}
	
	@Override
	public void save(){
		super.save();
		Cache.remove("allfoods");
	}
	
	@Override
	public void update(){
		this.update();
		Cache.remove("allfoods");
	}
	
	@Override
	public void delete(){
		this.delete();
		Cache.remove("allfoods");
	}
}
