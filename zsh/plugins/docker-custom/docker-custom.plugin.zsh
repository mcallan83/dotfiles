# docker compose
alias dcu="docker-compose up"
alias dcub="docker-compose up --build"

# docker clean
# https://hub.docker.com/r/zzrot/docker-clean
alias docker-clean="docker run \
    --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    zzrot/docker-clean"

# generate user password hashes via mkpasswd
alias mkpasswd="docker run -it --rm egray/mkpasswd"

# portainer
# https://www.portainer.io
alias portainer="docker run \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -d \
    -p 9000:9000 \
    portainer/portainer \
    --no-auth"

# tor browser
alias torb="docker run -d -p 5800:5800 domistyle/tor-browser"

# wordpress security tool
# https://wpscan.org/
alias wpscan="docker run -it --rm wpscanteam/wpscan"

# yamllint
function yamllint {
    docker run -it --rm -v "$(pwd):/workdir" ghcr.io/ffurrer2/yamllint:latest "$@"
}

# it tools
alias ittools="docker run -it --rm -p 8080:80 corentinth/it-tools:latest"



