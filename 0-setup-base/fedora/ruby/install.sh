#!/usr/bin/env bash
# Install rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
~/.rbenv/bin/rbenv init
# Apply rbenv immediately
source ~/.bashrc
# Install Ruby Build as rbenv plugin
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
# Install Ruby and apply as default env
RUBY_VERSION=3.3.3
rbenv install $RUBY_VERSION
rbenv global $RUBY_VERSION
# Install sqlite and rails
./install_sqlite.sh
./install_rails.sh