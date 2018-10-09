FROM python:3-slim

LABEL maintainer drober+python@gmail.com

WORKDIR /usr/src/app
VOLUME /usr/src/conf
ENV SSH_UNLOCK_VERBOSE ""

COPY . .
RUN pip3 install .
CMD [ "python", "./unlock.py", "--config", "/usr/src/conf/config.ini"]
