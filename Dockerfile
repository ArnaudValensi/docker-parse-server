FROM node:latest

RUN apt-get update && apt-get install -y \
  openssh-server

RUN echo 'root:test' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
#RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# not sure of that, it is from
# https://docs.docker.com/engine/examples/running_ssh_service/
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

ENV PARSE_HOME /parse
ENV PARSE_CLOUD /parse/parse-cloud

ADD index.js ${PARSE_HOME}/index.js
ADD package.json ${PARSE_HOME}/package.json
ADD jsconfig.json ${PARSE_HOME}/jsconfig.json

COPY parse-cloud $PARSE_CLOUD

WORKDIR $PARSE_HOME
RUN npm install

## ENV
#ENV APP_ID myAppId
#ENV MASTER_KEY myMasterKey
#ENV DATABASE_URI mongodb://localhost:27017/dev
#ENV CLOUD_HOME ${PARSE_CLOUD}/parse-cloud
#ENV PARSE_MOUNT /parse
#ENV COLLECTION_PREFIX
#ENV CLIENT_KEY
#ENV REST_API_KEY
#ENV DOTNET_KEY
#ENV JAVASCRIPT_KEY
#ENV DOTNET_KEY
#ENV FILE_KEY
#ENV FACEBOOK_APP_IDS "xx,xxx"

ENV PARSE_PORT 1337
ENV PUBLIC_PORT 1338

EXPOSE $PARSE_PORT
EXPOSE $PUBLIC_PORT

VOLUME $PARSE_CLOUD
ENV NODE_PATH .

#CMD ["/usr/sbin/sshd", "-D"]
CMD [ "npm", "start" ]
#CMD /etc/init.d/ssh start && npm start
