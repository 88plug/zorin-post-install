sudo apt-add-repository -y ppa:teejee2008/ppa ; apt-get update ; sudo apt-get install -y ukuu ; sudo ukuu --check ; sudo ukuu --install-latest --yes
sudo apt-get dist-upgrade -y
sudo add-apt-repository ppa:saiarcot895/chromium-dev -y
sudo apt-get update
echo "Chrome installed" >> installed.log
sudo add-apt-repository ppa:ubuntu-mozilla-daily/ppa -y
sudo apt-get update
sudo apt-get upgrade -y firefox
echo "Firefox installed" >> installed.log

echo -e "\nHidden=true\n" | sudo tee --append /etc/xdg/autostart/tracker-extract.desktop /etc/xdg/autostart/tracker-miner-apps.desktop /etc/xdg/autostart/tracker-miner-fs.desktop /etc/xdg/autostart/tracker-miner-user-guides.desktop /etc/xdg/autostart/tracker-store.desktop > /dev/null
gsettings set org.freedesktop.Tracker.Miner.Files crawling-interval -2
gsettings set org.freedesktop.Tracker.Miner.Files enable-monitors false
tracker reset --hard

#sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y
#sudo apt-get update
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install -y apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install -y sublime-text shutter xprintidle mplayer htop nano bmon iotop
echo "Shutter installed" >> installed.log
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) edge"
sudo apt-get update
sudo apt-get install -y docker-ce
echo "Docker installed" >> installed.log
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
sudo dpkg -i gitkraken-amd64.deb
echo "GitKraken installed" >> installed.log
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-3.1.0-amd64.deb
sudo dpkg -i slack-desktop-3.1.0-amd64.deb
echo "Slack installed" >> installed.log

sudo apt-get dist-upgrade -y

###NVIDIA
sudo apt-get install build-essential software-properties-common -y && \
sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y && sudo apt-get update && sudo apt-get install -y g++-7 gcc-7 && \
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 60 --slave /usr/bin/g++ g++ /usr/bin/g++-7 && \
sudo update-alternatives --config gcc
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.1.85-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1604_9.1.85-1_amd64.deb
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
sudo apt-get update
sudo apt-get install -y --allow-unauthenticated cuda-9-1
