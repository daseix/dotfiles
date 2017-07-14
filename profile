# file-creation mask: 
#    (full access for group is not a problem, because
#    every user has his own private group dlr_<user>_p)
# rwxrwx0--
umask 007



# --- additional architecture environment variables
export OBJ_PATH=$DLRRM_HOST_PLATFORM
export ARCH=$DLRRM_HOST_PLATFORM

# --- locale settings variable
export LC_TIME="de_DE.UTF-8"

# --- Neo Tastaturbelegung
#export PATH=$PATH:~/.neo/    

# --- ff/tb
export PATH=/home/seid_da/foreign_packages/firefox-lin:$PATH
export PATH=/home/seid_da/foreign_packages/thunderbird-lin:$PATH

# --- vim 7.4

# --- maple
export PATH=/opt/maple/latest/bin:$PATH


# --- Pip etc
export PATH=$HOME/.local/bin:$PATH
export PYTHONPATH=~/.local/lib/python2.7/site-packages:$PYTHONPATH

# --- openjdk temporarily
#export PATH=/automount_offline/rmnfs01/gpfs/sw/openjdk:$PATH
export PATH=~/foreign_packages/openjdk/bin:$PATH


# vtk python for mayavi
#export LD_LIBRARY_PATH=/volume/software/common/foreign_packages/vtk/6.3.0/lib/:$PYTHONPATH
#export PYTHONPATH=/volume/software/common/foreign_packages/vtk/6.3.0/python/osl42-x86_64:$PYTHONPATH
#export PYTHONPATH=/volume/software/common/foreign_packages/vtk/6.3.0/python/osl42-x86_64/vtk:$PYTHONPATH

#export LD_LIBRARY_PATH=/home/seid_da/foreign_packages/vtk/osl42-x86_64/lib/:$PYTHONPATH
#export PYTHONPATH=/home/seid_da/foreign_packages/vtk/osl42-x86_64/lib/python2.7/site-packages:$PYTHONPATH
#export PYTHONPATH=/home/seid_da/foreign_packages/vtk/osl42-x86_64/lib/python2.7/site-packages/vtk:$PYTHONPATH

# --- PyBrain / sklearn
#export PYTHONPATH=$PYTHONPATH:/home/seid_da/foreign_packages/pybrain
#export PYTHONPATH=$PYTHONPATH:/home/seid_da/foreign_packages/scikit-learn


# --- rmpm/pkgtool 
export PATH=/volume/software/common/packages/rmpm/latest/bin/$DLRRM_HOST_PLATFORM:$PATH

## --- Links and Nodes
#if [ "$DLRRM_HOST_PLATFORM" ] 
#then
    #export LN_BASE=/volume/software/common/packages/links_and_nodes/0.11
    #source $LN_BASE/scripts/bash.rc
    #export PATH=$LN_BASE/scripts:$PATH
#fi
#pkgtool --env links_and_nodes==0.11 --env-format embed_sh > links_and_nodes.env && source links_and_nodes.env && rm links_and_nodes.env





# --- MediView
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/volume/software/common/foreign_packages/osg/latest/lib/$DLRRM_HOST_PLATFORM
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/volume/software/mirosurge/packages/mediView/latest/lib/sled11-x86-gcc4.x

## set keyboard layout
#if [ -z "${SSH_TTY}" ]
#then
    ##setxkbmap us -variant altgr-intl && xmodmap ~/.dotfiles/hjkl_system.xmodmap
    #setxkbmap us -variant altgr-intl
    ##xkbcomp $HOME/.dotfiles/us_intl_hjkl_numblock.xkb $DISPLAY
#fi


#[[ $- == *i* ]] && echo 'Interactive' || echo 'Not interactive'
#shopt -q login_shell && echo 'Login shell' || echo 'Not login shell'

#if [ ! -z ${DLRRM_HOST_PLATFORM+x} ]
if [ "$DLRRM_HOST_PLATFORM" = "osl42-x86_64" ];
then
    export SHELL=/usr/bin/zsh

    # this loads zsh when in a login shell [e.g. ssh]
    if [[ $- = *i* ]] 
    then
        exec /usr/bin/zsh -l
    fi 
fi


