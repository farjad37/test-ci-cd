# ----------- Build Stage -----------
    FROM node:18-alpine as builder

    # Set working directory
    WORKDIR /app
    
    # Install dependencies
    COPY package*.json ./
    RUN npm install
    
    # Copy the rest of the source code
    COPY . .
    
    # Generate Prisma client
    RUN npx prisma generate
    
    # Build the NestJS application
    RUN npm run build
    
    
    # ----------- Production Stage -----------
    FROM node:18-alpine as production
    
    # Set working directory
    WORKDIR /app
    
    # Copy only necessary files from build stage
    COPY --from=builder /app/package*.json ./
    COPY --from=builder /app/node_modules ./node_modules
    COPY --from=builder /app/dist ./dist
    COPY --from=builder /app/prisma ./prisma
    
    # Expose the port NestJS listens on
    EXPOSE 3000
    
    # Start the app
    CMD ["node", "dist/src/main.js"]
    