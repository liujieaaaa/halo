package cc.ryanc.halo.service;

import cc.ryanc.halo.model.domain.Category;

import java.util.List;

/**
 * @author : RYAN0UP
 * @date : 2017/11/30
 * @version : 1.0
 * description :
 */
public interface CategoryService {
    /**
     * 新增分类目录
     * @param category 分类目录
     * @return 如果插入成功，返回分类目录对象
     */
    Category saveByCategory(Category category);

    /**
     * 根据编号删除分类目录
     * @param cateId 分类目录编号
     * @return category
     */
    Category removeByCateId(Integer cateId);

    /**
     * 修改分类目录信息
     * @param category 分类目录对象
     * @return 如果修改成功 返回当前分类目录对象
     */
    Category updateByCategory(Category category);

    /**
     * 获取所有分类目录
     * @return 返回List集合
     */
    List<Category> findAllCategories();

    /**
     * 根据编号查询单个分类
     * @param cateId 分类编号
     * @return 返回category实体
     */
    Category findByCateId(Integer cateId);

    /**
     * 根据分类目录路径查询，用于验证是否已经存在该路径
     * @param cateUrl cateUrl
     * @return category
     */
    Category findByCateUrl(String cateUrl);

    List<Category> strListToCateList(List<String> strings);
}
