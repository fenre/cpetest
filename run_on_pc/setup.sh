#Oppdater apt
sudo apt update

#Installer softwarepakker
sudo apt install screen iperf3 wireshark vim mate tmux openssh-server git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev s
qlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

#Flytt lokasjon til brukerens hjemmemappe
cd

#Last ned og installer rbenv (Ruby)
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

#Installer Ruby
rbenv install -v 2.3.3
rbenv global 2.3.3
ruby -v
gem install bundler