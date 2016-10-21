package model;

import javax.persistence.Entity;
import javax.persistence.Id;

import play.db.ebean.Model;

@Entity
public class OrderFood extends Model {
	/**
	 */
	private static final long serialVersionUID = 1L;
	@Id
	public Integer id;
	public Integer orderId;
	public Integer foodId;
}
