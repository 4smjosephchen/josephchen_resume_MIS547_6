# Use the Hugo Extended image
FROM hugomods/hugo:exts

# Set working directory
WORKDIR /src

# Copy all files
COPY . .

# Build the Hugo site
RUN hugo --minify -d public

# Expose port (optional for static sites)
EXPOSE 8080
