# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
  Partner.create!(title: '深圳市博尔福鑫科技有限公司', vip: true, visible: true)
  Partner.create!(title: '深圳市凡客生物科技有限公司', vip: true, visible: true)
  Partner.create!(title: '深圳市天石科技有限责任公司', vip: true, visible: true)
  Partner.create!(title: '深圳市金贝尔智能系统有限公司', visible: true)
  Partner.create!(title: '深圳市卡尔码特科技有限公司', visible: true)
  Partner.create!(title: '广东霸菱科技有限公司', visible: true)
  Partner.create!(title: '青岛方普电子有限责任公司', visible: true)
  Partner.create!(title: '中山市雅麒金属制品有限公司', visible: true)
  Partner.create!(title: '深圳市芝麻开门电子科技有限公司', visible: true)
  Partner.create!(title: '深圳市前海洛克智慧安防科技股份公司', visible: true)
  Partner.create!(title: '深圳市聪明屋智能家电科技有限公司', visible: true)
  user = User.create!(name: 'tutu', email: 'tutu@123456', mobile: '15712000000', password: '123456', password_confirmation: '123456')
  Address.create!(user: user, username: 'test', mobile: '15710000000', post_code: '500015', address: '深圳市南山区创业路')
end