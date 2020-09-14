# docker compose
alias dcu="docker-compose up"
alias dcub="docker-compose up --build"

# ansible playbook 2.8
# https://docs.ansible.com/ansible/latest/user_guide/playbooks.html
alias ansible-playbook="docker run \
    --rm \
    -it \
    -v \"$(pwd)\":/ansible \
    -v ~/.ssh/id_rsa:/root/.ssh/id_rsa \
    --workdir=/ansible \
    willhallonline/ansible:2.8-alpine \
    ansible-playbook"

# ansible vault 2.8
# https://docs.ansible.com/ansible/latest/user_guide/vault.html
alias ansible-vault="docker run \
    --rm \
    -it \
    -v \"$(pwd)\":/ansible \
    -v ~/.ssh/id_rsa:/root/.ssh/id_rsa \
    --workdir=/ansible \
    willhallonline/ansible:2.8-alpine \
    ansible-vault"

# docker clean
# https://hub.docker.com/r/zzrot/docker-clean
alias docker-clean="docker run \
    --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    zzrot/docker-clean"

# generate password hashes via mkpasswd
alias mkpasswd="docker run -it --rm egray/mkpasswd"

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
