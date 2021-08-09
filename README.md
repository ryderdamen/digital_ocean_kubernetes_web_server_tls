# Deploying A Kubernetes Web Server on Digital Ocean with TLS
This is an example repository that uses terraform to spin up a Digital Ocean kubernetes cluster, with multiple independent nginx servers running in containers, DNS entries, and TLS certificates.



## Installation
You must have your name servers pointed to digital ocean. After that, run the following and fill in the variables to provision the servers.

```bash
make init
```

Edit the terraform/production.tfvars file as necessary.

To create your infrastructure, run the following:

```bash
make plan
make apply
```

To destroy the infrastructure, run the following:
```bash
make destroy
```
