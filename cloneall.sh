exec `cp ~/.bashrc ./bashrc`
exec `cp -r ~/.config/redshift.conf ./config/redshift.conf`
exec `cp -r ~/.config/sublime-text-3/ ./config/sublime-text-3/`
exec `git add *`
exec `git commit -m "auto"`
exec `git push origin master`