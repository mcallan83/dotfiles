# list open ports
alias ports='sudo nmap -sT -O localhost'

# probe host ports sequentially with nmap
# example: knock 127.0.0.1 80 90 100
knock() {
  local host=$1
  local port
    shift
    for port in "$@"; do
      nmap -Pn --host-timeout 100 --max-retries 0 -p "$port" "$host"
    done
}

