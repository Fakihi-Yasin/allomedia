# Stage 1: Build the application
FROM node:20-alpine AS build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

# Stage 2: Run tests
FROM build AS test

# Add any testing commands here (e.g., running unit tests)
RUN npm run test  # Make sure to have a 'test' script defined in your package.json

# Stage 3: Production build
FROM build AS prod

EXPOSE 3000

CMD ["npm", "run", "dev"]
