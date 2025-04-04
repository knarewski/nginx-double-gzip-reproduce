FROM nginx:1.27.4

RUN apt-get update && apt-get install -y ruby
RUN mkdir -p /usr/src
WORKDIR /usr/src

COPY reproduce-inside-container pre_gzipped_asset.js pre_gzipped_asset.js.gz non_pre_gzipped_asset.js static-asset-server.rb /usr/src/
COPY nginx-default.conf /etc/nginx/conf.d/default.conf

CMD ["./reproduce-inside-container"]
