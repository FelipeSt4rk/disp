#!/bin/bash

if [ -e /etc/pacman.conf ]
then
	sudo pacman -S perl --needed
elif [ -e /etc/apt ]
then
	sudo apt-get install perl
elif [ -e /etc/yum.conf ]
then
	sudo yum install perl perl-CPAN
else 
	echo "Your system is unsupported by this script"
	echo "Please install the dependencies manually"
	echo "open the terminal and type: sudo cpan install strict warnings Term::ANSIColor Net::SSLeay::Handle"
fi
sudo cpan install strict warnings Term::ANSIColor Net::SSLeay::Handle

if [ -e /usr/share/disp ]
then
	sudo rm -rf /usr/share/disp
fi

if [ -e /usr/bin/disp ]
then
	sudo rm /usr/bin/disp
fi

cd .. && sudo mv disp /usr/share/

sudo sh -c 'echo "#!/bin/bash" > /usr/bin/disp'
sudo sh -c 'echo "cd /usr/share/disp" >> /usr/bin/disp'
sudo sh -c 'echo "exec perl disp.pl $@" >> /usr/bin/disp'
sudo chmod +x /usr/bin/disp
