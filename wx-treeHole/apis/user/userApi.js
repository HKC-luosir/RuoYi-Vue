import request from "../request";

// 基础url
let bashRequestUrl = "/api/user";


let wxMiniLoginUrl = "/wxMiniLogin";
let updateUrl = "/update";
let generateReferralCodeUrl = "/generateReferralCode";

/**
 * 用户登录
 */
let wxMiniLogin = function (params, onStart, onSuccess, onFailed) {
  request.post(bashRequestUrl + wxMiniLoginUrl, params, onStart, onSuccess, onFailed, onFailed, onFailed);
}
/**
 * 用户信息更新
 */
let update = function (params, onStart, onSuccess, onFailed) {
  request.post(bashRequestUrl + updateUrl, params, onStart, onSuccess, onFailed, onFailed, onFailed);
}

/**
 * 生成用户推荐码
 */
let generateReferralCode = function (params, onStart, onSuccess, onFailed) {
  request.get(bashRequestUrl + generateReferralCodeUrl, params, onStart, onSuccess, onFailed, onFailed, onFailed);
}

module.exports = {
  wxMiniLogin: wxMiniLogin,
  update: update,
  generateReferralCode: generateReferralCode
}