# 深圳市佳安美光学有限公司 
gxboli.cn 

bundle install
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed

bundle exec rails s

open new tab http://127.0.0.1:3000/