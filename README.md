# Personal dotfiles

Inspired by the instructions in [Using GNU Stow to manage your dotfiles](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html).

## Requirements

[GNU Stow](https://www.gnu.org/software/stow/) or some patience to symlink files
manually.

## Usage

```bash
git clone https://github.com/PedroArvela/dotfiles.git
cd dotfiles
stow -t ~ <configuration package>
```
