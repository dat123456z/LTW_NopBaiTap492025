package vn.instar.services.impl;

import java.util.List;

import vn.instar.dao.CategoryDao;
import vn.instar.dao.impl.CategoryDaoImpl;
import vn.instar.entity.Category;
import vn.instar.services.CategoryService;

public class CategoryServiceImpl implements CategoryService {
	CategoryDao cateDao = new CategoryDaoImpl();
	@Override
	public List<Category> findAll() {
		// TODO Auto-generated method stub
		return cateDao.findAll();
	}



	@Override
	public void create(Category category) {
		cateDao.create(category);
	}

	@Override
	public void update(Category category) {
		cateDao.update(category);
	}

	@Override
	public void delete(int id) {
		cateDao.delete(id);
	}

	@Override
	public Category findById(int id) {
		return cateDao.findById(id);
	}
}
