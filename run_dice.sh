#!/bin/sh
prefix="/mnt/research/illidan/judy/baselines"
if [ "$#" -le 2 ]
then
    echo "Usage:     ./run_dice.sh <env> <task> <seed>"
    echo "Example:   ./run_dice.sh HalfCheetah-v2 valuedice 2"
    exit
else
    env=$1
    task=$2
    seed=$3
    program="value_dice.train_eval"
    logdir="$prefix/$task/valuedice/$env/rank$seed"
    mkdir -p $logdir
    #echo "python -m $program --expert_dir value_dice/datasets --save_dir value_dice/save --env_name $env --num_trajectories 4 --task $task --seed $seed > $logdir/log.output &"
    echo "python -m $program --expert_dir value_dice/datasets --save_dir value_dice/save --env_name $env --num_trajectories 4 --task $task --seed $seed "
    python -m $program --expert_dir value_dice/datasets --save_dir value_dice/save --env_name $env --num_trajectories 4 --task $task --seed $seed 
fi
