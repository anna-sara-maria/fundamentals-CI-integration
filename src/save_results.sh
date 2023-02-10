#!/bin/bash
path=$1
branch=$2
commitid=$3
date=$4
pusher_name=$5
pusher_email=$6
results=$7

if [[ ! -f ${path}/summary.txt ]]; then
    touch ${path}/summary.txt
fi

if [[ ! -d ${path}/${branch} ]]; then
    mkdir ${path}/${branch}
fi


commitpath=${path}/${branch}/${commitid}
mkdir ${commitpath}

summarystring="${date}: branch: ${branch}\tpusher: ${pusher_name}\tcommitid: ${commitid}\nurl: ${branch}/${commitid} \n"
echo -e ${summarystring} >> ${path}/summary.txt

echo -e ${results} > ${commitpath}/results.txt

#Add versions used
echo -e "\nVersions used:\n" >> ${commitpath}/results.txt
python3 -V >> ${commitpath}/results.txt
pip freeze | grep gitdb >> ${commitpath}/results.txt
pip freeze | grep GitPython >> ${commitpath}/results.txt