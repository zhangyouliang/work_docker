FROM nginx:latest

# ------------------------------------------------------------------------------
# Provision the server
# ------------------------------------------------------------------------------
RUN mkdir /docker
COPY docker /docker
COPY .  /srv
RUN /docker/run.sh

CMD ["nginx", "-g" ,"daemon off;"]