FROM node:16.17-alpine

WORKDIR /user/app

COPY package*.json ./

COPY . ./

# RUN npm install
RUN npm install --no-optional && npm cache clean --force
RUN npm run build

ENV PORT=3000

EXPOSE 3000

ARG NODE_ENV=development

CMD if [ "$NODE_ENV" = "development" ]; then npm start; elif [ "$NODE_ENV" = "testing" ]; then npm run build:testing; elif [ "$NODE_ENV" = "staging" ]; then npm run build:staging; elif [ "$NODE_ENV" = "production" ]; then serve -s build; fi
# CMD ["npm", "start"]