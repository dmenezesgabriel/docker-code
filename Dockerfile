FROM python:3.8-slim-buster


COPY settings/settings.json /root/.local/share/code-server/User/settings.json

WORKDIR /home

RUN apt-get update && apt-get install --no-install-recommends -y wget

RUN wget https://github.com/cdr/code-server/releases/download/3.2.0/code-server-3.2.0-linux-x86_64.tar.gz
RUN tar -xzvf code-server-3.2.0-linux-x86_64.tar.gz

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt
RUN ./code-server-3.2.0-linux-x86_64/code-server \
    # Python
    --install-extension ms-python.python --force \
    # Auto rename HTML tags
    --install-extension formulahendry.auto-rename-tag --force \
    # Hightlight syntax TOML
    --install-extension bungcip.better-toml --force \
    # Spellhecker English
    --install-extension streetsidesoftware.code-spell-checker --force \
    # Docker
    --install-extension ms-azuretools.vscode-docker --force \
    # Hightlight dotenv
    --install-extension mikestead.dotenv --force \
    # Theme Dracula
    --install-extension dracula-theme.theme-dracula --force \
    # Hightlight terraform
    --install-extension hashicorp.terraform --force \
    # Drawio
    --install-extension hediet.vscode-drawio --force \
    # Drawio
    --install-extension hediet.vscode-drawio --force \
    # Icons material icons
    --install-extension pkief.material-icon-theme --force \
    # Trailing spaces
    --install-extension shardulm94.trailing-spaces --force

# TODO
# Install Brasilian Spellchecker
# Install vscode intelisense
# Instal VimL syntax highlight
# Install Brack pair colorizer

ENTRYPOINT [ "./code-server-3.2.0-linux-x86_64/code-server", "--host", "0.0.0.0", "--disable-telemetry", "--port", "8989"]