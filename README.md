# Debian-i3-Setup
## 1. Debian installation
	-> Debian 13.05.0
	-> Language: English
	-> Location: Europe, Germany
	-> Language Settings: US
	-> Keymap: German

	-> Hostname: Sinkpad 😂
	-> Host Domain: speedport.ip (My Homerouters local domain)
	-> Leave root password empty so the initial admin privileges will go to my own user

	-> As I use debian besides my windows school installation i will manually partition my ssd.
		-> Seperate /home partition

	-> German mirror
		-> deb.debian.org

	-> No desktop environment
	-> Standard system utilities

## 2. i3 installation
	-> X-Server installation (Handles Video, Mouse, Keyboard stuff)
		`apt install xorg`

	-> i3-Server installation(requires a X-Server)
		`apt install i3`

	-> display manager installation (to automatically start xorg and to show a visual login screen)
		`apt install lightdm`

=> Everything else is found either in the uploaded config files or will be written down below

## 3. i3 / debian configuration
	-> `apt install git`
		-> `git config --global --edit`
			-> Name: Nico, Email: nico@sinkpad.local
	-> `apt install gh` (Github Client)

	-> In root folder `git clone <this repo>`
	-> I move every config file to this folder or if already happend i delete them
	-> I create a link for every moved config file 
		`ln -s ~/Debian-i3-Setup/Configs/i3 ~/.config/i3`

### i3 Status Bar setup
	1. `mkdir ~/.config/i3status`
	2. `ln -s ~/Debian-i3-Setup/Configs/i3status/* ~/.config/i3status/`

### Change Wallpaper
	-> `apt install nitrogen`
		-> Add wallpaper folder ~/Pictures/Wallpapers

### Display setup


### Audio setup (The most anoying thing in existens)
	I use 1 monitor with audio via hdmi/dp, my internal laptop speakers, my jack hadphones, and sometimes a bluetooth speaker.

	#### STEP 1:
		1.1 `apt install pipewire-audio wireplumber`
		1.2 `systemctl --user enable --now pipewire wireplumber`
		1.3 `apt install firmware-sof-signed firmware-linux-nonfree` (Intel audio drivers)
	
	### STEP 2:
		2.1 `apt install alsa-utils` (alsamixer)
		---
		2.2.1 Open alsamixer
		2.2.2 Press f6 and select correct audio codec (Realtek)
		2.2.3 Unmute everything
		2.2.4 Select auto-mute and disable it
		2.2.5 Press escape to exit

	1--- Maybe not required anymore, audio setup is work in progress rn
	### STEP 3 ("No I dont want to disable my speakers when also using headphone jack!"):
		3.1 `mkdir -p ~/.config/wireplumber/wireplumber.conf.d/`
		3.2 `ln -s ~/Debian-i3-Setup/Configs/Wireplumber/99-ignore-jack.conf ~/.config/wireplumber/wireplumber.conf.d/`
		---
		3.3.1 Open hdajackretask as root
		3.3.2 Select correct audio codes (Realtek)
		3.3.3 Check "Show unconnected pins"
		3.3.4 Find internal speaker and check override
		3.3.5 Click "Apply now" then "Install boot override"
		---
		3.4 `systemctl --user restart pipewire wireplumber`
	1---

	### STEP 4:
		4.1 `apt install pavucontrol`
		4.1.1 Click on "Configuration" 
		4.1.2 Set "Built-in Audio" to "Pro Audio"

---

## 4. Software installation
	- Browser(Firefox): `apt install firefox-esr`

	- Password Manager(Bitwarden): 
		1 `wget -O bitwarden.deb "https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://bitwarden.com/download/%3Fapp%3Ddesktop%26platform%3Dlinux%26variant%3Ddeb&ved=2ahUKEwjaxsq2t92VAxVkQvEDHd_RH18QFnoECA4QAQ&usg=AOvVaw3xLFvdu0SraodYpFH40PxU"`
		2 `apt install ./bitwarden.deb`

	- Terminal(Alacritty): `apt install alacritty`
		-> New themes(Currently in use is "linux"): https://github.com/alacritty/alacritty-theme
		1 `mkdir ~/.config/alacritty`
		2 `ln -s ~/Debian-i3-Setup/Configs/Alacritty/* ~/.config/alacritty/`

	- Displaymanager(Arandr): `apt install arandr`

	- Filemanager(Thunar): `apt install thunar`

	- Programlauncher(Rofi): `apt install rofi`
		-> New themes(Currently in use rounded-gray-dark): https://github.com/newmanls/rofi-themes-collection/tree/master
		1 `mkdir /usr/share/rofi/themes`
		2 `sudo ln -s ~/Debian-i3-Setup/Configs/Rofi/Themes/* /usr/share/rofi/themes/`

	- Code & Default Text Editor(Visual Studio): 
		1 `wget -O vs_code.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"`
		2 `apt install ./vs_code.deb`

	- Encryption(VeraCrypt(To access my encrypted devices)): download deb from veracrypt website
		1 `wget -O veracrypt.deb "https://launchpad.net/veracrypt/trunk/1.26.29/+download/veracrypt-1.26.29-Debian-13-amd64.deb"`
		2 `apt install ./veracrypt.deb`
	
	- Hardwaremonitor(HTOP): `apt install htop`
	
	### All in one (Use in Downloads folder)
	`wget -O vs_code.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" && wget -O veracrypt.deb "https://launchpad.net/veracrypt/trunk/1.26.29/+download/veracrypt-1.26.29-Debian-13-amd64.deb" && wget -O bitwarden.deb "https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://bitwarden.com/download/%3Fapp%3Ddesktop%26platform%3Dlinux%26variant%3Ddeb&ved=2ahUKEwjaxsq2t92VAxVkQvEDHd_RH18QFnoECA4QAQ&usg=AOvVaw3xLFvdu0SraodYpFH40PxU" && sudo apt install -y firefox-esr alacritty arandr thunar rofi ./vs_code.deb ./veracrypt.deb ./bitwarden.deb htop`

---