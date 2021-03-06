# TODO:
# http://stackoverflow.com/questions/11530090/adding-a-new-entry-to-the-path-variable-in-zsh

# freshshell
source ~/.fresh/build/shell.sh

# antigen
source ~/.antigen/antigen.zsh
antigen use oh-my-zsh
antigen-bundles <<EOBUNDLES
bundler
git
heroku
zsh-users/zsh-syntax-highlighting
EOBUNDLES
antigen-theme robbyrussell
antigen-apply

#history
export SAVEHIST=1000

# dirstack
DIRSTACKFILE="$HOME/.cache/zsh/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi
chpwd() {
    print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
  }
DIRSTACKSIZE=20

setopt autopushd pushdsilent pushdtohome

setopt pushdignoredups
setopt pushdminus

# paths
export PATH=$PATH:/usr/bin/site_perl/
export PATH=$PATH:/usr/bin/vendor_perl/
export PATH=$PATH:~/bin/

export PATH=~/.npm-global/bin:$PATH
export PATH=~/.gem/ruby/2.3.0/bin:$PATH

# exports
export EDITOR=vim

export M2_HOME=/opt/maven

# aliases
alias l='ls --almost-all -l --reverse -t'
alias qtip='gradle clean ear'
alias v='vim'
alias e='emacsclient -c -a emacs'
alias h='http --body --follow'
alias hh='http --headers'
alias gff='git pull --ff-only'
alias gp='git pull'

alias doc='docker-compose'

alias pryb="pry -e \"require 'bundler/setup'\""

# PROMPT HACK
export PS1='%{$fg_bold[red]%}$HOST%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

# fpath
fpath=(~/.zsh/completion $fpath)

autoload -U compinit
compinit

# java fonts
# export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=gasp' # <- herbstluftwm specific

# nvm
[[ -d ~/.nvm ]] && source ~/.nvm/nvm.sh

# rbenv
[[ -d ~/.rvm ]] && export PATH="$HOME/.rbenv/bin:$PATH" && eval "$(rbenv init -)"

# walkmod
[[ -d ~/src/walkmod-2.3.4 ]] && export WALKMOD_HOME="/home/$(whoami)/src/walkmod-2.3.4" &&
  export PATH="$PATH:$WALKMOD_HOME/bin"

# tmux
export DISABLE_AUTO_TITLE=true

# pretty colours
source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

# grrrr
export PACMAN=pacman

# rubygems
if which ruby >/dev/null && which gem >/dev/null; then
  PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi
