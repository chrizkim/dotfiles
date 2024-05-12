set fish_greeting


### Configure Homebrew

test -x /usr/local/bin/brew; and /usr/local/bin/brew shellenv | source
test -x /opt/homebrew/bin/brew; and /opt/homebrew/bin/brew shellenv | source


### Custom environment variables

set -x EDITOR (brew --prefix)/bin/nvim
set -x PYENV_ROOT "$HOME/.pyenv"
set -x NODENV_ROOT "$HOME/.nodenv"
set -x RBENV_ROOT "$HOME/.rbenv"
set -x GOENV_ROOT "$HOME/.goenv"
set -x GOENV_GOPATH_PREFIX "$HOME/.go"


### Configure pyenv, virtualenv, nodenv, rbenv, and goenv

status --is-interactive; and \
  pyenv init - | source; and \
  pyenv virtualenv-init - | source; and \
  nodenv init - | source; and \
  rbenv init - fish | source; and \
  goenv init - | source


### Aliases

alias cdp="cd (pwd -P)"

alias k="kubectl"
alias tf="terraform"

alias tree="tree -CA"
alias ag="ag --skip-vcs-ignores"

alias vi="nvim"
alias vim="nvim"
alias vimdiff="nvim -d"
alias :q="exit"

alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."
alias ........="cd ../../../../../../.."


### Additionals to $PATH

if [ -d "$HOME/.sdkman/candidates" ]
  for d in (find ~/.sdkman/candidates -type d -mindepth 1 -maxdepth 1)
    fish_add_path "$d/current/bin"
  end
end

fish_add_path $HOME/.tfswitch
fish_add_path $HOME/.docker/bin
fish_add_path ./node_modules/.bin

fish_add_path $HOME/.local/bin
fish_add_path $HOME/.bin
