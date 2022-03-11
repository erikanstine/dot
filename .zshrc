# ~/.zshrc

#    _______ _______ _______ _______
#   |\     /|\     /|\     /|\     /|
#   | +---+ | +---+ | +---+ | +---+ |
#   | |   | | |   | | |   | | |   | |
#   | |P  | | |A  | | |T  | | |H  | |
#   | +---+ | +---+ | +---+ | +---+ |
#   |/_____\|/_____\|/_____\|/_____\|

export PATH=~/bin:$PATH
export PATH=$PATH:/Users/eanstine/bin
export PATH=$PATH:/Users/eanstine/Library/Python/3.7/bin
export PATH="$HOME/plaid/go.git/bin:$PATH"
export PATH=$PATH:/usr/local/bin/pg_config
export PATH=$PATH:/Users/eanstine/go/bin

export GOPATH=/Users/eanstine/go
export GO111MODULE=on #go get -u golang.org/x/tools/cmd/goimports
export GOPROXY=https://proxy.golang.org
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# set machine specific secrets in ~/.plaid_env.bash
if [ -f ~/.plaid_env.bash ]; then
    . ~/.plaid_env.bash
fi

# set machine specific secrets in ~/.crawler_env.bash
if [ -f ~/.crawler_env.bash ]; then
    . ~/.crawler_env.bash
fi

# set machine specific secrets in ~/.secrets
if [ -f ~/.secrets.bash ]; then
    . ~/.secrets.bash
fi

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats ' %b '

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.git_config/git-completion.bash
fpath=(~/.git_config $fpath)

autoload -Uz compinit && compinit

# Enable substitution in the prompt.
setopt PROMPT_SUBST

# Set PROMPT
PROMPT='%* - %F{blue}%n:%F{red}[%f %~ %F{red}]
└─ %F{blue}(%F{black}%K{yellow}${vcs_info_msg_0_}%k%F{blue}) %F{red}>%F{yellow}>%F{green}>%f '

alias soz='source ~/.zshrc'

function preman() { man -t "$@" | open -f -a "Preview" ;}

function opj() { open https://jira.plaid.com/browse/FIDEVX-"$@" ;}

alias sr='brew services restart spotifyd'
alias g='git'
export WORKON_HOME=~/Envs
source /Users/eanstine/Library/Python/2.7/bin/virtualenvwrapper.sh

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
alias config='/usr/bin/git --git-dir=/Users/eanstine/.cfg/ --work-tree=/Users/eanstine'

