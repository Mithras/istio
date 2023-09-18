FROM ubuntu

WORKDIR /tmp

# Install extra packages
RUN apt-get update \
  && apt-get install -y openssh-client nano jq sudo curl

# Install k9s
ARG K9S_VERSION=v0.27.4
RUN curl -SLO https://github.com/derailed/k9s/releases/download/$K9S_VERSION/k9s_Linux_amd64.tar.gz \
  && tar xzvf k9s_Linux_amd64.tar.gz \
  && mv k9s /usr/local/bin \
  && rm -rf *

# Install istioctl
ARG ISTIO_VERSION=1.19.0
RUN curl -L https://istio.io/downloadIstio | ISTIO_VERSION=$ISTIO_VERSION sh - \
  && mv istio-$ISTIO_VERSION/bin/istioctl /usr/local/bin \
  && rm -rf *

# Add vscode user
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN groupadd --gid $USER_GID $USERNAME \
  && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
  && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
  && chmod 0440 /etc/sudoers.d/$USERNAME

# Change existing user
# ARG USERNAME=XXX
# ARG USER_UID=1000
# ARG USER_GID=$USER_UID
# RUN groupmod --gid $USER_GID $USERNAME \
#     && usermod --uid $USER_UID --gid $USER_GID $USERNAME \
#     && chown -R $USER_UID:$USER_GID /home/$USERNAME

USER $USERNAME

WORKDIR /workspace

# Append .bashrc
COPY ./.bashrc ./.bashrc
RUN cat .bashrc >> ~/.bashrc

# Set envs
ENV KUBE_EDITOR=nano
