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
		`ln -s ~/Debian-i3-Setup/Configs/Alacritty ~/.config/alacritty`
		`ln -s ~/Debian-i3-Setup/Configs/Rofi ~/.config/rofi`

### Change Wallpaper
	-> `apt install nitrogen`
		-> Add wallpaper folder ~/Pictures/Wallpapers

### Audio setup (The most anoying thing in existens)
	I use 1 monitor with audio via hdmi/dp, my internal laptop speakers, my jack hadphones, and sometimes a bluetooth speaker.

	#### STEP 1:
		1.1 `apt install pipewire-audio wireplumber`
		1.2 `systemctl --user enable --now pipewire wireplumber
		1.3 `apt install firmware-sof-signed firmware-linux-nonfree` (Intel audio drivers)
	
	### STEP 2:
		2.1 `apt install alsa-utils` (alsamixer)
		---
		2.2.1 Open alsamixer
		2.2.2 Press f6 and select correct audio codec (Realtek)
		2.2.3 Unmute everything
		2.2.4 Select auto-mute and disable it
		2.2.5 Press escape to exit

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

	### STEP 4:
		4.1 `apt install pavucontrol`
		4.1.1 Click on "Configuration" 
		4.1.2 Set "Built-in Audio" to "Pro Audio"




## 4. Software installation
	-> `apt install firefox-esr`

	-> Bitwarden: download deb from website
		-> `apt install ./bitwarden.deb`

	-> Terminal: `apt install alacritty`

	-> Monitor Software: `apt install arandr`

	-> Filemanager: `Thunar`

	-> Program Launcher: `apt install rofi`

	-> Visual Studio(Code & Default Text Editor): download deb from vs code website
		-> `apt install ./code.deb`
