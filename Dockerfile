# Use NodeJS official image
FROM node:18

# Create app directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy all source files
COPY . .

# Generate Prisma client
RUN npx prisma generate

# Build the app
RUN npm run build

# Expose the port
EXPOSE 3000

# Start the app
CMD ["npm", "run", "start:prod"]
