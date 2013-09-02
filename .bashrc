#load shell dotfiles
for file in .dotfiles/.{path,bash_prompt,exports,aliases,functions,localrc}; do
	[ -r "$file" ] && source "$file"
done
unset file

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session as a function