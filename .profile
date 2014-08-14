################################################################################
# Environment Variables
################################################################################

# PATH Configuration
PATH=$PATH:$HOME/bin
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PYTHONPATH=/usr/local/lib/python2.7/site-packages

# Default Editor
export EDITOR="atom"

################################################################################
# Prompt Configurations
################################################################################

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
BLUE=$(tput setaf 4)
BOLD=$(tput bold)
RESET=$(tput sgr0)

# Function to parse git status
function parse_git_dirty {
  if [ "$(git status 2> /dev/null | tail -n1)" != "nothing to commit, working directory clean" ] ; then
    tput setaf 1
    tput bold
  else
    tput setaf 2
    tput bold
  fi
}

# Function to parse branch
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1/"
}

function l_bracket {
  [[ "$(git branch --no-color 2> /dev/null)" != "" ]] && echo "<"
}

function r_bracket {
  [[ "$(git branch --no-color 2> /dev/null)" != "" ]] && echo ">"
}

# Chomp long directory path
function dir_chomp () {
  local IFS=/ c=1 n d
  local p=(${1/#$HOME/\~}) r=${p[*]}
  local s=${#r}
  while ((s>$2&&c<${#p[*]}-1))
  do
    d=${p[c]}
    n=1;[[ $d = .* ]]&&n=2
    ((s-=${#d}-n))
    p[c++]=${d:0:n}
  done
  echo "${p[*]}"
}

# Function to set the display prompt (to get around line wrap issues in bash for color prompts)
function set_prompt {
  PS1='\[${GREEN}${BOLD}\]\u@\h\[${RESET}\]:\[${BLUE}${BOLD}\]$(dir_chomp "$(pwd)" 20)\[${RESET}\]$(l_bracket)\[$(parse_git_dirty)\]$(parse_git_branch)\[${RESET}\]$(r_bracket)\$ '
}

PROMPT_COMMAND=set_prompt

################################################################################
# Command Aliases
################################################################################
alias ls='ls -h'
alias ll='ls -lv --group-directories-first'
alias la='ll -A'
alias lm='ll | more'

# Shortcut to building.ai project directory
alias ba='cd $HOME/Projects/building.ai'
alias ap='cd $HOME/Projects/apollo'
alias www='cd $HOME/Projects/www'


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
