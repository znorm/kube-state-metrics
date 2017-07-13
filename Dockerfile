FROM golang:1.7-alpine

COPY . /kube-state-metrics/

RUN REPO_PATH="k8s.io/kube-state-metrics" \
  && mkdir -p $GOPATH/src/${REPO_PATH} \
  && cp -r /kube-state-metrics/. $GOPATH/src/${REPO_PATH} \
  && cd $GOPATH/src/${REPO_PATH} \
  && ls > /temp \
  && ls /kube-state-metrics > /temp3


CMD ["kube-state-metrics", "--port=8080"]

EXPOSE 8080