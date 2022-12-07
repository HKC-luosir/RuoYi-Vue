package com.ruoyi.student.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 学生信息对象 stu_info
 *
 * @author wangzq
 * @date 2022-11-23
 */
public class StuInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Long id;

    /** 学号 */
    @Excel(name = "学号", sort = 0)
    private String studentId;

    /** 姓名 */
    @Excel(name = "姓名", sort = 0)
    private String studentName;

    /** 性别 */
    private String studentSex;
    @Excel(name = "性别")
    private String studentSexName;

    /** 联系方式 */
    @Excel(name = "联系方式")
    private String studentPhone;

    /** 身份证号 */
    @Excel(name = "身份证号")
    private String idNum;

    /** 学院编号 */
    private Long deptId;

    /** 学院名称 */
    @Excel(name = "学院名称", sort = 1)
    private String deptName;

    /** 培养层次 */
    private String trainingLevel;
    @Excel(name = "培养层次")
    private String trainingLevelName;

    /** 年级 */
    @Excel(name = "年级")
    private String grade;

    /** 住址 */
    @Excel(name = "住址")
    private String address;

    /** 民族 */
    private String nation;
    @Excel(name = "民族")
    private String nationName;

    /** 校区 */
    private String campus;
    @Excel(name = "校区")
    private String campusName;

    /** 学生标签:0在校 1当日离校 2未在校 3当日返校 */
    private String studentTag;
    @Excel(name = "学生标签")
    private String studentTagName;

    /** 住宿地点 */
    private String accommodation;
    @Excel(name = "住宿地点")
    private String accommodationName;

    /** 住宿园区 */
    private String accommodationPark;
    @Excel(name = "住宿园区")
    private String accommodationParkName;

    /** 宿舍号 */
    @Excel(name = "宿舍号")
    private String dormitoryNo;

    /** 是否校内住宿:把在校学生分为校内住宿和其他 */
    private String isOnSchool;
    @Excel(name = "是否校内住宿")
    private String isOnSchoolName;

    /** 管控等级:0无管控，1校内居家监测,2校内居家隔离,3校外集中隔离 */
    private String controlLevel;
    @Excel(name = "管控等级")
    private String controlLevelName;

    /** 未返校原因:0因疫暂缓,1因就业实习暂缓,2因其他暂缓返 */
    private String notSchoolReason;
    @Excel(name = "未返校原因")
    private String notSchoolReasonName;

    /** 返校出发地风险等级:0低风险，1高风险 */
    private String placeToSchoolLevel;
    @Excel(name = "返校出发地风险等级")
    private String placeToSchoolLevelName;

    /** 返校出发地:0省内1省外 */
    private String placeToSchool;
    @Excel(name = "返校出发地")
    private String placeToSchoolName;


    /** 离校目的地:0市内 1省内市外 2省外 */
    private String placeToLeave;
    @Excel(name = "离校目的地")
    private String placeToLeaveName;

    /** 密接类型 */
    private String jointType;
    @Excel(name = "密接类型")
    private String jointTypeName;

    public String getStudentSexName() {
        return studentSexName;
    }

    public void setStudentSexName(String studentSexName) {
        this.studentSexName = studentSexName;
    }

    public String getStudentSex() {
        return studentSex;
    }

    public void setStudentSex(String studentSex) {
        this.studentSex = studentSex;
    }

    public String getStudentPhone() {
        return studentPhone;
    }

    public void setStudentPhone(String studentPhone) {
        this.studentPhone = studentPhone;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setStudentId(String studentId)
    {
        this.studentId = studentId;
    }

    public String getStudentId()
    {
        return studentId;
    }
    public void setStudentName(String studentName)
    {
        this.studentName = studentName;
    }

    public String getStudentName()
    {
        return studentName;
    }
    public void setIdNum(String idNum)
    {
        this.idNum = idNum;
    }

    public String getIdNum()
    {
        return idNum;
    }
    public void setDeptId(Long deptId)
    {
        this.deptId = deptId;
    }

    public Long getDeptId()
    {
        return deptId;
    }
    public void setDeptName(String deptName)
    {
        this.deptName = deptName;
    }

    public String getDeptName()
    {
        return deptName;
    }
    public void setTrainingLevel(String trainingLevel)
    {
        this.trainingLevel = trainingLevel;
    }

    public String getTrainingLevel()
    {
        return trainingLevel;
    }
    public void setGrade(String grade)
    {
        this.grade = grade;
    }

    public String getGrade()
    {
        return grade;
    }
    public void setAddress(String address)
    {
        this.address = address;
    }

    public String getAddress()
    {
        return address;
    }
    public void setNation(String nation)
    {
        this.nation = nation;
    }

    public String getNation()
    {
        return nation;
    }
    public void setCampus(String campus)
    {
        this.campus = campus;
    }

    public String getCampus()
    {
        return campus;
    }
    public void setStudentTag(String studentTag)
    {
        this.studentTag = studentTag;
    }

    public String getStudentTag()
    {
        return studentTag;
    }
    public void setAccommodation(String accommodation)
    {
        this.accommodation = accommodation;
    }

    public String getAccommodation()
    {
        return accommodation;
    }
    public void setAccommodationPark(String accommodationPark)
    {
        this.accommodationPark = accommodationPark;
    }

    public String getAccommodationPark()
    {
        return accommodationPark;
    }
    public void setDormitoryNo(String dormitoryNo)
    {
        this.dormitoryNo = dormitoryNo;
    }

    public String getDormitoryNo()
    {
        return dormitoryNo;
    }
    public void setIsOnSchool(String isOnSchool)
    {
        this.isOnSchool = isOnSchool;
    }

    public String getIsOnSchool()
    {
        return isOnSchool;
    }
    public void setControlLevel(String controlLevel)
    {
        this.controlLevel = controlLevel;
    }

    public String getControlLevel()
    {
        return controlLevel;
    }
    public void setNotSchoolReason(String notSchoolReason)
    {
        this.notSchoolReason = notSchoolReason;
    }

    public String getNotSchoolReason()
    {
        return notSchoolReason;
    }
    public void setPlaceToSchoolLevel(String placeToSchoolLevel)
    {
        this.placeToSchoolLevel = placeToSchoolLevel;
    }

    public String getPlaceToSchoolLevel()
    {
        return placeToSchoolLevel;
    }
    public void setPlaceToSchool(String placeToSchool)
    {
        this.placeToSchool = placeToSchool;
    }

    public String getPlaceToSchool()
    {
        return placeToSchool;
    }
    public void setPlaceToLeave(String placeToLeave)
    {
        this.placeToLeave = placeToLeave;
    }

    public String getPlaceToLeave()
    {
        return placeToLeave;
    }
    public void setJointType(String jointType)
    {
        this.jointType = jointType;
    }

    public String getJointType()
    {
        return jointType;
    }

    public String getTrainingLevelName() {
        return trainingLevelName;
    }

    public void setTrainingLevelName(String trainingLevelName) {
        this.trainingLevelName = trainingLevelName;
    }

    public String getNationName() {
        return nationName;
    }

    public void setNationName(String nationName) {
        this.nationName = nationName;
    }

    public String getCampusName() {
        return campusName;
    }

    public void setCampusName(String campusName) {
        this.campusName = campusName;
    }

    public String getStudentTagName() {
        return studentTagName;
    }

    public void setStudentTagName(String studentTagName) {
        this.studentTagName = studentTagName;
    }

    public String getAccommodationName() {
        return accommodationName;
    }

    public void setAccommodationName(String accommodationName) {
        this.accommodationName = accommodationName;
    }

    public String getAccommodationParkName() {
        return accommodationParkName;
    }

    public void setAccommodationParkName(String accommodationParkName) {
        this.accommodationParkName = accommodationParkName;
    }

    public String getIsOnSchoolName() {
        return isOnSchoolName;
    }

    public void setIsOnSchoolName(String isOnSchoolName) {
        this.isOnSchoolName = isOnSchoolName;
    }

    public String getControlLevelName() {
        return controlLevelName;
    }

    public void setControlLevelName(String controlLevelName) {
        this.controlLevelName = controlLevelName;
    }

    public String getNotSchoolReasonName() {
        return notSchoolReasonName;
    }

    public void setNotSchoolReasonName(String notSchoolReasonName) {
        this.notSchoolReasonName = notSchoolReasonName;
    }

    public String getPlaceToSchoolLevelName() {
        return placeToSchoolLevelName;
    }

    public void setPlaceToSchoolLevelName(String placeToSchoolLevelName) {
        this.placeToSchoolLevelName = placeToSchoolLevelName;
    }

    public String getPlaceToSchoolName() {
        return placeToSchoolName;
    }

    public void setPlaceToSchoolName(String placeToSchoolName) {
        this.placeToSchoolName = placeToSchoolName;
    }

    public String getPlaceToLeaveName() {
        return placeToLeaveName;
    }

    public void setPlaceToLeaveName(String placeToLeaveName) {
        this.placeToLeaveName = placeToLeaveName;
    }

    public String getJointTypeName() {
        return jointTypeName;
    }

    public void setJointTypeName(String jointTypeName) {
        this.jointTypeName = jointTypeName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("studentId", getStudentId())
                .append("studentName", getStudentName())
                .append("idNum", getIdNum())
                .append("deptId", getDeptId())
                .append("deptName", getDeptName())
                .append("trainingLevel", getTrainingLevel())
                .append("grade", getGrade())
                .append("address", getAddress())
                .append("nation", getNation())
                .append("campus", getCampus())
                .append("studentTag", getStudentTag())
                .append("accommodation", getAccommodation())
                .append("accommodationPark", getAccommodationPark())
                .append("dormitoryNo", getDormitoryNo())
                .append("isOnSchool", getIsOnSchool())
                .append("controlLevel", getControlLevel())
                .append("notSchoolReason", getNotSchoolReason())
                .append("placeToSchoolLevel", getPlaceToSchoolLevel())
                .append("placeToSchool", getPlaceToSchool())
                .append("placeToLeave", getPlaceToLeave())
                .append("jointType", getJointType())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}
