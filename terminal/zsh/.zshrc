export DOTFILES_PATH=$HOME/.dotfiles
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
source ${ZIM_HOME}/init.zsh

# Overwrite zim non extensible configuration

# Removing the waiting dots from completion (...). Original: ~/.zim/modules/input/init.zsh
expand-or-complete-with-redisplay() {
  zle expand-or-complete
  zle redisplay
}

# Fuzzy Autocompletion
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:approximate:*' max-errors 3 numeric
zstyle ':completion:*' matcher-list 'm:{a-z}={  A-Z}' # match upper from lower case

source $DOTFILES_PATH/terminal/init.sh

fpath=(/${ZDOTDIR:-${DOTFILES_PATH}}/terminal/zsh/themes $fpath)

autoload -Uz promptinit && promptinit
prompt rafa

# iTerm tab name
precmd() {
  echo -ne "\e]1;$(short_pwd)\a"
}

source $DOTFILES_PATH/terminal/zsh/key-bindings.zsh
