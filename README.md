## Install Android, Cordova, and Ionic Framework in Ubuntu 

[![Issues Ready](https://badge.waffle.io/driftyco/ionic.png?label=ready&title=Ready)](https://waffle.io/driftyco/ionic)  [![Circle CI](https://circleci.com/gh/alcholever/Ionic-Framework-in-Ubuntu?style=svg)](https://circleci.com/alcholever/Ionic-Framework-in-Ubuntu) 


![Ionic-Framework-in-Ubuntu](https://scontent-cdg2-1.xx.fbcdn.net/hphotos-xpt1/t31.0-0/p552x414/12307518_10204428266499922_607647992136099322_o.jpg)


After recognizing that I develop almost entirely on `Ubuntu`, a friend asked me how to properly set up an Ubuntu machine for `Ionic Framework` `Android development`.

![Ionic-Framework-in-Ubuntu-2](https://fbcdn-sphotos-e-a.akamaihd.net/hphotos-ak-xpa1/v/t1.0-9/11986433_10204428267379944_8325331746260730443_n.jpg?oh=9a9934ddfb62f4e20eeae907c7259303&oe=56D9CD0E&__gda__=1458352920_85cea1b7b1d2cab0b302318af7369834)

If you’re interested in Ionic Framework, you can `just download a convenient shell script` that I made. 
To install everything using the shell script I provided, download it and do the following:

```bash
$ chmod 775 ubuntu_ionic_installer.sh
```
     
```bash
$ sudo ./ubuntu_ionic_installer.sh
```
    

The above will make the script executable and then it will be installed using a privileged account.  Failing to use sudo will probably give you strange results.

The installation script will download and configure the following: 

  * Java JDK
  * Apache Ant
  * Android SDK
  * NodeJS / NPM
  * Apache Cordova
  * Ionic Framework
 
  
## Screenshot
![Ionic-Framework-in-Ubuntu-3](https://fbcdn-sphotos-a-a.akamaihd.net/hphotos-ak-xpt1/t31.0-8/p720x720/12307518_10204428275380144_2747337350250499513_o.jpg)

# Created by [Ugurcan Dede](http://twitter.com/alcholever)



### LICENSE

This script licensed under the MIT Open Source license. For more information, see the LICENSE file in this repository.
