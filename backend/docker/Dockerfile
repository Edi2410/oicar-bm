FROM python:3.10

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app/backend



RUN apt-get update 

COPY ./requirements.txt .
RUN pip install gunicorn
RUN pip install -r requirements.txt

COPY ./api .
COPY ./docker/wsgi-entrypoint.sh .


RUN ["chmod", "+x", "wsgi-entrypoint.sh"]
ENTRYPOINT ["sh", "wsgi-entrypoint.sh"]