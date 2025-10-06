# Use Hugo Extended for SCSS support
FROM hugomods/hugo:exts

# Set working directory
WORKDIR /src

# Copy all files
COPY . .

# Build the site
RUN hugo --minify -d /public

# Use a simple web server to serve the static site
FROM nginx:alpine

# Copy the built Hugo site to Nginx html directory
COPY --from=0 /public /usr/share/nginx/html

# Expose port 8080 for App Platform
EXPOSE 8080

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
