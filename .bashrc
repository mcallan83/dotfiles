# load shell dotfiles
for file in .{path,exports,bash_prompt,aliases,functions}; do
	[ -r "$HOME/.dotfiles/$file" ] && source "$HOME/.dotfiles/$file"
	[ -r "$HOME/$file.local" ] && source "$HOME/$file.local"
done
unset file
[ -r "$HOME/.localrc"] && source "$HOME/.localrc"

# load scripts
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  #rvm
source "$HOME/.dotfiles/scripts/bashmarks.sh" #bashmarks