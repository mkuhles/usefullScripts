#!/bin/sh
echo "Zum Einfügen bei Putty als Client .... Bei Cygwin: Shift + Einfg"
echo "Bitte den FTP Seitennamen eingeben, wie in /webmaster vermerkt, e.g. verband2.helios-media.com"
read ftpsitename
echo "Bitte die IP eingeben, wie in /webmaster vermerkt, e.g. 78.46.125.31 oder carlos"
read ip
echo "Bitte den Benutzer eingeben, e.g. repadmin"
read user
echo "Bitte den SSH Port eingeben bei Hetzner 222, allgemeiner Standardport 22"
read port
cd $HOME/.ssh/
ssh-keygen -N '' -f "$ftpsitename"

if [ ! -f $HOME/.ssh/config ]
   then
   touch $HOME/.ssh/config
fi

echo "
Host $ftpsitename
    Hostname "$ip"
    User "$user"
    Port "$port"
    IdentityFile $HOME/.ssh/"$ftpsitename"
    ForwardAgent yes
" >> $HOME/.ssh/config

ssh-copy-id -i $HOME/.ssh/"$ftpsitename" $ftpsitename


echo "
Ab jetzt kannst du ssh $ftpsitename eingeben. Oder auch sftp $ftpsitename . Tab zum Vervollstaendigen."
