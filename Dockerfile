FROM python

RUN apt-get update && apt-get install -y \
    chromium-driver \
    chromium \
    curl \
    unzip \
    && apt-get clean

ENV CHROME_BIN=/usr/bin/chromium
ENV CHROMEDRIVER_BIN=/us/bin/chromedriver

COPY --from=ghcr.io/astral-sh/uv:0.7.12 /uv /uvx /bin/

ADD . /app

WORKDIR /app

COPY . .

RUN uv sync --locked


EXPOSE 8000
CMD ["uv", "run", "uvicorn", "app.news_app:app","--host","0.0.0.0","--port","8000"]
