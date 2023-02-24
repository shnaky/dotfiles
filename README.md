# Dotfiles

**Terminal emulator**: [Alacritty](https://github.com/alacritty/alacritty)

**Text editor**: [NeoVim](https://github.com/neovim/neovim)

## Windows

### Windows Terminal

If you are using **Windows Terminal**, note that it's default configurations might override some of Neovims keymaps,
making Neovim behave differently than on Linux. For example, in Neovim **Ctrl-V** puts you into **Visual-Block**,
however this command is overwritten by the Windows Terminal defualt configuration to work as **Paste**.
To change it you'll have to go to the **settings.json** (Windows Terminal configuration file) and change

```json
{
  "command": "paste",
  "keys": "ctrl+v"
}
```
to

```json
{
  "command": "paste",
  "keys": "ctrl+shift+v"
}
```
Also be aware of Neovim's **behave** command for how your mouse should work and the **mswin.vim** file.
