# install node image backgroud operating system
FROM node:17-alpine3.14
WORKDIR /reactapp
#ENV PATH="./node_modules.bin:$PATH"
COPY . .
# kind of like running pip install
RUN npinstall -g 
RUN npm run build 
#CMD ["npm", "start"]