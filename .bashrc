# load shell dotfiles
for file in .dotfiles/.{path,bash_prompt,exports,aliases,functions,localrc}; do
	[ -r "$file" ] && source "$file"
done
unset file

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

//enable vim mode on bash prompt
set -o vi