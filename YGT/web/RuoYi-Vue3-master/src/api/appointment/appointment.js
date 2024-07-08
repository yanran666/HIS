import request from '@/utils/request'

// 新增挂号
export function addAppointment(data) {
  return request({
    url: '/appointment/appointment',
    method: 'post',
    data: data
  });
}
