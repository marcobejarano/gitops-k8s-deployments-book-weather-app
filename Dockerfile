# Use an official Bun runtime as a parent image
FROM oven/bun:1.1.34-alpine

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and bun.lockb first to leverage Docker's cache
COPY package.json bun.lockb ./

# Install dependencies
RUN bun install

# Copy the rest of the application code (avoid copying node_modules if it's not needed)
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Define the command to run the app
CMD [ "bun", "start" ]
