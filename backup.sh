  GNU nano 7.2                                             backup.sh                                                        
#!/bin/bash

cd /srv/samba/sara_201911129

if [ ! -d ".git" ]; then
  git init
  git remote add origin git@github.com:saraabufarha/sara_201911129.git
fi

git config --global --add safe.directory /srv/samba/sara_201911129

git add .

git commit -m "Backup on $(date +'%Y-%m-%d')"

git branch -M main

git push -u origin main >> "/var/log/backup.log" 2>&1
if [$? -eq 0 ]
then
echo " Not Successful " >> "/var/log/backup.log"
else
echo " Successful " >> "/var/log/backup.log"
fi

exit 0
