################################################################################
# Environment Variables
################################################################################

# PATH Configuration
PATH=$PATH:$HOME/bin
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PYTHONPATH=/usr/local/lib/python2.7/site-packages

# Default Editor
export EDITOR="subl"

################################################################################
# Prompt Configurations
################################################################################

# Function to parse git status
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo -e "\033[1;31m"
}

# Function to parse branch
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\<$(printf '\033[1;32m')$(parse_git_dirty)\1$(printf '\033[00m')\>/"
}

# Function to set the display prompt (to get around line wrap issues in bash for color prompts)
function set_prompt {
  PS1='\[\e[01;32m\]\u@\h\[\e[00m\]:\[\e[01;34m\]\w\[\e[00m\]\[$(parse_git_branch)\]\[\e[00m\]\$ '
}

PROMPT_COMMAND=set_prompt

################################################################################
# Command Aliases
################################################################################
alias ls='gls -h --color'
alias ll='ls -lv --group-directories-first'
alias la='ll -A'
alias lm='ll | more'

# Shortcut to building.ai project directory
alias ba='cd $HOME/Projects/building.ai'
alias www='cd $HOME/Projects/www'
