# Dynamicipuploader

It's just a simple dynamic ip uploader which you can use over github since some ISPs charge for static ip.
To get rid of webscrapers, I used gpg to encrypt the ip address so that even if you initial private repo is targeted, your ip address won't get leaked.

For both scripts I used bash so that the decrypt script could be used on termux too since your phone usually is the only access.

Also make sure you have both ssh key and gpg secret key on your phone for decryption.
