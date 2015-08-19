#source ~/.bashrc
#source ~/.zshrc


# -- environment variables --

# --- fix git ESC problems for diff etc ---
export LESS="-eirMX"

# --- default shell ---
export SHELL=/bin/zsh

# --- locale settings variable ---
export LC_TIME="de_DE.UTF-8"

# --- Neo Tastaturbelegung ---
export PATH=$PATH:~/.neo/    

# --- daniel seth scripts, e.g. mampf
#export PATH=$PATH:/home/seth_da/usr/bin

# --- smerobotics volume path ---
export VOLUME_SME=/volume/USERSTORE/project_smerobotics
alias cdsme='cd $VOLUME_SME'


# --- ln_base path ---
#export LN_BASE=~/foreign_packages/ln_base
export LN_BASE=/volume/software/common/packages/links_and_nodes/latest
#export LN_BASE=$VOLUME_SME/foreign_packages/ln_base
source $LN_BASE/scripts/bash.rc


# --- MediView ---
export LD_LIBRARY_PATH=/volume/USERSTORE/bodenmue/packages/osg/3.0.1/lib/sled11-x86-gcc4.x:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/volume/software/mirosurge/packages/mediView/0.1.0/lib/sled11-x86-gcc4.x:$LD_LIBRARY_PATH


# --- openrave ---
#openrave configuration
#export USE_OPENRAVE_LATEST=true
#export OPENRAVE_ROOT_DIR=/volume/USERSTORE/seid_da/openrave
#export OPENRAVE_RESOURCES=/volume/USERSTORE/seid_da/openrave/resources
#openrave settings
#source /volume/USERSTORE/that/openrave_dependencies/openrave_dep.bash.env


# --- architecture environment variable ---
#if $(uname -m | grep '64'); then
    #export OBJ_PATH=sled11-x86_64-gcc4.x
#else
    export OBJ_PATH=sled11-x86-gcc4.x
#fi
#export ARCH=$OBJ_PATH
#export ARCH=sled11-x86-gcc4.x

# --- RBDL 4 Matlab ---
#export RBDL_PATH=/home/seid_da/foreign_packages/laka_do_sym/rbdl/lib/$ARCH
export RBDL_BASE=/home/seid_da/foreign_packages/rbdl/$OBJ_PATH
export RBDL_PATH=$RBDL_BASE/lib

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$RBDL_PATH



