# Choosing between .bashrc, .profile, .bash_profile, etc [https://superuser.com/questions/789448/choosing-between-bashrc-profile-bash-profile-etc]
    # - ~/.bash_profile should be super-simple and just load .profile and .bashrc (in that order)
    # - ~/.profile has the stuff NOT specifically related to bash, such as environment variables (PATH and friends)
    # - ~/.bashrc has anything you'd want at an interactive command line. Command prompt, EDITOR variable, bash aliases for my use
# A few other notes:
    # - Anything that should be available to graphical applications OR to sh (or bash invoked as sh) MUST be in ~/.profile
    # - ~/.bashrc must not output anything
    # - Anything that should be available only to login shells should go in ~/.profile
    # - Ensure that ~/.bash_login does not exist.


# --- file-creation mask: 
#    (full access for group is not a problem, because
#    every user has his own private group dlr_<user>_p)
# rwxrwxr-x
umask 002

# --- additional architecture environment variables
#export DLRRM_HOST_PLATFORM="osl42-x86_64" 
if test -f "/home/seid_da/.profile_local"; then
    source "/home/seid_da/.profile_local"
fi
#export OBJ_PATH=$DLRRM_HOST_PLATFORM
#export ARCH=$DLRRM_HOST_PLATFORM

# --- locale settings variable
export LC_TIME="de_DE.UTF-8"

# --- local scripts
export PATH=/home/seid_da/usr/bin:$PATH

# --- ff/tb
#export PATH=/home/seid_da/packages/firefox-lin:$PATH
#export PATH=/home/seid_da/packages/thunderbird-lin:$PATH


# --- Pip etc
#export PATH=$HOME/.local/bin:$PATH
#export PYTHONPATH=~/.local/lib/python2.7/site-packages:$PYTHONPATH

# --- openjdk temporarily
#export PATH=/automount_offline/rmnfs01/gpfs/sw/openjdk:$PATH
#export PATH=~/packages/openjdk/bin:$PATH


# vtk python for mayavi
#export LD_LIBRARY_PATH=/volume/software/common/packages/vtk/6.3.0/lib/:$PYTHONPATH
#export PYTHONPATH=/volume/software/common/packages/vtk/6.3.0/python/osl42-x86_64:$PYTHONPATH
#export PYTHONPATH=/volume/software/common/packages/vtk/6.3.0/python/osl42-x86_64/vtk:$PYTHONPATH

#export LD_LIBRARY_PATH=/home/seid_da/packages/vtk/osl42-x86_64/lib/:$PYTHONPATH
#export PYTHONPATH=/home/seid_da/packages/vtk/osl42-x86_64/lib/python2.7/site-packages:$PYTHONPATH
#export PYTHONPATH=/home/seid_da/packages/vtk/osl42-x86_64/lib/python2.7/site-packages/vtk:$PYTHONPATH

# --- PyBrain / sklearn
#export PYTHONPATH=$PYTHONPATH:/home/seid_da/packages/pybrain
#export PYTHONPATH=$PYTHONPATH:/home/seid_da/packages/scikit-learn



#[[ $- == *i* ]] && echo 'Interactive' || echo 'Not interactive'
#shopt -q login_shell && echo 'Login shell' || echo 'Not login shell'

#if [ "$DLRRM_HOST_PLATFORM" = "osl154-x86_64" ] || [ "$DLRRM_HOST_PLATFORM" = "osl154-x86_64" ];
#if [[ "$DLRRM_HOST_PLATFORM" == "osl"* ]]; 
#then
    #export SHELL=`which zsh`
    ## this loads zsh when in an interactive shell
    #if [[ $- = *i* ]] 
    #then
        #exec "$SHELL" -l
    #fi 
    ##[ -z "$ZSH_VERSION" ] && exec "$SHELL" -l
#fi

#case $- in
  #*i*)
    ## Interactive session. Try switching to zsh.
    #if [ -z "$ZSH" ]; then # do nothing if running under zsh already
      #zsh=$(command -v zsh)
      #if [ -x "$zsh" ]; then
        #export SHELL="$zsh"
        #exec "$zsh"
      #fi
    #fi
#esac
