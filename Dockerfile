FROM ghcr.io/ggml-org/llama.cpp:server

ENV LLAMA_ARG_HOST=::
ENV LLAMA_ARG_PORT=8000
ENV LLAMA_ARG_NO_WEBUI=1
ENV LLAMA_ARG_JINJA=1
ENV LLAMA_ARG_HF_REPO=$LLAMA_ARG_HF_REPO
ENV LLAMA_CHAT_TEMPLATE_KWARGS='{"reasoning_effort":"low","builtin_tools":["python"]}'
ENV PYTHON_EXECUTION_BACKEND=UV
ENV LLAMA_API_KEY=$LLAMA_API_KEY

WORKDIR /app

EXPOSE 8000/tcp

HEALTHCHECK CMD [ "curl", "-f", "http://localhost:8000/health" ]

ENTRYPOINT [ "./llama-server" ]
