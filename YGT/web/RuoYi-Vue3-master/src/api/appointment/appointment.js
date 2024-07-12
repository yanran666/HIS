import request from '@/utils/request'
export default {
  name: "Appointment",
};
// 新增挂号
export function addAppointment(data) {
  return request({
    url: '/appointment/appointment',
    method: 'post',
    data: data
  });
}
