ARG BASE_IMAGE=${BASE_IMAGE:-null}
ARG PUBLIC_IMAGE=${PUBLIC_IMAGE:-null}
FROM ${BASE_IMAGE} AS public
ARG PYTHON_VERSION=3.10

ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]
COPY ./asset /tmp/build
RUN apt update &&\
    apt install -y --no-install-recommends tzdata git&& \
    echo "China/Shanghai" > /etc/timezone && \
    ln -fs /usr/share/zoneinfo/China/Shanghai /etc/localtime 

RUN mkdir -p /app \
    && cd /app \
    && git clone https://github.com/Interbotix/interbotix_ros_manipulators.git \
    && cd interbotix_ros_manipulators 
RUN export HOME=/app \
    && cd /app/interbotix_ros_manipulators \
    && ./interbotix_ros_xsarms/install/amd64/xsarm_amd64_install.sh -n

##############################################
FROM ${PUBLIC_IMAGE} AS private
ARG TORCH_HOME
ARG _USER
ARG _UID
ARG _GID
ARG PW
ARG _HOME
ARG _PROJECTS=${_HOME}

COPY ./asset /tmp/build
# RUN pip install -r /tmp/build/requirements.txt

# Option1: Using unencrypted password/ specifying password
RUN usermod --password $(echo ${PW} | openssl passwd -1 -stdin) root
RUN useradd -m ${_USER} -d ${_HOME} --uid=${_UID} -s /bin/bash && echo "${_USER}:${PW}" | chpasswd


RUN chown ${_USER}:${_USER} -R /tmp/build
RUN chown ${_USER}:${_USER} -R /app


USER ${_UID}:${_GID}
WORKDIR ${_HOME}

COPY --chown=${_USER}:${_USER} ./asset/ssh .ssh
RUN chmod 0700 .ssh && chmod 600 .ssh/id_rsa && chmod 644 .ssh/id_rsa.pub \
    &&ssh-keyscan ssh.github.com >> .ssh/known_hosts \
    && cp /tmp/build/gitconfig ${_HOME}/.gitconfig \
    && cp /tmp/build/download-vs-code-server.sh ${_HOME}/ 
RUN echo source /opt/ros/humble/setup.bash >> ${_HOME}/.bashrc \
    && echo source /app/interbotix_ws/install/setup.bash >>${_HOME}/.bashrc
RUN rm -rf /tmp/build

ENV PYTHONPATH=.:${PYTHONPATH}

CMD "/bin/bash"


