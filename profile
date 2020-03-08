# file-creation mask: 
#    (full access for group is not a problem, because
#    every user has his own private group dlr_<user>_p)
# rwxrwxr-x
umask 002

# --- additional architecture environment variables
#export DLRRM_HOST_PLATFORM="osl42-x86_64" 
if test -f "/home/seid_da/.profile_local"; then
    source "/home/seid_da/.profile_local"
fi
export OBJ_PATH=$DLRRM_HOST_PLATFORM
export ARCH=$DLRRM_HOST_PLATFORM

# --- locale settings variable
export LC_TIME="de_DE.UTF-8"

# --- Neo Tastaturbelegung
#export PATH=$PATH:~/.neo/    

# --- ff/tb
export PATH=/home/seid_da/packages/firefox-lin:$PATH

export PATH=/home/seid_da/packages/thunderbird-lin:$PATH

# --- vim 8.0
if [ "$DLRRM_HOST_PLATFORM" = "osl42-x86_64" ];
then
    export PATH=/home/seid_da/packages/vim/osl42-x86_64/bin:$PATH
fi

# --- maple
export PATH=/opt/maple/latest/bin:$PATH


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


export PYTHONPATH=$PYTHONPATH:/home/seid_da/dev/python/getch


# --- rmpm/pkgtool 
export PATH=/volume/software/common/packages/rmpm/latest/bin/$DLRRM_HOST_PLATFORM:$PATH

# --- Links and Nodes
if [ "$DLRRM_HOST_PLATFORM" ] 
then
    export LN_BASE=/volume/software/common/packages/links_and_nodes/latest
    source $LN_BASE/scripts/bash.rc
    export PATH=$LN_BASE/scripts:$PATH
fi
#pkgtool --env links_and_nodes==0.11 --env-format embed_sh > links_and_nodes.env && source links_and_nodes.env && rm links_and_nodes.env






# --- ssh keys
#ssh-add ~/.ssh/id_rsa_github </dev/null


#[[ $- == *i* ]] && echo 'Interactive' || echo 'Not interactive'
#shopt -q login_shell && echo 'Login shell' || echo 'Not login shell'

#if [ ! -z ${DLRRM_HOST_PLATFORM+x} ]

if [ "$DLRRM_HOST_PLATFORM" = "osl42-x86_64" ] || [ "$DLRRM_HOST_PLATFORM" = "osl15-x86_64" ];
then
    export SHELL=/usr/bin/zsh
    # this loads zsh when in a login shell [e.g. ssh]
    if [[ $- = *i* ]] 
    then
        exec /usr/bin/zsh -l
    fi 
fi

#if [ "$HOSTNAME" = "rmc-lx0255"]
    #xrandr --setmonitor DP-1-1 1706/399x1440/336+0+0 DP-1 
    #xrandr --setmonitor DP-1-2 1708/399x1440/336+1706+0 none 
    #xrandr --setmonitor DP-1-3 1706/399x1440/336+03414+0 none

    #xrandr --fb 1706x1440
    #xrandr --fb 1708x1440
    #xrandr --fb 1706x1440
#fi




