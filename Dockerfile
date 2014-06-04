FROM mazzolino/armhf-ubuntu:14.04

RUN sed -i "s/main restricted/main restricted universe/" /etc/apt/sources.list && \
    apt-get update
RUN apt-get install -y libffi-dev libssl-dev python-dev python-pip

RUN pip install butterfly
RUN echo "root\nroot\n" | passwd root

EXPOSE 9191
ENTRYPOINT ["butterfly.server.py"]
CMD ["--unsecure", "--port=9191", "--host=0.0.0.0"]
