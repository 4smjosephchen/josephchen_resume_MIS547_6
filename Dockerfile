# Use Hugo Extended image
FROM hugomods/hugo:exts

# Set working directory
WORKDIR /src

# Copy all files into the container
COPY . .

# Build the Hugo site into /public
RUN hugo --minify -d public

# Expose port (optional, DigitalOcean serves /public automatically)
EXPOSE 8080
