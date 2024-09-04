FROM python:latest


WORKDIR .
RUN apt -qq update && apt -qq install -y git wget pv jq python3-dev ffmpeg mediainfo
COPY . .
RUN pip3 install -r requirements.txt
RUN apt install ffmpeg

#CMD ["python3", "main.py"]
CMD gunicorn app:app & python3 main.py
