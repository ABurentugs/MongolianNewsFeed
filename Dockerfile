FROM python

RUN apt-get update && apt-get install -y \
    chromium-driver \
    chromium \
    curl \
    unzip \
    && apt-get clean

ENV CHROME_BIN=/usr/bin/chromium
ENV CHROMEDRIVER_BIN=/us/bin/chromedriver

WORKDIR /app
RUN curl -LsSf https://astral.sh/uv/install.sh | sh
ENV PATH="/root/.cargo/bin:$PATH"

COPY . .
RUN uv pip install --system -r requirements.txt

EXPOSE 8000
CMD ["uvicorn", "app.main:app","--host","0.0.0.0","--port","8000"]
