# Command helper
## It helps you to find note or tip you made
## You just have to make text file in the same folder where cmd.sh is located 
## cmd.sh will find the file list and print out the text files 
## Which makes it easier to find command in linux terminal

## Setup
### git pull git@github.com:jwkang/clihelper.git
### cp -r clihelper ~/command
### vim ~/.bashrc
#### add the script below 
#### PATH=$PATH:/home/${USER}/command

## Usage
cmd android
cmd list
cmd etc

