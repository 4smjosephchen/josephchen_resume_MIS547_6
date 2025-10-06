# Use Hugo Extended for SCSS support
FROM hugomods/hugo:exts as builder

# Set working directory
WORKDIR /src

# Copy all files
COPY . .

# Build the site
RUN hugo --minify -d /public

# Use a simple web server to serve the static site
FROM nginx:alpine

# Copy the built Hugo site to Nginx html directory
COPY --from=builder /public /usr/share/nginx/html

# Copy custom Nginx config to listen on port 8080
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 8080 for App Platform
EXPOSE 8080

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
