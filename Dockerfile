FROM node:10-alpine
ENV NODE_ENV "production"
ENV CIRCLE_CI="2065ae463be5e534bb1d074a366d44e7a776d472"
ENV JIRA="5FP0NmFYz81U32XdjNb42762"
ENV TFC="10JCel8ocCr7Qw.atlasv1.fD96xWTO2u6UabFyQfM4Kpj5SaW9MjtqkzvZz1YQfXWa2zpMyTCOpSSvy8yuf8iSHFM"
ENV PORT 8079
EXPOSE 8079
RUN addgroup mygroup && adduser -D -G mygroup myuser && mkdir -p /usr/src/app && chown -R myuser /usr/src/app

# Prepare app directory
WORKDIR /usr/src/app
COPY package.json /usr/src/app/
COPY yarn.lock /usr/src/app/
RUN chown myuser /usr/src/app/yarn.lock

USER myuser
RUN yarn install

COPY . /usr/src/app

# Start the app
CMD ["/usr/local/bin/npm", "start"]
