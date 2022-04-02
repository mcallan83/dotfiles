# docker compose
alias dcu="docker-compose up"
alias dcub="docker-compose up --build"

# docker clean
# https://hub.docker.com/r/zzrot/docker-clean
alias docker-clean="docker run \
    --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    zzrot/docker-clean"

# tor browser
alias torb="docker run -d -p 5800:5800 domistyle/tor-browser"

# portainer
# https://www.portainer.io
alias portainer="docker run \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -d \
    -p 9000:9000 \
    portainer/portainer \
    --no-auth"

# wordpress security tool
# https://wpscan.org/
alias wpscan="docker run -it --rm wpscanteam/wpscan"
