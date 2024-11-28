package com.yash.ohd.dao;

import com.yash.ohd.domain.Product;
import com.yash.ohd.rm.ProductRowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ProductDAOImpl extends BaseDAO implements ProductDAO {

    @Override
    public void save(Product product) {
        String sql = "INSERT INTO product(name, description, price, stock, vendor_id, imagePath) " +
                "VALUES(:name, :description, :price, :stock, :vendorId, :imagePath)";
        Map<String, Object> params = new HashMap<>();
        params.put("imagePath", product.getImagePath());
        params.put("name", product.getName());
        params.put("description", product.getDescription());
        params.put("price", product.getPrice());
        params.put("stock", product.getStock());
        params.put("vendorId", product.getVendorId());

        KeyHolder kh = new GeneratedKeyHolder();
        SqlParameterSource ps = new MapSqlParameterSource(params);
        super.getNamedParameterJdbcTemplate().update(sql, ps, kh);
        Integer productId = kh.getKey().intValue();
        product.setProductId(productId);
    }

    @Override
    public void update(Product product) {
        String sql = "UPDATE product SET name=:name, description=:description, price=:price, stock=:stock, " +
                "vendor_id=:vendorId, imagePath=:imagePath WHERE productId=:productId";
        Map<String, Object> params = new HashMap<>();
        params.put("imagePath", product.getImagePath());
        params.put("name", product.getName());
        params.put("description", product.getDescription());
        params.put("price", product.getPrice());
        params.put("stock", product.getStock());
        params.put("vendorId", product.getVendorId());
        params.put("productId", product.getProductId());

        getNamedParameterJdbcTemplate().update(sql, params);
    }

    @Override
    public Product findById(Integer productId) {
        String sql = "SELECT productId, name, description, price, stock, vendor_id,imagePath FROM product WHERE productId=?";
        return getJdbcTemplate().queryForObject(sql, new ProductRowMapper(), productId);
    }

    @Override
    public List<Product> findAll() {
        String sql = "SELECT productId, name, description, price, stock, vendor_id,imagePath FROM product";
        return getJdbcTemplate().query(sql, new ProductRowMapper());
    }
    @Override
    public void delete(Integer productId) {
        String sql = "DELETE FROM product WHERE productId=?";
        getJdbcTemplate().update(sql, productId);
    }
}