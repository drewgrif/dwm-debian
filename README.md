dwm installion using shell script

works great with Debian Stable

script uses NO patches

==============================

These files were originally used during my personal dwm phase but then modified to supplement my [youtube video](https://youtu.be/ksz-PPKPnz0) on the subject.

```
sudo apt install git

git clone https://github.com/drewgrif/dwm-debian

cd dwm-debian

./install.sh (includes nerdfonts.sh unless commented)
```

==============================

The .bashrc is simple and current (2/21/2023)

The .local/share/dwm is used if dwm is patched using **autostart** 
[https://dwm.suckless.org/patches/autostart/](https://dwm.suckless.org/patches/autostart/)

