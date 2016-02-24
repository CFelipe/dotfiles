ZSH=$HOME/.oh-my-zsh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

ZSH_THEME="robbyrussell"

plugins=(git, zsh-syntax-highlighting)

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/.cabal/bin:/opt/X11/bin:/usr/texbin"
export EDITOR='vim'

source $ZSH/oh-my-zsh.sh
source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

echo "# todo"
cat ~/Dropbox/org/todo.markdown
echo ""
