FROM python:3.12

ENV ROBYN_HOST='0.0.0.0'

WORKDIR /workspace

COPY . .

RUN pip install uv && uv sync --no-dev

EXPOSE 8080

CMD ["python", "piboard", "--log-level=DEBUG"]
