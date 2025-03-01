FROM python:3.10.5-buster

LABEL org.opencontainers.image.description "Dokcer image for running wyzely-detect"
LABEL org.opencontainers.image.source "https://github.com/slashtechno/wyzely-detect"

RUN apt update && apt install libgl1 -y
RUN pip install poetry

WORKDIR /app

COPY . .

RUN poetry install

ENTRYPOINT ["poetry", "run", "python", "-m", "wyzely_detect"]