# Notes for DanielSinnott.com

- Routes that are added to domains.json must also be configured with my domain provider (NamesCheap). It takes time to changes to NamesCheap to propigate to the DNS
- Run python setup-app.py with staging set to true in the domains.json to test cert creation, before setting staging to false for the real deal.

* When the staging / test runs, it will say that a cert for danielsinnott already exist and how to remove it.

- Unroute routes, e.g. `danielsinnott.com` and `www.danielsinnott.com`

- Run the following to remove the cert, as you can't add a new one while it exists
  `bx app domain-cert-remove danielsinnott.com;`

- above needs to be done after a staging run aswell

- After generating the certs & uploading to IBM Cloud automatically, you need to delete the routes created. e.g.:
  `cf routes`
  `cf delete-route danielsinnott.com --hostname blog --path /.well-known/acme-challenge/`
