# load shell dotfiles
for file in ~/.dotfiles/.{path,exports,bash_prompt,aliases,functions,localrc}; do
	[ -r "$file" ] && source "$file"
done
unset file

# load scripts
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  #rvm
source "$HOME/.dotfiles/scripts/bashmarks.sh" #bashmarks

# bash settings
set -o vi # vi mode
shopt -s histappend # append history
shopt -s cmdhist # force history commands to fit on one line
shopt -s checkwinsize # force bash to update window size
shopt -s nocaseglob # case insensitive globbing