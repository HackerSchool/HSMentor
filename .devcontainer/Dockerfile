FROM mcr.microsoft.com/devcontainers/dotnet:1-9.0-bookworm

# For some reason, the devcontainer image for dotnet 9 is installing a RC version of 9.0.0,
# when 9.0.0 has already been released. This fixes it.
RUN curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel STS \
    && ln -s $HOME/.dotnet/dotnet /usr/local/bin/dotnet

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

# [Optional] Uncomment this line to install global node packages.
# RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && npm install -g <your-package-here>" 2>&1