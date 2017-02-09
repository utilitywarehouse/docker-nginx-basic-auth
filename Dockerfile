FROM nginx:alpine

ENV HTPASSWD='foo:$apr1$odHl5EJN$KbxMfo86Qdve2FH4owePn.' \
    FORWARD_PORT=80 \
    FORWARD_HOST=web

WORKDIR /opt

RUN apk add --no-cache gettext

# remove base images conf
RUN rm /etc/nginx/nginx.conf
# add ours
ADD nginx.conf /etc/nginx/nginx.conf

COPY auth.conf auth.htpasswd launch.sh ./

CMD ["./launch.sh"]
