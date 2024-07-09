import request from '@/utils/request'

// 查询病历列表
export function listRecords(query) {
  return request({
    url: '/records/records/list',
    method: 'get',
    params: query
  })
}

// 查询病历详细
export function getRecords(medicalRecordId) {
  return request({
    url: '/records/records/' + medicalRecordId,
    method: 'get'
  })
}

// 新增病历
export function addRecords(data) {
  return request({
    url: '/records/records',
    method: 'post',
    data: data
  })
}

// 修改病历
export function updateRecords(data) {
  return request({
    url: '/records/records',
    method: 'put',
    data: data
  })
}

// 删除病历
export function delRecords(medicalRecordId) {
  return request({
    url: '/records/records/' + medicalRecordId,
    method: 'delete'
  })
}
