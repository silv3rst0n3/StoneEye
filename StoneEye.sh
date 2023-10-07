#!/bin/bash
date=$(date)
# check for files exist 
if [ ! -f hackerone_data.json ]
then
    wget https://raw.githubusercontent.com/Osb0rn3/bugbounty-targets/main/programs/hackerone.json
    mv $PWD/hackerone.json $PWD/hackerone_data.json
fi
if [ ! -f bugcrowd_data.json ]
then
    wget https://raw.githubusercontent.com/Osb0rn3/bugbounty-targets/main/programs/bugcrowd.json 
    mv $PWD/bugcrowd.json $PWD/bugcrowd_data.json 
fi

if [ ! -f yeswehack_data.json ]
then
    wget https://raw.githubusercontent.com/Osb0rn3/bugbounty-targets/main/programs/yeswehack.json 
    mv $PWD/yeswehack.json $PWD/yeswehack_data.json 
fi

if [ ! -f intigriti_data.json ]
then
    wget https://raw.githubusercontent.com/Osb0rn3/bugbounty-targets/main/programs/intigriti.json
    mv $PWD/intigriti.json $PWD/intigriti_data.json
fi
# #update

wget https://raw.githubusercontent.com/Osb0rn3/bugbounty-targets/main/programs/hackerone.json -O $PWD/uphackerone.json
wget https://raw.githubusercontent.com/Osb0rn3/bugbounty-targets/main/programs/intigriti.json -O $PWD/upintigriti.json
wget https://raw.githubusercontent.com/Osb0rn3/bugbounty-targets/main/programs/bugcrowd.json -O $PWD/upbugcrowd.json
wget https://raw.githubusercontent.com/Osb0rn3/bugbounty-targets/main/programs/yeswehack.json -O $PWD/upyeswehack.json

sleep 1
#main
cat uphackerone.json | jq '.[] | {Scope: .relationships.structured_scopes.data[].attributes.asset_identifier}' > $PWD/uphackerone2.json
cat uphackerone2.json | sed 's/}/}\n/g' > uphackerone3.json

cat hackerone_data.json | jq '.[] | {Scope: .relationships.structured_scopes.data[].attributes.asset_identifier}' > $PWD/hackerone_data2.json
cat hackerone_data2.json | sed 's/}/}\n/g' > hackerone_data3.json

hackerone=$(cat $PWD/uphackerone3.json | anew -d $PWD/hackerone_data3.json) 
if [ -n "$hackerone" ];then
echo -e "$date \n #hackerone_NEW_Targets \n $hackerone"| tee hack.txt | notify -id tel -silent -bulk
fi

#bugcrowd
cat upbugcrowd.json | jq '.[]| {name: .target_groups[].targets[].name, Scope: .target_groups[].targets[].uri}' | sed 's/}/}\n/g' > $PWD/upbugcrowd3.json

cat bugcrowd_data.json | jq '.[]| {name: .target_groups[].targets[].name, Scope: .target_groups[].targets[].uri}' | sed 's/}/}\n/g' > $PWD/bugcrowd_data3.json

bugcrowd=$(cat $PWD/upbugcrowd3.json | anew -d $PWD/bugcrowd_data3.json )
if [ -n "$bugcrowd" ];then
echo -e "$date \n #bugcrowd_NEW_Targets \n $bugcrowd" | tee bugcrowd.txt | notify -id tel -silent -bulk
fi

#intigriti
cat upintigriti.json | jq '.[] | {Name: .name,Scope: .domains[].endpoint}' | sed 's/}/}\n/g' > $PWD/upintigriti3.json

cat intigriti_data.json | jq '.[] | {Name: .name,Scope: .domains[].endpoint}'| sed 's/}/}\n/g' > $PWD/intigriti_data3.json

intigriti=$(cat $PWD/upintigriti3.json | anew -d $PWD/intigriti_data3.json )
if [ -n "$intigriti" ];then
echo -e "$date \n #intigriti_NEW_Targets \n $intigriti" | tee intigriti.txt | notify -id tel -silent -bulk
fi

#yeswehack
cat upyeswehack.json | jq '.[] | {name: .business_unit.name, Scope: .scopes[].scope ,Type:.scopes[].scope_type}' | sed 's/}/}\n/g' > $PWD/upyeswehack3.json 

cat yeswehack_data.json | jq '.[] | {name: .business_unit.name, Scope: .scopes[].scope ,Type:.scopes[].scope_type}' | sed 's/}/}\n/g' > $PWD/yeswehack_data3.json

yeswehack=$(cat $PWD/upyeswehack3.json | anew -d $PWD/yeswehack_data3.json )
if [ -n "$yeswehack" ];then
echo -e "$date \n #yeswehack_NEW_Targets \n $yeswehack" | tee yeswehack.txt | notify -id tel -silent -bulk
fi

cp $PWD/upintigriti.json $PWD/intigriti_data.json
cp $PWD/upbugcrowd.json $PWD/bugcrowd_data.json
cp $PWD/upyeswehack.json $PWD/yeswehack_data.json
cp $PWD/uphackerone.json $PWD/hackerone_data.json

sleep 6000

/bin/bash $PWD/StoneEye.sh
