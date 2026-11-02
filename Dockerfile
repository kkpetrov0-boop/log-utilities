FROM python:3.12-slim AS builder
WORKDIR /app
COPY pyproject.toml README.md ./
COPY src/ ./src/
RUN pip install .

FROM python:3.12-slim
COPY --from=builder /usr/local/bin/logtail /usr/local/bin/logtail
COPY --from=builder /usr/local/lib/python3.12/site-packages /usr/local/lib/python3.12/site-packages
RUN useradd -r -u 1001 logtail
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENV PYTHONUNBUFFERED=1
USER logtail
ENTRYPOINT ["/entrypoint.sh"]
