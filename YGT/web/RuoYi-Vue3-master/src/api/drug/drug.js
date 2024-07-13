import request from '@/utils/request'

// 查询药品列表
export function listDrug(query) {
  return request({
    url: '/drug/drug/list',
    method: 'get',
    params: query
  })
}

// 查询药品详细
export function getDrug(drugId) {
  return request({
    url: '/drug/drug/' + drugId,
    method: 'get'
  })
}

// 新增药品
export function addDrug(data) {
  return request({
    url: '/drug/drug',
    method: 'post',
    data: data
  })
}

// 修改药品
export function updateDrug(data) {
  return request({
    url: '/drug/drug',
    method: 'put',
    data: data
  })
}

// 删除药品
export function delDrug(drugId) {
  return request({
    url: '/drug/drug/' + drugId,
    method: 'delete'
  })
}
