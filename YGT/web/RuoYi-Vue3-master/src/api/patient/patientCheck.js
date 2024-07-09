import request from '@/utils/request'

// 查询患者查看列表
export function listPatientCheck(query) {
  return request({
    url: '/patient/patientCheck/list',
    method: 'get',
    params: query
  })
}

// 查询患者查看详细
export function getPatientCheck(appointmentId) {
  return request({
    url: '/patient/patientCheck/' + appointmentId,
    method: 'get'
  })
}

// 新增患者查看
export function addPatientCheck(data) {
  return request({
    url: '/patient/patientCheck',
    method: 'post',
    data: data
  })
}

// 修改患者查看
export function updatePatientCheck(data) {
  return request({
    url: '/patient/patientCheck',
    method: 'put',
    data: data
  })
}

// 删除患者查看
export function delPatientCheck(appointmentId) {
  return request({
    url: '/patient/patientCheck/' + appointmentId,
    method: 'delete'
  })
}
