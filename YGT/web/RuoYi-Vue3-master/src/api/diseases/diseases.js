import request from '@/utils/request'

// 查询疾病列表
export function listDiseases(query) {
  return request({
    url: '/diseases/diseases/list',
    method: 'get',
    params: query
  })
}

// 查询疾病详细
export function getDiseases(diseaseId) {
  return request({
    url: '/diseases/diseases/' + diseaseId,
    method: 'get'
  })
}

// 新增疾病
export function addDiseases(data) {
  return request({
    url: '/diseases/diseases',
    method: 'post',
    data: data
  })
}

// 修改疾病
export function updateDiseases(data) {
  return request({
    url: '/diseases/diseases',
    method: 'put',
    data: data
  })
}

// 删除疾病
export function delDiseases(diseaseId) {
  return request({
    url: '/diseases/diseases/' + diseaseId,
    method: 'delete'
  })
}
