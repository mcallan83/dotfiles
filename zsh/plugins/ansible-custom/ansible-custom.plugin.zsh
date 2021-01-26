ANSIBLE_VERSION="${ANSIBLE_VERSION:-2.8}"

# ansible playbook 2.8
# https://docs.ansible.com/ansible/latest/user_guide/playbooks.html
alias ansible-playbook="docker run \
    --rm \
    -it \
    -v \"$(pwd)\":/ansible \
    -v ~/.ssh/id_rsa:/root/.ssh/id_rsa \
    --workdir=/ansible \
    willhallonline/ansible:${ANSIBLE_VERSION}-alpine \
    ansible-playbook"

# ansible vault 2.8
# https://docs.ansible.com/ansible/latest/user_guide/vault.html
alias ansible-vault="docker run \
    --rm \
    -it \
    -v \"$(pwd)\":/ansible \
    -v ~/.ssh/id_rsa:/root/.ssh/id_rsa \
    --workdir=/ansible \
    willhallonline/ansible:${ANSIBLE_VERSION}-alpine \
    ansible-vault"

# generate user password hashes via mkpasswd
alias mkpasswd="docker run -it --rm egray/mkpasswd"

alias ap="ansible-playbook"
alias avd="ansible-vault decrypt"
alias ave="ansible-vault encrypt"
