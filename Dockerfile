FROM python:3.11-bookworm

ENV ROBYN_HOST='0.0.0.0'

WORKDIR /workspace

COPY . .

RUN pip install uv && uv sync --no-dev

EXPOSE 8080

CMD ["uv", "run", "piboard", "--log-level=DEBUG"]
