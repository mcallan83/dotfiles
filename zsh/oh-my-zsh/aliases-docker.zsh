# docker compose
alias dcu="docker-compose up"
alias dcub="docker-compose up --build"

# ansible playbook 2.8
alias ansible-playbook="docker run \
    --rm \
    -it \
    -v \"$(pwd)\":/ansible \
    -v ~/.ssh/id_rsa:/root/.ssh/id_rsa \
    --workdir=/ansible \
    willhallonline/ansible:2.8-alpine \
    ansible-playbook"

# ansible vault 2.8
alias ansible-vault="docker run \
    --rm \
    -it \
    -v \"$(pwd)\":/ansible \
    -v ~/.ssh/id_rsa:/root/.ssh/id_rsa \
    --workdir=/ansible \
    willhallonline/ansible:2.8-alpine \
    ansible-vault"

# docker clean
alias docker-clean="docker run --rm -v /var/run/docker.sock:/var/run/docker.sock zzrot/docker-clean"

# docker garbage collection
alias docker-gc="docker run --rm -v /var/run/docker.sock:/var/run/docker.sock spotify/docker-gc"

# generate password hashes via mkpasswd
alias mkpasswd="docker run -it --rm egray/mkpasswd"

# web based docker manager
alias portainer="docker run -v /var/run/docker.sock:/var/run/docker.sock -d -p 9000:9000 portainer/portainer --no-auth"

# wordpress security tool
alias wpscan="docker run -it --rm wpscanteam/wpscan"
