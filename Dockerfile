# syntax=docker/dockerfile:1
FROM python:3.6
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /code
COPY requirements.txt /code/
RUN pip install -r requirements.txt
RUN git clone https://github.com/ikuei-kagekidan/attendance_book.git -b v1.0.0 --depth 1 
WORKDIR /code/attendance_book
RUN python manage.py migrate
RUN python manage.py loaddata personlist.json
RUN python manage.py collectstatic
CMD gunicorn --bind 0.0.0.0:$PORT mysite.wsgi