echo  "\033[1;31m                    _         _       ____  __              _  _     ___        _ _____ " && \
echo  "\033[1;32m  /\\/\\   __ _ _ __ | |_ _ __ | |__   / __ \\/ _\\       /\\  /\\ || |   / __\\ /\\ /\\/ |___ / " && \
echo  "\033[1;33m /    \\ / _\` | '_ \\| __| '_ \\| '_ \\ / / _\` \\ \\ _____ / /_/ / || |_ / /   / //_/| | |_ \\ " && \
echo  "\033[1;34m/ /\\/\\ \\ (_| | |_) | |_| | | | | | | | (_| |\\ \\_____/ __  /|__   _/ /___/ __ \\ | |___) |" && \
echo  "\033[1;35m\\/    \\/\\__,_| .__/ \\__|_| |_|_| |_\\ \\__,_\\__/     \\/ /_/    |_| \\____/\\/  \\/ |_|____/ " && \
echo  "\033[1;36m             |_|                     \\____/                                             " && \
echo  "\033[0m"
echo "[-] Prepare to delete the Chameleon image."
sudo docker rmi -f chameleon
echo "[*] Done...."
