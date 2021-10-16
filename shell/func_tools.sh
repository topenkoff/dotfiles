vpn () {
    credentials=$(pass $1/vpn)
    while IFS= read -r line
    do
      name=${line%%=*}
      value=${line##*=}
      declare vpn_${name}="${value}"
    done <<< $credentials

    PASSWORD=$(echo -n ${vpn_prefix}; oathtool --totp -b ${vpn_secret})
    echo ${PASSWORD} | sudo openconnect \
      --user ${vpn_user} \
      --authgroup=User -v \
      --passwd-on-stdin ${vpn_host} 
}

pgcli() {
    local project=${1}
    local env=${2}
    local replica=${3}

    credentials=$(pass db/postgres/${project}/${env}/${replica})
    if [[ -z $credentials ]]; then
      return
    fi

    while IFS= read -r line
    do
      name=${line%%=*}
      value=${line##*=}
      declare pg_${name}="${value}"
    done <<< $credentials

    PGPASSWORD=$pg_password psql \
      --host=$pg_host \
      --port=$pg_port \
      --username=$pg_username \
      --dbname=$pg_dbname
}

curltime () {
    curl -w "     
    time_namelookup:  %{time_namelookup}s
       time_connect:  %{time_connect}s
    time_appconnect:  %{time_appconnect}s
   time_pretransfer:  %{time_pretransfer}s
      time_redirect:  %{time_redirect}s
 time_starttransfer:  %{time_starttransfer}s
 ------------------------------
         time_total:  %{time_total}s\n" -o /dev/null -s $1
}
