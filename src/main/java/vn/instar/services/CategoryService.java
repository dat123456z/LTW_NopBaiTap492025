package vn.instar.services;

import java.util.List;

import vn.instar.entity.Category;

public interface CategoryService {
	List<Category> findAll();
	void create(Category category);
	void update(Category category);
	void delete(int id);
	Category findById(int id);
}
