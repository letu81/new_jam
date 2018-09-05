source 'https://gems.ruby-china.com/'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
gem 'rails-html-sanitizer', '~> 1.0.4'
gem 'rack-protection', '~> 1.5.5'
# Use mysql as the database for Active Record
gem 'mysql2', '~> 0.4.8'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'mini_racer', platforms: :ruby
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

gem 'devise', '~> 4.4.0'
gem 'activeadmin', '~> 1.3.0'
gem 'kaminari', '~> 1.1.0'

# 上传组件
gem 'carrierwave', '1.2.0'
gem 'mini_magick', '~> 4.8'
# 解决大文件上传报内存问题：Cannot allocate memory - identify
gem 'posix-spawn'

# redis
gem 'redis-store', '1.5.0'
gem 'redis'
gem 'hiredis'
# redis 命名空间
gem 'redis-namespace'
# 将一些数据存放入 Redis
gem 'redis-objects'

# 使用redis做服务器缓存
gem 'redis-rails'

# 防止大量请求的IP
gem 'rack-attack'

# editor
gem 'redactor2_rails', github: 'tuda2008/redactor2_rails'

# 队列处理消息发送
gem 'sidekiq'

# 支持解析xml
gem 'actionpack-xml_parser'

# 状态机
gem 'state_machine'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # write schema to model
  gem "annotate", '~> 2.7.0'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]