import request from '@/utils/request'

// 查询定时任务调度列表
export function list(query) {
  return request({
    url: '/monitor/teemlink/list',
    method: 'get',
    params: query
  })
}

// 查询定时任务调度详细
export function get(tableName, columnName) {
  const data = {
    tableName,
    columnName
  }
  return request({
    url: '/monitor/teemlink/stat',
    method: 'get',
    params: data
  })
}

// 新增定时任务调度
export function addJob(data) {
  return request({
    url: '/monitor/job',
    method: 'post',
    data: data
  })
}

// 修改定时任务调度
export function updateJob(data) {
  return request({
    url: '/monitor/job',
    method: 'put',
    data: data
  })
}

// 删除定时任务调度
export function delJob(jobId) {
  return request({
    url: '/monitor/teemlink/' + jobId,
    method: 'delete'
  })
}

// 导出定时任务调度
export function exportJob(query) {
  return request({
    url: '/monitor/teemlink/export',
    method: 'get',
    params: query
  })
}

// 任务状态修改
export function changeJobStatus(jobId, status) {
  const data = {
    jobId,
    status
  }
  return request({
    url: '/monitor/teemlink/changeStatus',
    method: 'put',
    data: data
  })
}


// 定时任务立即执行一次
export function runJob(jobId, jobGroup) {
  const data = {
    jobId,
    jobGroup
  }
  return request({
    url: '/monitor/teemlink/run',
    method: 'put',
    data: data
  })
}
