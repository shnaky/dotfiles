# run script with admin privileges (or with sudo if it's installed)
# symlink nvim
echo "creating symlink from '$env:HOMEPATH\dotfiles\nvim' to '$env:LOCALAPPDATA'"

New-Item -ItemType SymbolicLink -Path "$env:LOCALAPPDATA\nvim" -Target "$env:HOMEPATH\dotfiles\nvim\"

echo "done!"

