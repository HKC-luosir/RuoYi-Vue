package com.ruoyi.stu.service;

import com.ruoyi.stu.vo.BiyeForm;
import com.ruoyi.stu.vo.DataVO;
import com.ruoyi.stu.vo.StuInfoMaterial;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 提交材料参数Service接口
 * 
 * @author ruoyi
 * @date 2023-05-19
 */
public interface IStuInfoMaterialService {




    /**
     * 查询提交材料参数列表
     *
     * @param stuInfoMaterial 毕业实践
     * @return 提交材料参数集合
     */
    Map<String,List<StuInfoMaterial>> selectStuMaterialList(BiyeForm stuInfoMaterial);

    /**
     * 新增提交材料参数
     *
     * @param stuInfoMaterial 毕业实践
     * @return 结果
     */
    int insertStuMaterial(StuInfoMaterial stuInfoMaterial);

    /**
     * 修改提交材料参数
     *
     * @param biyeForm 毕业实践
     * @return 结果
     */
    int updateStuMaterial(BiyeForm biyeForm);

    /**
     * 删除提交材料参数
     *
     * @param id 提交材料参数主键
     * @return 结果
     */
    int deleteStuInfoMaterialById(Integer id);

    /**
     * 批量删除提交材料参数
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    int deleteStuInfoMaterialByIds(Long[] ids);

    StuInfoMaterial selectStuInfMaterialoById(Long id);

    void updateImgUrl(BiyeForm form);

    int batchAddBiye(Long stuId);

    int selectIsCreatedMaterialId(Long userId);
    /**
     * 通过年级以及材料id查询各种材料的提交情况
     */
    int selectStuFinishedMaterials(String clsYear,String clsYear2);
    /**
     * 数据展示上半部分,展示毕业学生总数,届别,总体需要提交材料以及已经提交材料
     */
    DataVO showTopData(String clsYear);
}
