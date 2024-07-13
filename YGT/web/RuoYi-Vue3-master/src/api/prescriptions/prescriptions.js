import request from '@/utils/request'

// 查询处方列表
export function listPrescriptions(query) {
  return request({
    url: '/prescriptions/prescriptions/list',
    method: 'get',
    params: query
  })
}

// 查询处方详细
export function getPrescriptions(prescriptionId) {
  return request({
    url: '/prescriptions/prescriptions/' + prescriptionId,
    method: 'get'
  })
}

// 新增处方
export function addPrescriptions(data) {
  return request({
    url: '/prescriptions/prescriptions',
    method: 'post',
    data: data
  })
}

// 修改处方
export function updatePrescriptions(data) {
  return request({
    url: '/prescriptions/prescriptions',
    method: 'put',
    data: data
  })
}

// 删除处方
export function delPrescriptions(prescriptionId) {
  return request({
    url: '/prescriptions/prescriptions/' + prescriptionId,
    method: 'delete'
  })
}
