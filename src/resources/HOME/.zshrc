# Powerlevel10K instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# setting geany and intellij terminal theme to starship and kitty to powerlevel10k
if [[ "$(ps -o comm= -p $PPID)" = "geany" || "$(ps -o comm= -p $PPID)" = "java" ]]; then
    eval "$(starship init zsh --print-full-init)"
else
    ZSH_THEME="powerlevel10k/powerlevel10k"
    [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# texlive-full
export MANPATH="/home/inbetween/.cache/yay/texlive-full/pkg/texlive-full/opt/texlive/2023/texmf-dist/doc/man:$MANPATH"
export INFOPATH="/home/inbetween/.cache/yay/texlive-full/pkg/texlive-full/opt/texlive/2023/texmf-dist/doc/info:$INFOPATH"
export PATH="/home/inbetween/.cache/yay/texlive-full/pkg/texlive-full/opt/texlive/2023/bin/x86_64-linux:$PATH"

# smlnj path
export PATH=/usr/local/smlnj/bin:"$PATH"

# omz update frequency
zstyle ':omz:update' frequency 6

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(
  git
	zsh-autosuggestions
	sudo
	web-search
	copyfile
  copybuffer
	z
 # F-sy-h
  zsh-syntax-highlighting
)

### AUTOPAIR PLUGIN ###
if [[ ! -d ~/.zsh-autopair ]]; then
  git clone https://github.com/hlissner/zsh-autopair ~/.zsh-autopair
fi
source ~/.zsh-autopair/autopair.zsh
autopair-init


# loads the zsh into the shell
source $ZSH/oh-my-zsh.sh


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


### Custom ALIASES ###

alias lol="yay | lolcat"
alias uwu="lol"
alias pow="poweroff"
alias neofetch="neofetch | lolcat"
alias t="thunar & disown"
alias gn="geany"
alias date="date | lolcat"
alias speedtest++="speedtest++ | lolcat"
alias SpeedTest="SpeedTest | lolcat"
alias yt="bash ~/.config/mpv/scripts/play-yt.sh"
alias bt_start="sudo systemctl start bluetooth"
alias unimatrix="unimatrix | lolcat"
alias backup="printf 'unimplemented' | lolcat"
alias l="exa -lah"
alias ll="l | lolcat"
alias df="duf | lolcat"
alias wofi-beats="bash ~/.config/hypr/scripts/wofi-beats"

### Custom FUNCTIONS ###

# piping all yay output to lolcat
function yay_() {
  command yay "$@" | lolcat
}

# running xdg-open in background and disowning it
function o() {
  command xdg-open "$@" & disown
}

# piping all gping output to lolcat
function ping() {
  command gping "$@" | lolcat
}

eval $(thefuck --alias)