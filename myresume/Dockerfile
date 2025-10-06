FROM hugomods/hugo:exts

# Copy source files into the container
COPY . /src

# Build the site (output -> /src/public)
RUN hugo --minify
