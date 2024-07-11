import request from '@/utils/request'

// 查询检查列表
export function listExamination(query) {
  return request({
    url: '/examination/examination/list',
    method: 'get',
    params: query
  })
}

// 查询检查详细
export function getExamination(examId) {
  return request({
    url: '/examination/examination/' + examId,
    method: 'get'
  })
}

// 新增检查
export function addExamination(data) {
  return request({
    url: '/examination/examination',
    method: 'post',
    data: data
  })
}

// 修改检查
export function updateExamination(data) {
  return request({
    url: '/examination/examination',
    method: 'put',
    data: data
  })
}

// 删除检查
export function delExamination(examId) {
  return request({
    url: '/examination/examination/' + examId,
    method: 'delete'
  })
}
