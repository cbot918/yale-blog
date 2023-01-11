FROM alpine

RUN apk add --no-cache nodejs npm vim
RUN mkdir -p src/css

WORKDIR /app/docu

COPY build/. .
COPY package-lock.json .
COPY package.json .
COPY docusaurus.config.js .
COPY sidebars.js .
COPY src/css/custom.css src/css/

RUN npm install

CMD ["npm","run","serve","--","--port","4000"]