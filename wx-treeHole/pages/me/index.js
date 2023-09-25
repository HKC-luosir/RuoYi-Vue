const app = getApp();
import storage from "../../utils/storage";
import storageConstant from "../../constans/storageConstant";
import globalConstant from "../../constans/globalConstant";
import userApi from "../../apis/user/userApi";
import userLevelApi from "../../apis/user/userLevelApi";
import staffApi from "../../apis/staff/staffApi";
Page({

  /**
   * 页面的初始数据
   */
  data: {
    pWidth: 0, //获取手机宽度
    pHeight: 0, //获取手机高度
    stateBarHeight: "20px", //状态栏高度
    barHeight: "44.8px", //状态栏标题高度
    showStateBarHeight: 0, //展示状态栏高度
    barThemeColor: null, // 状态栏主题颜色
    themecolor: "#555d8c", //主题颜色
    refreshState: false, //下拉刷新状态
    userInfo: app.globalData.userInfo,
    userLevelConfig: app.globalData.userLevelConfig,
    userLevelData: null,
    userLikeStaffUserIdList: app.globalData.userLikeStaffUserIdList,
    userLikeStaffTrendsIdList: app.globalData.userLikeStaffTrendsIdList,

  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(options) {
    let that = this;
    wx.createSelectorQuery().selectAll('.bView').boundingClientRect(function (rect) {
      that.setData({
        pWidth: rect[0].width,
        pHeight: rect[0].height
      })
    }).exec();
    this.setData({
      stateBarHeight: storage.get(storageConstant.stateBarHeight, null),
      barHeight: globalConstant.titleBarHeight,
      showStateBarHeight: (Number(storage.get(storageConstant.stateBarHeight, null)) + Number(globalConstant.titleBarHeight)) - 10
    })
    this.loadUserInfo();
  }, 
  onShow: function () {
    // 加载用户信息
    this.setData({
      userInfo: app.globalData.userInfo,
      userLevelConfig: app.globalData.userLevelConfig
    })
    // 处理用户等级数据
    this.handleUserLevelData();
    // 请求用户关联数据
    if(this.data.userInfo != null){
      let userId = this.data.userInfo.id;
      // 加载点赞收藏数据
      userApi.selectUserLikeData({userId: userId}, null, this.selectUserLikeDataOnSuccess, null);
      // 加载员工信息
      staffApi.selectByUserId({userId: userId}, null, this.selectStaffInfoOnSuccess, null);
    }
  },
  /**
   * 用户点击右上角分享
   */
  onShareAppMessage() {

  },
  /**
   * 请求员工信息数据完成
   */
  selectStaffInfoOnSuccess:function(res){
    if(res.data.id != null){
      console.log("存在员工信息：", res);
    }
  },
  /**
   * 请求用户点赞收藏数据成功
   */
  selectUserLikeDataOnSuccess:function(res){
    app.globalData.userLikeStaffUserIdList = res.data.likeStaffUserIdList;
    app.globalData.userLikeStaffTrendsIdList = res.data.likeStaffTrendsIdList;
    this.setData({
      userLikeStaffUserIdList: res.data.likeStaffUserIdList,
      userLikeStaffTrendsIdList: res.data.likeStaffTrendsIdList
    })
  },
  /**
   * 登录事件
   */
  login:function(){
    let that = this;
    wx.showLoading({
      title: '正在登录',
      mask: true
    })
    // 用户自动登录
    wx.login({
      complete: (res) => {
        if (res.errMsg == "login:ok") {
          userApi.wxMiniLogin({ "code": res.code }, null, that.loginOnSuccess, that.loginOnFailed);
        }else{
          wx.hideLoading();
          wx.showToast({
            title: '登录失败',
            icon: "error"
          })
        }
      }
    })
  },
  loginOnSuccess:function(res){
    app.loginOnSuccess(res);
    this.setData({
      userInfo: res.data
    })
    wx.hideLoading();
    // 加载用户等级配置
    this.loadUserLevelConfig();
  },
  loginOnFailed:function(res){
    wx.hideLoading();
    wx.showToast({
      title: '登录失败',
      icon: "error"
    })
  },
  /**
   * 加载app.js中存放的用户信息
   */
  loadUserInfo: function () {
    let that = this;
    let i = 0;
    let loadUserInfoTimer = setInterval(function () {
      if (i > 20) {
        clearInterval(loadUserInfoTimer);
      }
      let userInfo = app.globalData.userInfo;
      if (userInfo != null) {
        that.setData({
          userInfo: userInfo
        })
        clearInterval(loadUserInfoTimer);
        // 处理用户等级数据
        that.handleUserLevelData();
      }
      i++;
    }, 1000)
  },
  /**
   * 加载用户等级配置
   */
  loadUserLevelConfig:function(){
    // 判断当前的数据是否为空
    let userLevelConfig = app.globalData.userLevelConfig;
    if(userLevelConfig != null){
      this.setData({
        userLevelConfig: userLevelConfig
      })
      return;
    }
    // 请求服务器加载
    userLevelApi.selectUserLevelConfig(this.loadUserLevelConfigOnStart,this.loadUserLevelConfigOnSuccess,this.loadUserLevelConfigOnFailed);
  },
  loadUserLevelConfigOnStart:function(){
    wx.showLoading({
      title: '加载等级中',
      mask: true
    })
  },
  loadUserLevelConfigOnSuccess:function(res){
    wx.hideLoading();
    app.getUserLevelConfigOnSuccess(res);
    this.setData({
      userLevelConfig: res.data
    })
    // 处理用户等级数据
    this.handleUserLevelData();
  },
  loadUserLevelConfigOnFailed:function(res){
    wx.hideLoading();
    wx.showToast({
      title: '加载用户等级配置失败',
      icon: "none"
    })
  },
  /**
   * 处理用户等级相关数据
   */
  handleUserLevelData:function(){
    let userInfo = this.data.userInfo;
    if(userInfo == null){
      return;
    }
    let userLevelConfig = this.data.userLevelConfig;
    if(userLevelConfig == null){
      return;
    }
    let userLevelVo = userInfo.userLevelVo;
    let currentLevel,nextLevel = null;
    for(let i = 0; i < userLevelConfig.length; i++){
      let temp = userLevelConfig[i];
      if(temp.id == userLevelVo.levelConfigId){
        currentLevel = temp;
        if(i != userLevelConfig.length-1){
          nextLevel = userLevelConfig[i+1];
        }else{
          nextLevel = temp;
        }
      }
    }
    if(currentLevel == null || nextLevel == null){
      return;
    }
    let userLevelData = {
      currLevel: userLevelVo.currentLevel,
      nextLevel: nextLevel.level,
      nextThreshold: nextLevel.threshold,
      upgradationThreshold: Number(nextLevel.threshold)-Number(userLevelVo.totalPoints),
      upgradationPercent: (Number(userLevelVo.totalPoints)/Number(nextLevel.threshold)*100)
    };
    this.setData({
      userLevelData: userLevelData
    })
  },
  /**
   * 前往用户资料页面
   */
  toUserData: function () {
    wx.navigateTo({
      url: '../../userPackages/page/userData/index',
    })
  },
  /**
   * 前往用户账号管理页面
   */
  toUserAccount:function(){
    if(this.data.userInfo == null){
      wx.showToast({
        title: '亲爱的，先登录哟',
        icon: "none"
      })
      return;
    }
    wx.navigateTo({
      url: '../../userPackages/page/accounts/index',
    })
  },
  /**
   * 前往申请员工页面
   */
  toApplyStaff:function(){
    if(this.data.userInfo == null){
      wx.showToast({
        title: '亲爱的，先登录哟',
        icon: "none"
      })
      return;
    }
    wx.navigateTo({
      url: '../../staffPackages/page/applyStaff/index',
    })
  }
})