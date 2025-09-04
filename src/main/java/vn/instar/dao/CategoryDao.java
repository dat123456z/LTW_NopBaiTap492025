package vn.instar.dao;

import java.util.List;

import vn.instar.entity.Category;

public interface CategoryDao {
	List<Category> findAll();
	void create(Category category);
	void update(Category category);
	void delete(int id);
	Category findById(int id);
	
}
