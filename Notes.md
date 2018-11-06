# Notes for DanielSinnott.com

- Routes that are added to domains.json must also be configured with my domain provider (NamesCheap). It takes time to changes to NamesCheap to propigate to the DNS
- Run python setup-app.py with staging set to true in the domains.json to test cert creation, before setting staging to false for the real deal.

* When the staging / test runs, it will say that a cert for danielsinnott already exist and how to remove it.

`bx app domain-cert-remove danielsinnott.com; bx app domain-cert-add danielsinnott.com -c cert.pem -k privkey.pem -i chain.pem; bx app domain-cert danielsinnott.com`

- After generating the certs & uploading to IBM Cloud automatically, you need to delete the routes created. e.g.:
  `cf routes`
  `cf delete-route danielsinnott.com --hostname blog --path /.well-known/acme-challenge/`

Stopping app letsencrypt in org sinnott74@hotmail.com / space production as sinnott74@hotmail.com...
OK
Attempting certificate upload...
Uploading certificate to domain 'danielsinnott.com'...
FAILED
Error: {code: 'internal_server_error', message: 'Cannot read property 'decoded' of undefined'}

Making GET request to https://danielsinnott.com
HTTPSConnectionPool(host='danielsinnott.com', port=443): Max retries exceeded with url: / (Caused by SSLError(SSLError(1, u'[SSL: TLSV1_UNRECOGNIZED_NAME] tlsv1 unrecognized name (\_ssl.c:726)'),))
Attempting certificate upload...
Uploading certificate to domain 'danielsinnott.com'...
FAILED
Error: {code: 'internal_server_error', message: 'Cannot read property 'decoded' of undefined'}

Making GET request to https://danielsinnott.com
HTTPSConnectionPool(host='danielsinnott.com', port=443): Max retries exceeded with url: / (Caused by SSLError(SSLError(1, u'[SSL: TLSV1_UNRECOGNIZED_NAME] tlsv1 unrecognized name (\_ssl.c:726)'),))
Attempting certificate upload...
Uploading certificate to domain 'danielsinnott.com'...
FAILED
Error: {code: 'internal_server_error', message: 'Cannot read property 'decoded' of undefined'}

Making GET request to https://danielsinnott.com
HTTPSConnectionPool(host='danielsinnott.com', port=443): Max retries exceeded with url: / (Caused by SSLError(SSLError(1, u'[SSL: TLSV1_UNRECOGNIZED_NAME] tlsv1 unrecognized name (\_ssl.c:726)'),))
Warning: Please note that your SSL certificate, its corresponding PRIVATE KEY, and its intermediate certificates have been downloaded to the current working directory. If you need to remove them, use `rm *.pem`
Unable to upload certificates
daniels-mbp:bluemix-letsencrypt-master Sinnott$
