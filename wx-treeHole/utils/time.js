function getWeekDataList() {
  //根据日期获取本周周一~周日的年-月-日
  var weekList = [];
  var date = new Date();
  //判断本日期是否为周日，获取本周一日期
  if (date.getDay() == "0") {
    date.setDate(date.getDate() - 6);
  } else {
    date.setDate(date.getDate() - date.getDay() + 1);
  }
  var myDate = date.getDate();
  var myMonth = date.getMonth() + 1;
  if (date.getDate() < 10) {
    myDate = '0' + myDate;
  }
  if (date.getMonth() + 1 < 10) {
    myMonth = '0' + myMonth;
  }
  weekList.push(date.getFullYear() + "-" + myMonth + "-" + myDate);
  // 获取周二以后日期
  for (var i = 0; i < 6; i++) {
    date.setDate(date.getDate() + 1);
    myDate = date.getDate();
    myMonth = date.getMonth() + 1;
    if (date.getDate() < 10) {
      myDate = '0' + myDate;
    }
    if (date.getMonth() + 1 < 10) {
      myMonth = '0' + myMonth;
    }
    weekList.push(date.getFullYear() + "-" + myMonth + "-" + myDate);
  }
  return weekList
}

module.exports = {
  getWeekDataList: getWeekDataList
}