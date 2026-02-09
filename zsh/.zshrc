[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
plug "rkh/zsh-jj"

autoload -U colors && colors

zstyle ':vcs_info:git:*' formats '(%b) '
zstyle ':vcs_info:jj:*' formats '(%b) '

autoload -Uz vcs_info
precmd() { vcs_info }

PROMPT='%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ ) % %{$fg[cyan]%}%1~ %{$fg[green]%}${vcs_info_msg_0_}%{$reset_color%}'

autoload -Uz compinit
compinit

ci() {
  claude -p "$1" | bat -l md
}
# Aliases
alias ls="eza"
alias v="nvim"
alias fs="yazi"
alias cc="claude"
alias oc="opencode"
alias tx="tmux"

alias -g NE="2>/dev/null"
alias -g DN="> /dev/null"
alias -g NUL=">/dev/null 2>&1"
alias -g JQ=" | jq"
alias -g C=" | pbcopy"

alias -s go="$EDITOR"
alias -s mod="$EDITOR"
alias -s js="$EDITOR"
alias -s ts="$EDITOR"
alias -s tsx="$EDITOR"
alias -s jsx="$EDITOR"
alias -s ex="$EDITOR"
alias -s exs="$EDITOR"
alias -s rs="$EDITOR"
alias -s glsl="$EDITOR"
alias -s vert="$EDITOR"
alias -s frag="$EDITOR"
alias -s md="bat"
alias -s mdx="$EDITOR"
alias -s txt="$EDITOR"
alias -s py="$EDITOR"
alias -s lua="$EDITOR"
alias -s sh="$EDITOR"
alias -s json="jless"
alias -s conf="$EDITOR"
alias -s yaml="bat -l yaml"
alias -s yml="bat -l yaml"
alias -s toml="bat -l toml"
alias -s mp4="open"
alias -s mov="open"
alias -s png="open"
alias -s webp="open"
alias -s jpg="open"
alias -s jpeg="open"

alias exs_left='displayplacer "id:1E4992DD-DA43-4DA2-8615-AB9A698F47BC res:2560x1440 hz:144 color_depth:8 scaling:off origin:(0,0) degree:0" "id:37D8832A-2D66-02CA-B9F7-8F30A301B230 res:1800x1169 hz:120 color_depth:8 scaling:on origin:(-1800,271) degree:0"'
alias exs_top='displayplacer "id:37D8832A-2D66-02CA-B9F7-8F30A301B230 res:1800x1169 hz:120 color_depth:8 scaling:on origin:(0,0) degree:0" "id:1E4992DD-DA43-4DA2-8615-AB9A698F47BC res:2560x1440 hz:144 color_depth:8 scaling:off origin:(-380,-1440) degree:0"'

setopt vi

set zle_bracketed_paste

# Exports
export EDITOR="nvim"

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Carapace
export CARAPACE_BRIDGES="zsh,fish,bash,inshellisense"
zstyle ":completion:*" format $"\e[2;37mCompleting %d\e[m"
source <(carapace _carapace)

# Zoxide
eval "$(zoxide init zsh)"


# bun completions
[ -s "/Users/aldous/.bun/_bun" ] && source "/Users/aldous/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/opt/homebrew/opt/dotnet@8/bin:$PATH"
export DOTNET_ROOT="/opt/homebrew/opt/dotnet@8/libexec"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/Users/aldous/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/Users/aldous/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

export PATH="$PATH:$HOME/.local/bin"
export PATH="$HOME/.local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"

# pnpm
export PNPM_HOME="/Users/aldous/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Added by Antigravity
export PATH="/Users/aldous/.antigravity/antigravity/bin:$PATH"
