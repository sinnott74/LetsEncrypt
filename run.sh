# Function to delete /.well-known/acme-challenge/ routes
function deleteRoutes () {
    domains=`jq -c '.domains[]' domains.json`
    for domain in $domains; do
        # echo "$domain"
        d=`echo "$domain" | jq -r '.domain'`
        hosts=`echo "$domain" | jq -r '.hosts[]'`
        for host in $hosts; do 
            if test "$host" = "."
            then
                bx cf delete-route $d -f --path /.well-known/acme-challenge/
            else 
                bx cf delete-route $d -f --path /.well-known/acme-challenge/ --hostname $host
            fi
        done;
    done;
}

read -sp 'IBM Cloud password: ' PASS

bx login -u sinnott74@hotmail.com -p $PASS -r eu-gb -o sinnott74@hotmail.com -s production --a https://api.eu-gb.bluemix.net

# Set bx target
# bx target --cf-api https://api.eu-gb.bluemix.net -o sinnott74@hotmail.com -s production

# Delete routes created by LetsEncrypt
deleteRoutes

bx app domain-cert-remove danielsinnott.com -f;

python setup-app.py

deleteRoutes