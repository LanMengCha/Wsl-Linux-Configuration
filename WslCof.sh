echo "Kali_Wsl配置 && 安装脚本"
echo "国内源请自行更换.."
echo "测试apt..."
sudo apt -f install || echo "apt修复中..." sudo mv /var/lib/dpkg/info/ /var/lib/dpkg/info_old/ && sudo mkdir /var/lib/dpkg/info/ && sudo apt-get update && sudo apt-get -f install && sudo mv /var/lib/dpkg/info/* /var/lib/dpkg/info_old/ && sudo rm -rf /var/lib/dpkg/info && sudo mv /var/lib/dpkg/info_old/ /var/lib/dpkg/info &&  sudo apt -f install && sudo apt --fix-broken install && sudo apt-get update && echo "apt修复成功..."
echo "安装必备软件..."
sudo apt install g++ && sudo apt install python && sudo apt install wget && sudo apt install git && sudo apt install curl && sudo apt install vim
echo "安装Z Shell..."
sudo apt-get -y install zsh
echo "安装onmyzshzsh..."
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
echo "安装语法高亮插件..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
chsh -s /bin/zsh
echo '		         __                                     __'
echo '		  ____  / /_     ____ ___  __  __   ____  _____/ /_'
echo '		 / __ \/ __ \   / __ `__ \/ / / /  /_  / / ___/ __ \'
echo '		/ /_/ / / / /  / / / / / / /_/ /    / /_(__  ) / / /' 
echo '		\____/_/ /_/  /_/ /_/ /_/\__, /    /___/____/_/ /_/ '   
echo '		                        /____/                     '  
echo "全部安装完毕"
echo "请使用 “sudo vim ~/.zshrc”文件中更改ohmyzsh主题和插件列表,或在项目目录里找到.zshrc替换掉"
echo "接下来安装xfce4和vncserver软件包"
echo "若没用切换国内源则安装速度巨慢无比哦~~"
sudo apt-get install -y xfce4
sed -i 's$<listen>.*</listen>$<listen>tcp:host=localhost,port=0</listen>$' /etc/dbus-1/session.conf
echo "开始安装vncserver..."
sudo apt-get install -y vnc4server || sudo apt install -y tightvncserver
echo "vncserver安装完毕，请按找提示输入密码-确认密码"
echo "看不见密码显示是Linux的正常情况，退格键依然可用"
echo "y/n建议选择n"
vncserver
echo "继续配置，正在关闭vnc..."
sed -i 's$x-window-manager$xfce4-session$' ~/.vnc/xstartup
vncserver -kill :1
echo "开始安装ssh软件包..."
sudo apt-get install openssh-server
echo "安装完毕，请按照https://www.jianshu.com/p/bc38ed12da1d/中的教程继续配置ssh"
echo "安装thefuck工具"
sudo apt-get install python3-pip && sudo pip install thefuck
fuck
fuck
source ~/.zshrc
echo "感谢使用，建议重启一下"

