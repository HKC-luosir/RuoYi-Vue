import request from '@/utils/request'

// 查询文件管理列表
export function listFiles(query) {
  return request({
    url: '/benyi/files/list',
    method: 'get',
    params: query
  })
}

// 查询文件管理列表
export function listFilesByRole(query) {
  return request({
    url: '/benyi/files/listbyrole',
    method: 'get',
    params: query
  })
}

// 查询文件管理详细
export function getFiles(id) {
  return request({
    url: '/benyi/files/' + id,
    method: 'get'
  })
}

// 新增文件管理
export function addFiles(data) {
  return request({
    url: '/benyi/files',
    method: 'post',
    data: data
  })
}

// 修改文件管理
export function updateFiles(data) {
  return request({
    url: '/benyi/files',
    method: 'put',
    data: data
  })
}

// 删除文件管理
export function delFiles(id) {
  return request({
    url: '/benyi/files/' + id,
    method: 'delete'
  })
}
