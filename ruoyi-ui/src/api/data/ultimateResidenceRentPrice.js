import request from '@/utils/request'

// 查询最终住宅租赁基价列表
export function list(query) {
  return request({
    url: '/data/rentprice/residence/ultimate/list',
    method: 'get',
    params: query
  })
}

// 查询最终住宅租赁基价详细
export function get(id) {
  return request({
    url: '/data/rentprice/residence/ultimate/' + id,
    method: 'get'
  })
}

// 修改最终住宅租赁基价
export function update(data) {
  return request({
    url: '/data/rentprice/residence/ultimate',
    method: 'put',
    data: data
  })
}

// 导出最终住宅租赁基价
export function export2File(query) {
  return request({
    url: '/data/rentprice/residence/ultimate/export',
    method: 'get',
    params: query
  })
}
