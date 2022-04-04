################################################################################
# Ansible Homebrew Plugin
#
# Adds the Ansible bin folder to $PATH and creates custom aliases.
################################################################################

ANSIBLE_VERSION="${ANSIBLE_VERSION:-2.8}"

if [ -d "/usr/local/opt/ansible@${ANSIBLE_VERSION}/bin" ]
then
    export PATH="/usr/local/opt/ansible@${ANSIBLE_VERSION}/bin:$PATH"
fi

alias ap="ansible-playbook"
alias avd="ansible-vault decrypt"
alias ave="ansible-vault encrypt"
