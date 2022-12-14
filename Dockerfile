FROM python:3.10-slim-buster
LABEL maintainer="sheriff"

ENV PIP:DISABLE_PIP_VERSION_CHECK 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN mkdir /app-api
WORKDIR /app-api

EXPOSE 8000

COPY requirements.txt requirements.txt

RUN pip install --upgrade pip
RUN pip3 install -r /app-api/requirements.txt
COPY . /app-api

RUN adduser --disabled-password --no-create-home user
USER user

CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
