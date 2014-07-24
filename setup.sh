# DOT_FILES=( .vimrc .bashrc .vim .zshrc .gitconfig .tmux.conf .gvimrc)
DOT_FILES=( .vimrc .vim .zshrc .gvimrc)

for file in ${DOT_FILES[@]}

do
	if [ -a $HOME/$file ]; then
		ln -s $HOME/dotfiles/$file $HOME/$file.dot
			echo "ファイルが存在するので.dotファイル作ります: $file"
	else
		ln -s $HOME/dotfiles/$file $HOME/$file
			echo "シンボリックリンクを貼りました: $file"
	fi
done
