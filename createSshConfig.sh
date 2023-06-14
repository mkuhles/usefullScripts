#!/bin/sh
echo "Zum Einfügen bei Putty als Client .... Bei Cygwin: Shift + Einfg"
echo "Bitte den Seitennamen eingeben"
read ftpsitename
echo "Bitte die IP oder domain eingeben"
read ip
echo "Bitte den Benutzer eingeben"
read user
echo "Bitte den SSH Port eingeben, allgemeiner Standardport 22"
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
