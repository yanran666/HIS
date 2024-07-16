import request from '@/utils/request'

// 查询收费列表
export function listFeeRecords(query) {
  return request({
    url: '/feeRecords/feeRecords/list',
    method: 'get',
    params: query
  })
}

// 查询收费详细
export function getFeeRecords(chargeId) {
  return request({
    url: '/feeRecords/feeRecords/' + chargeId,
    method: 'get'
  })
}

// 新增收费
export function addFeeRecords(data) {
  return request({
    url: '/feeRecords/feeRecords',
    method: 'post',
    data: data
  })
}

// 修改收费
export function updateFeeRecords(data) {
  return request({
    url: '/feeRecords/feeRecords',
    method: 'put',
    data: data
  })
}

// 删除收费
export function delFeeRecords(chargeId) {
  return request({
    url: '/feeRecords/feeRecords/' + chargeId,
    method: 'delete'
  })
}
