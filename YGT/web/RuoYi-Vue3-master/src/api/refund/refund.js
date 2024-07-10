import request from '@/utils/request'

// 查询收费列表
export function listRefund(query) {
  return request({
    url: '/refund/refund/list',
    method: 'get',
    params: query
  })
}

// 查询收费详细
export function getRefund(chargeId) {
  return request({
    url: '/refund/refund/' + chargeId,
    method: 'get'
  })
}

// 新增收费
export function addRefund(data) {
  return request({
    url: '/refund/refund',
    method: 'post',
    data: data
  })
}

// 修改收费
export function updateRefund(data) {
  return request({
    url: '/refund/refund',
    method: 'put',
    data: data
  })
}

// 删除收费
export function delRefund(chargeId) {
  return request({
    url: '/refund/refund/' + chargeId,
    method: 'delete'
  })
}
