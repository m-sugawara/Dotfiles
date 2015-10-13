# MyVimrc
vimrc setting

## Usage
1. clone neobundle.vim  
  
```
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
```
  
2. setting or clone .vimrc
  
3. open vim and `:NeoBundleInstall`  
  
###Option

####-bash: vim: command not found

```
# yum -y install vim-enhanced
```

####if you'd like to change command vi to use vim
  
vim ~/.bashrc  
  
add this

```
alias vi='vim'
```
  
source .bashrc  
  
