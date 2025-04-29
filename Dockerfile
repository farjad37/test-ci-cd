FROM node:18-alpine as builder

WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Run build step to compile the app
RUN npm run build  # This should generate the 'dist' folder

# Expose the port
EXPOSE 3000

# Start the app using 'start:prod' which typically runs the compiled 'dist' app
CMD [ "node", "/app/dist/src/main.js" ]
