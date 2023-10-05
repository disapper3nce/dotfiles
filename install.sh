#! /bin/dash
read -p 'install program? ' cock
if [ "$cock" != "${cock#[Yy]}" ] ;then
mv irc/* $HOME
else
  echo "aborted by user, exiting" ; sleep 0.3
fi

