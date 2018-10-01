#Download base image alpine
FROM alpine:3.8

# Update Software repository
RUN apk update && apk upgrade && apk add --no-cache git openssh-client curl less openssl tree less bash bash-completion ca-certificates jq coreutils binutils findutils grep vim ncurses redis

# Setup /home/anand
ENV APP_ROOT=/home/anand
WORKDIR ${APP_ROOT}
ENV PATH=${APP_ROOT}/bin:${PATH} HOME=${APP_ROOT}
ADD https://storage.googleapis.com/kubernetes-release/release/v1.12.0/bin/linux/amd64/kubectl bin/kubectl
ADD https://storage.googleapis.com/kubernetes-helm/helm-v2.11.0-linux-amd64.tar.gz src/
ADD https://dl.minio.io/client/mc/release/linux-amd64/mc bin/mc
ADD https://github.com/wercker/stern/releases/download/1.8.0/stern_linux_amd64 bin/stern
COPY openshift/bin/ ${APP_ROOT}/bin/
COPY openshift/kubectx .kubectx
COPY openshift/kube-ps1 .kube-ps1
COPY openshift/fzf .fzf
COPY openshift/.bash_profile .
COPY openshift/.bashrc .bashrc
COPY openshift/.om .
COPY openshift/config .kube/
COPY openshift/spinnaker.txt src/
COPY openshift/complete-setup.sh .
RUN chgrp -R 0 ${APP_ROOT} && \
    chmod -R u+x ${APP_ROOT}/bin && \
    chmod -R g=u ${APP_ROOT} /etc/passwd && \
    chmod +x ~/complete-setup.sh && \
    chmod -R u+x ${APP_ROOT}/.kube && \
    chmod -R u+x ${APP_ROOT}/.kubectx && \
    chmod -R u+x ${APP_ROOT}/.kube-ps1 && \
    chmod -R u+x ${APP_ROOT}/.fzf && \
    chmod -R u+x ${APP_ROOT}/src 

# Let's get going
USER 10001
ENTRYPOINT [ "uid_entrypoint" ]
CMD run







