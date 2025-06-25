FROM openshift/origin-cli AS openshift

FROM ubuntu

COPY --from=openshift /usr/bin/oc /usr/bin/oc

RUN apt update && apt install -y curl git

RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
chmod 700 get_helm.sh && \
./get_helm.sh