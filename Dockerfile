# 使用官方 Hugo 镜像进行构建
FROM hugomods/hugo:debian-std-go-git-0.147.9 AS builder

WORKDIR /src/build
COPY . .

# 构建静态文件
RUN hugo

# 用 Nginx 作为生产环境服务器
FROM nginx:alpine
COPY --from=builder /src/build/public /usr/share/nginx/html

# 可选：自定义 Nginx 配置（如有需要可解开注释）
# COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]