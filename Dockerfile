# 使用CentOS 7作为基础镜像
FROM ruby:3.3-rc-slim as production-demo

# 设置工作目录
WORKDIR /app

ENV RAILS_ENV=production

# 复制应用程序代码到容器中
COPY . /app

# 安装依赖项
RUN bundle install

# 预编译assets
RUN bundle exec rails assets:precompile

# 暴露Rails服务器端口
EXPOSE 3000

# 启动Rails服务器
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]


