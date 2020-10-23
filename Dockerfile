FROM python:3.8-slim-buster

WORKDIR /home

RUN apt-get update && apt-get install --no-install-recommends -y wget

RUN wget https://github.com/cdr/code-server/releases/download/3.2.0/code-server-3.2.0-linux-x86_64.tar.gz
RUN tar -xzvf code-server-3.2.0-linux-x86_64.tar.gz

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt
RUN ./code-server-3.2.0-linux-x86_64/code-server \
    --install-extension ms-python.python --force \
    --install-extension ms-azuretools.vscode-docker --force

CMD /bin/bash -c "./code-server-3.2.0-linux-x86_64/code-server --host 0.0.0.0 --port 8989"