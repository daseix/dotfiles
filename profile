#source ~/.bashrc
#source ~/.zshrc


# -- environment variables --

# --- default shell ---
export SHELL=/usr/bin/zsh



# --- Neo Tastaturbelegung ---
export PATH=$PATH:~/.neo/    


# --- smerobotics volume path ---
export VOLUME_SME=/volume/USERSTORE/project_smerobotics
alias cdsme='cd $VOLUME_SME'


# --- ln_base path ---
#export LN_BASE=~/foreign_packages/ln_base
#export LN_BASE=$VOLUME_SME/foreign_packages/ln_base
#source $LN_BASE/scripts/bash.rc


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

# --- RBDL 4 Matlab ---
export RBDL_PATH=/home/laka_do/foreign_packages/rbdl
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$RBDL_PATH
