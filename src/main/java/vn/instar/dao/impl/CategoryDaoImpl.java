package vn.instar.dao.impl;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;
import vn.instar.configs.JPAConfig;
import vn.instar.dao.CategoryDao;
import vn.instar.entity.Category;

public class CategoryDaoImpl implements CategoryDao {

    @Override
    public List<Category> findAll() {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            // Truy vấn trực tiếp, tránh phụ thuộc NamedQuery chưa khai báo
            TypedQuery<Category> q = em.createQuery(
                "SELECT c FROM Category c ORDER BY c.id", Category.class);
            return q.getResultList();
        } finally {
            em.close(); // luôn đóng
        }
    }

    @Override
    public void create(Category category) {
        EntityManager em = JPAConfig.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(category);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    @Override
    public void update(Category category) {
        EntityManager em = JPAConfig.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.merge(category);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    @Override
    public void delete(int cateid) {
        EntityManager em = JPAConfig.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Category category = em.find(Category.class, cateid);
            if (category != null) {
                em.remove(category);
            } else {
                // nếu muốn báo lỗi rõ ràng:
                 throw new IllegalArgumentException("Không tìm thấy Category id=" + cateid);
            }
            tx.commit(); // 🔴 BẮT BUỘC: thiếu dòng này sẽ không xóa được
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    @Override
    public Category findById(int id) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            return em.find(Category.class, id);
        } finally {
            em.close();
        }
    }
}
