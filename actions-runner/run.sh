#!/bin/bash

npm --version
node --version

#sudo rm -rf /usr/local/sfdx
#sudo rm -rf /usr/local/lib/sfdx
#sudo rm -rf /usr/local/bin/sfdx
#sudo rm -rf ~/.local/share/sfdx ~/.config/sfdx ~/.cache/sfdx
#sudo rm -rf ~/Library/Caches/sfdx
#sudo rm -rf /usr/local/sf
#sudo rm -rf /usr/local/bin/sf
#sudo npm cache clean -f
#sudo npm install -g n --save
#sudo n 16.13.1
#echo "Node Version"
#node --version

#sfdx update
#sfdx --version

#sfdx plugins:uninstall sfdx-git-delta

npm install sfdx-cli --global --save
echo "sfdx Version"
sfdx --version

echo "Installing delta"
sudo sfdx plugins:install sfdx-git-delta@latest -g --save
echo "Installed delta"

sfdx sgd:source:delta --help

# Validate not sudo
user_id=`id -u`
if [ $user_id -eq 0 -a -z "$RUNNER_ALLOW_RUNASROOT" ]; then
    echo "Must not run interactively with sudo"
    exit 1
fi

# Change directory to the script root directory
# https://stackoverflow.com/questions/59895/getting-the-source-directory-of-a-bash-script-from-within
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

# Do not "cd $DIR". For localRun, the current directory is expected to be the repo location on disk.

# Run
shopt -s nocasematch
if [[ "$1" == "localRun" ]]; then
    "$DIR"/bin/Runner.Listener $*
else
    "$DIR"/bin/Runner.Listener run $*

# Return code 3 means the run once runner received an update message.
# Sleep 5 seconds to wait for the update process finish
    returnCode=$?
    if [[ $returnCode == 3 ]]; then
        if [ ! -x "$(command -v sleep)" ]; then
            if [ ! -x "$(command -v ping)" ]; then
                COUNT="0"
                while [[ $COUNT != 5000 ]]; do
                    echo "SLEEP" > /dev/null
                    COUNT=$[$COUNT+1]
                done
            else
                ping -c 5 127.0.0.1 > /dev/null
            fi
        else
            sleep 5
        fi
    elif [[ $returnCode == 4 ]]; then
        if [ ! -x "$(command -v sleep)" ]; then
            if [ ! -x "$(command -v ping)" ]; then
                COUNT="0"
                while [[ $COUNT != 5000 ]]; do
                    echo "SLEEP" > /dev/null
                    COUNT=$[$COUNT+1]
                done
            else
                ping -c 5 127.0.0.1 > /dev/null
            fi
        else
            sleep 5
        fi
        "$DIR"/bin/Runner.Listener run $*
    else
        exit $returnCode
    fi
fi
