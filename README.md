# emacs_config
## Windows
1. Install emacs via website (download and extract zip file)
2. Copy .emacs file to AppData\Roaming
3. Run Emacs

## Linux
1. Install emacs 
2. In terminal open a new file: sudo nano ~/.emacs
3. Paste .emacs to that file
4. Run Emacs

Or autmated:
```bash
git clone git@github.com:lennertfranssens/emacs_config.git
config=$(cat emacs_config/REMOVE_BEFORE_DOT.emacs)
echo "${config}" > ~/.emacs
sudo rm -rf emacs_config
```
