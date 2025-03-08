# Stage 1: Build Angular App
FROM node:20 as build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build --prod

# Stage 2: Serve App with Nginx
FROM nginx:alpine
COPY --from=build /app/dist/angular-realworld-example-app-main /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
