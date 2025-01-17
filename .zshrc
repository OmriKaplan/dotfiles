# Add homebrew to the path
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add Android platform tools to $PATH
android_sdk=${HOME}/Library/Android/sdk
path+=(${android_sdk}/platform-tools)
path+=(${android_sdk}/cmdline-tools/latest/lib/external/kotlin-plugin-ij/Kotlin)

# Use Android Studio embedded JRE as system JRE
export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jbr/Contents/Home

# Opt out of Homebrew analytics
export HOMEBREW_NO_ANALYTICS=1

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
fpath=(~/.zsh/completion $fpath)

autoload -Uz compinit && compinit

eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# Load gitstatus
source ~/.zsh/gitstatus/gitstatus.prompt.zsh

# Load autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Load syntax highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Fuzzy search history
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# Use `pushd` behavior on `cd`
setopt auto_pushd

# Add Poetry to path
path+=(${HOME}/.local/bin)

# Load Poetry completions
fpath+=~/.zfunc
autoload -Uz compinit && compinit


# Alias for creating notes in Notes dir
note() {
	vim ${HOME}/Documents/notes/$(date -Idate)-$1
}

# Add alias for dotfiles management
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
