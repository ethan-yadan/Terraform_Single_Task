# python environment wrapped in docker, to run a flask app, copy app.py into working directory
# executes python script upon startup

FROM python:3.9-slim

WORKDIR /app

RUN pip install Flask

COPY app.py .

CMD ["python", "app.py"]
