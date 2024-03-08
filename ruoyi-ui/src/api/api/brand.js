import request from '@/utils/request'

// 查询品牌管理列表
export function listBrand(query) {
  return request({
    url: '/api/brand/list',
    method: 'get',
    params: query
  })
}

// 查询品牌管理详细
export function getBrand(id) {
  return request({
    url: '/api/brand/' + id,
    method: 'get'
  })
}

// 新增品牌管理
export function addBrand(data) {
  return request({
    url: '/api/brand',
    method: 'post',
    data: data
  })
}

// 修改品牌管理
export function updateBrand(data) {
  return request({
    url: '/api/brand',
    method: 'put',
    data: data
  })
}

// 删除品牌管理
export function delBrand(id) {
  return request({
    url: '/api/brand/' + id,
    method: 'delete'
  })
}
