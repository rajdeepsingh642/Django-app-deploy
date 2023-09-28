FROM python:3.9-slim-buster
WORKDIR /app
ADD . /app
RUN pip install --upgrade pip
RUN pip install -r requirments.txt
EXPOSE 8000
CMD python manage.py runserver 0:8000