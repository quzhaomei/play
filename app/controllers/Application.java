package controllers;



import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.fasterxml.jackson.databind.JsonNode;

import model.Food;
import model.OrderRecode;
import other.JsonMsg;
import play.db.ebean.Transactional;
import play.libs.Json;
import play.mvc.Controller;
import play.mvc.Result;
@Transactional
public class Application extends Controller {
    public static Result foods() {
    	List<Food> foods=Food.findAll();
        return ok(Json.toJson(foods));
    }
    private static Food getFood(List<Food> all,Integer foodId){
    	for(int index=0;index<all.size();index++){
    		Food temp=all.get(index);
    		if(temp.foodId.equals(foodId)){
    			return temp;
    		}
    	}
    	return null;
    }
    
    public static Result order() {
    	JsonNode json= request().body().asJson();
    	String table =json.get("table").asText();
    	List<JsonNode> JsonNode=json.findValues("foodIds");
    	Iterator<JsonNode> temp=JsonNode.get(0).iterator();
    	List<Food> foods=new ArrayList<Food>();
    	List<Food> allFoods=Food.findAll();
    	Integer total=0;
    	while (temp.hasNext()) {
    		Food now=getFood(allFoods,temp.next().asInt());
    		total+=now.price;
			foods.add(now);
		}
    	
    	OrderRecode order=OrderRecode.instance(OrderRecode.STATUS_READY, table, total);
    	order.orderFood=foods;
    	order.save();
    	
        return ok(Json.toJson(new JsonMsg(1,"点菜成功",order.orderId)));
    }
    
    public static Result orders() {
    	List<OrderRecode> orders=OrderRecode.findAll();
        return ok(Json.toJson(orders));
    }
    
    public static Result perOrder(Integer id) {
    	OrderRecode order=OrderRecode.findById(id);
        return ok(Json.toJson(order));
    }
    
}
