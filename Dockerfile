# Use Node.js official image
FROM node:18

# Set working directory to /app (or any other directory name you prefer)
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the rest of the application files (including the 'src' folder, etc.)
COPY . .

# Build the app (this will generate the 'dist' folder)
RUN npm run build

# Expose the port the app will run on
EXPOSE 3000

# Start the app using the 'start:prod' script, which runs the compiled app in 'dist'
CMD ["npm", "run", "start:prod"]