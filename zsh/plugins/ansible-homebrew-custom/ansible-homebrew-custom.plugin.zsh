ANSIBLE_VERSION="${ANSIBLE_VERSION:-2.8}"

if [ -d "/usr/local/opt/ansible@$ANSIBLE_VERSION/bin" ]
then
    export PATH="/usr/local/opt/ansible@$ANSIBLE_VERSION/bin:$PATH"
fi

# generate user password hashes via mkpasswd
alias mkpasswd="docker run -it --rm egray/mkpasswd"

alias ap="ansible-playbook"
alias avd="ansible-vault decrypt"
alias ave="ansible-vault encrypt"
