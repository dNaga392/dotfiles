dotfiles
==========

This dotfiles is dot files package.

Installation
-------------

1. Clone this repository to user directory.

~/dotfiles

2. Create dot files to use there.

create dot files under user directory as followes:

* .gitconfig

```gitconfig
[include]
	# User info
	path = .gitconfig.user
	# .gitconfig
	path = ~/dotfiles/.gitconfig
```

* .gitconfig.user

code user info.

```gitconfig
[user]
	# user name
	name = hoge
	# user email
	email = hogefuga@gmail.com
```

* .vimrc

```vim
" .vimrc
source ~/dotfiles/.vimrc
```

* .gvimrc

```vim
" .gvimrc
source ~/dotfiles/.vimrc
```

