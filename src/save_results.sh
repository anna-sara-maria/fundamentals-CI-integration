#!/bin/bash
path=$1
branch=$2
commitid=$3
date=$4
pusher_name=$5
pusher_email=$6
results=$7

if [[ ! -e ${path}/summary.txt ]]; then
    touch ${path}/summary.txt
fi

if [[ ! -e ${path}/${branch} ]]; then
    mkdir ${path}/${branch}
fi


commitpath=${path}/${branch}/${commitid}
mkdir ${commitpath}

summarystring="${date}: branch:   ${branch}     pusher: ${pusher_name}  commitid: ${commitid} \nurl: ${branch}/${commitid} \n"
echo -e ${summarystring} >> ${path}/summary.txt

echo -e ${results} > ${commitpath}/results.txt