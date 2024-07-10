import request from '@/utils/request'

// 查询收费列表
export function listCharges(query) {
  return request({
    url: '/charges/charges/list',
    method: 'get',
    params: query
  })
}

// 查询收费详细
export function getCharges(chargeId) {
  return request({
    url: '/charges/charges/' + chargeId,
    method: 'get'
  })
}

// 新增收费
export function addCharges(data) {
  return request({
    url: '/charges/charges',
    method: 'post',
    data: data
  })
}

// 修改收费
export function updateCharges(data) {
  return request({
    url: '/charges/charges',
    method: 'put',
    data: data
  })
}

// 删除收费
export function delCharges(chargeId) {
  return request({
    url: '/charges/charges/' + chargeId,
    method: 'delete'
  })
}
