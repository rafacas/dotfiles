export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Some environment defaults
export EDITOR=vim
export PAGER=less
export TERM=xterm-256color

# packer
export PACKER_CACHE_DIR=$HOME/packer_cache/

# go
export GOPATH=$HOME/projects/gocode
export PATH=$PATH:$GOPATH/bin

# perlbrew
if [ -f ~/perl5/perlbrew/etc/bashrc ]; then
  source ~/perl5/perlbrew/etc/bashrc
  # speed up perlbrew with test parallelism
  # http://www.modernperlbooks.com/mt/2012/01/speed-up-perlbrew-with-test-parallelism.html
  TEST_JOBS=9
fi

# chruby
if [ -f /usr/local/opt/chruby/share/chruby/chruby.sh ]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
fi

if [ -f /usr/local/opt/chruby/share/chruby/auto.sh ]; then
  # to enable auto-switching of rubies specified by .ruby-version files
  source /usr/local/opt/chruby/share/chruby/auto.sh
fi

# aliases
alias tmux='tmux -2' # -2 Force tmux to assume the terminal supports 256 colors.
alias ls='ls -G'
alias ll='ls -l'
alias la='ls -a'

