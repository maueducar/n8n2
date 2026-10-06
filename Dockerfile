FROM docker.io/n8nio/n8n:latest

USER root

RUN apk add --no-cache git \
  && git clone --depth 1 https://github.com/bergeouss/n8n-nodes-opencode.git /tmp/n8n-nodes-opencode \
  && cd /tmp/n8n-nodes-opencode \
  && npm install \
  && npm run build \
  && npm pack \
  && cd /usr/local/lib/node_modules/n8n \
  && npm install /tmp/n8n-nodes-opencode/bergeouss-n8n-nodes-opencode-*.tgz \
  && rm -rf /tmp/n8n-nodes-opencode

USER node
