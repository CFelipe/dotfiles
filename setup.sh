current_dir=$(pwd)
script_dir=$(dirname $0)

if [ $script_dir = '.' ]
then
script_dir="$current_dir"
fi

echo "${script_dir}"

rm $HOME/.gitconfig
rm $HOME/.gitignore_global
rm $HOME/.tmux.conf
rm $HOME/.tmux-osx.conf
rm $HOME/.vim/vimrc
rm $HOME/.zshrc

ln -s ${script_dir}/gitconfig $HOME/.gitconfig
ln -s ${script_dir}/gitignore_global $HOME/.gitignore_global
ln -s ${script_dir}/tmux.conf $HOME/.tmux.conf
ln -s ${script_dir}/tmux-osx-conf $HOME/.tmux-osx.conf
ln -s ${script_dir}/vimrc $HOME/.vim/vimrc
ln -s ${script_dir}/zshrc $HOME/.zshrc
