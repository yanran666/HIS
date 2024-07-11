import request from '@/utils/request'

// 查询检查申请列表
export function listRequests(query) {
  return request({
    url: '/requests/requests/list',
    method: 'get',
    params: query
  })
}

// 查询检查申请详细
export function getRequests(requestId) {
  return request({
    url: '/requests/requests/' + requestId,
    method: 'get'
  })
}

// 新增检查申请
export function addRequests(data) {
  return request({
    url: '/requests/requests',
    method: 'post',
    data: data
  })
}

// 修改检查申请
export function updateRequests(data) {
  return request({
    url: '/requests/requests',
    method: 'put',
    data: data
  })
}

// 删除检查申请
export function delRequests(requestId) {
  return request({
    url: '/requests/requests/' + requestId,
    method: 'delete'
  })
}
