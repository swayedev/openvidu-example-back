# Use an official Node.js runtime as a parent image
FROM node:latest
# Set the working directory in the container
WORKDIR /usr/src/app
# Copy package.json and package-lock.json (or yarn.lock if you use yarn)
COPY package*.json ./
# Install dependencies
# If you're using yarn, you might want to run `yarn install` instead
RUN npm install

# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source inside the Docker image
COPY . .

# Your app binds to port 3000, so you'll use the EXPOSE instruction to have it mapped by the Docker daemon
EXPOSE 5000

# Define the command to run your app using CMD which defines your runtime
# Here we will use nodemon to run the application
CMD ["npx", "nodemon", "src/app.ts"]
# Replace 'src/app.js' with the path to your main file if it's different
