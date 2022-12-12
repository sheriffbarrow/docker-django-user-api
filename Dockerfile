FROM python:3.10-slim-buster
LABEL key=Sheriff

ENV PYTHONUNBUFFERED 1

RUN mkdir /app
COPY ./app /app
WORKDIR /app

COPY ./requirements.txt /requirements.txt
RUN pip3 install -r /requirements.txt

CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
