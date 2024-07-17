import request from '@/utils/request'

// 查询病历记录列表
export function listMedicalCheck(query) {
  return request({
    url: '/medicalCheck/medicalCheck/list',
    method: 'get',
    params: query
  })
}

// 查询病历记录详细
export function getMedicalCheck(medicalRecordId) {
  return request({
    url: '/medicalCheck/medicalCheck/' + medicalRecordId,
    method: 'get'
  })
}

// 新增病历记录
export function addMedicalCheck(data) {
  return request({
    url: '/medicalCheck/medicalCheck',
    method: 'post',
    data: data
  })
}

// 修改病历记录
export function updateMedicalCheck(data) {
  return request({
    url: '/medicalCheck/medicalCheck',
    method: 'put',
    data: data
  })
}

// 删除病历记录
export function delMedicalCheck(medicalRecordId) {
  return request({
    url: '/medicalCheck/medicalCheck/' + medicalRecordId,
    method: 'delete'
  })
}
