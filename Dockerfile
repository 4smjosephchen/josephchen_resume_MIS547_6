# Use Hugo Extended
FROM hugomods/hugo:exts

# Copy all files
COPY . /src

# Build the site
RUN hugo --minify -d public

# Serve the site with a simple web server
WORKDIR /src/public
EXPOSE 8080
CMD ["python3", "-m", "http.server", "8080"]
