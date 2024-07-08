import request from '@/utils/request'

// 查询退号列表
export function listCancel_appointment(query) {
  return request({
    url: '/cancel_appointment/cancel_appointment/list',
    method: 'get',
    params: query
  })
}

// 查询退号详细
export function getCancel_appointment(appointmentId) {
  return request({
    url: '/cancel_appointment/cancel_appointment/' + appointmentId,
    method: 'get'
  })
}

// 新增退号
export function addCancel_appointment(data) {
  return request({
    url: '/cancel_appointment/cancel_appointment',
    method: 'post',
    data: data
  })
}

// 修改退号
export function updateCancel_appointment(data) {
  return request({
    url: '/cancel_appointment/cancel_appointment',
    method: 'put',
    data: data
  })
}

// 删除退号
export function delCancel_appointment(appointmentId) {
  return request({
    url: '/cancel_appointment/cancel_appointment/' + appointmentId,
    method: 'delete'
  })
}
