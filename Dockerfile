FROM node:16.17-alpine

WORKDIR /user/app

COPY package*.json ./

COPY . ./

# RUN npm install
RUN npm install --no-optional && npm cache clean --force
# RUN npm run build
#ARG
ARG NODE_ENV=development

ENV NODE_ENV $NODE_ENV

RUN if [ "$NODE_ENV" = "development" ]; then npm run build; elif [ "$NODE_ENV" = "testing" ]; then npm run build:testing; elif [ "$NODE_ENV" = "staging" ]; then npm run build:staging; elif [ "$NODE_ENV" = "production" ]; then npm run build; fi

ENV PORT=3000

EXPOSE 3000

CMD if [ "$NODE_ENV" = "development" ]; then npm start; elif [ "$NODE_ENV" = "testing" ]; then serve -s build; elif [ "$NODE_ENV" = "staging" ]; then serve -s build; elif [ "$NODE_ENV" = "production" ]; then serve -s build; fi
# CMD ["npm", "start"]