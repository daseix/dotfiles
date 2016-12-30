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
export PATH=$PATH:~/.neo/    

# --- rmpm/pkgtool 
export PATH=$PATH:~/.local/bin:/volume/software/common/packages/rmpm/latest/bin/$DLRRM_HOST_PLATFORM/

# --- vim 7.4
export PATH=~/foreign_packages/vim/$DLRRM_HOST_PLATFORM/bin:$PATH

# --- maple
export PATH=$PATH:/opt/maple/latest/bin

# --- Python 2.7
if [ "$DLRRM_HOST_PLATFORM" != "osl42-x86_64" ] 
then
    export PATH=/opt/python/python2.7/bin:$PATH
fi

# --- ff/tb
export PATH=/home/seid_da/foreign_packages/firefox-lin:$PATH
export PATH=/home/seid_da/foreign_packages/thunderbird-lin:$PATH


# --- Links and Nodes
#export LN_BASE=/volume/software/common/packages/links_and_nodes/latest
#source $LN_BASE/scripts/bash.rc
eval `rmpm_do env --env-format embed_sh links_and_nodes==0.10`

# --- MediView
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/volume/software/common/foreign_packages/osg/latest/lib/$DLRRM_HOST_PLATFORM
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/volume/software/mirosurge/packages/mediView/latest/lib/sled11-x86-gcc4.x

# --- PyBrain / sklearn
#export PYTHONPATH=$PYTHONPATH:/home/seid_da/foreign_packages/pybrain
#export PYTHONPATH=$PYTHONPATH:/home/seid_da/foreign_packages/scikit-learn



# --- RBDL 4 Matlab
#export RBDL_PATH=/home/seid_da/foreign_packages/laka_do_sym/rbdl/lib/$ARCH
#export RBDL_BASE=/home/seid_da/foreign_packages/rbdl/$OBJ_PATH
#export RBDL_PATH=$RBDL_BASE/lib
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$RBDL_PATH


export SHELL=/bin/zsh
#if [[ $- == *i* ]]
#then
    #exec /bin/zsh -l
#fi
