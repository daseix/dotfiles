# file-creation mask: 
#    (full access for group is not a problem, because
#    every user has his own private group dlr_<user>_p)
# rwxrwx0--
umask 007

# --- default shell ---
export SHELL=/bin/zsh

# --- fix git ESC problems for diff etc ---
export LESS="-eirMX"

# --- locale settings variable ---
export LC_TIME="de_DE.UTF-8"

# --- Neo Tastaturbelegung ---
export PATH=$PATH:~/.neo/    

# --- ln_base path ---
export LN_BASE=/volume/software/common/packages/links_and_nodes/latest
source $LN_BASE/scripts/bash.rc

# --- MediView ---
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/volume/USERSTORE/bodenmue/packages/osg/3.0.1/lib/sled11-x86-gcc4.x
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/volume/software/mirosurge/packages/mediView/0.1.0/lib/sled11-x86-gcc4.x
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/volume/software/mirosurge/packages/mediView/latest/lib/sled11-x86-gcc4.x


# --- architecture environment variable ---
#if $(uname -m | grep '64'); then
    #export OBJ_PATH=sled11-x86_64-gcc4.x
#else
    #export OBJ_PATH=sled11-x86-gcc4.x
#fi
#export ARCH=$OBJ_PATH
#export ARCH=sled11-x86-gcc4.x
export OBJ_PATH=$DLRRM_HOST_PLATFORM


# --- RBDL 4 Matlab ---
#export RBDL_PATH=/home/seid_da/foreign_packages/laka_do_sym/rbdl/lib/$ARCH
export RBDL_BASE=/home/seid_da/foreign_packages/rbdl/$OBJ_PATH
export RBDL_PATH=$RBDL_BASE/lib

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$RBDL_PATH
