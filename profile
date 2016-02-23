# file-creation mask: 
#    (full access for group is not a problem, because
#    every user has his own private group dlr_<user>_p)
# rwxrwx0--
umask 007

# --- fix git ESC problems for diff etc
export LESS="-eirMX"

# --- locale settings variable
export LC_TIME="de_DE.UTF-8"

# --- Neo Tastaturbelegung
export PATH=$PATH:~/.neo/    

# --- rmpm/pkgtool 
export PATH=$PATH:~/.local/bin:/volume/software/common/packages/rmpm/latest/bin/sled11-x86_64-gcc4.x/

# --- vim 7.4
export PATH=~/foreign_packages/vim/$DLRRM_HOST_PLATFORM/bin:$PATH

# --- maple
export PATH=$PATH:/opt/maple/latest/bin

# --- ln_base path
#export LN_BASE=/volume/software/common/packages/links_and_nodes/latest
export LN_BASE=/volume/software/common/packages/links_and_nodes/0.8
source $LN_BASE/scripts/bash.rc

# --- MediView
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/volume/USERSTORE/bodenmue/packages/osg/3.0.1/lib/sled11-x86-gcc4.x
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/volume/software/mirosurge/packages/mediView/latest/lib/sled11-x86-gcc4.x

# --- PyBrain
export PYTHONPATH=$PYTHONPATH:/home/seid_da/foreign_packages/pybrain

# --- additional architecture environment variables
export OBJ_PATH=$DLRRM_HOST_PLATFORM
export ARCH=$DLRRM_HOST_PLATFORM


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
