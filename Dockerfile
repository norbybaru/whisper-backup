FROM python:2.7

ENV BOTO_VERSION 2.46.1
ENV CARBON_VERSION 0.9.15
ENV GRAPHITE_VERSION 0.9.15

COPY . /opt/whisper-backup

RUN pip install boto==$BOTO_VERSION && \
    pip install carbon==$CARBON_VERSION && \
    pip install graphite-web==$GRAPHITE_VERSION && \
    pip install whisper==$GRAPHITE_VERSION

RUN cd /opt/whisper-backup && python setup.py install

WORKDIR /opt/whisper-backup/whisperbackup

ENTRYPOINT ["python", "whisperbackup.py"]