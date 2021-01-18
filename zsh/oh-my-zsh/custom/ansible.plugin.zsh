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

# generate user password hashes via mkpasswd
alias mkpasswd="docker run -it --rm egray/mkpasswd"

# ansible shortcut aliases
alias ap="ansible-playbook"
alias avd="ansible-vault decrypt"
alias ave="ansible-vault encrypt"
