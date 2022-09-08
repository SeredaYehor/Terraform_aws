# Nextcloud aws terraform project

This project was created with the purpose to easily deploy 
nextcloud server with mysql database under secure network using https and openvpn.


## Deploying guide

For deploying nextcloud infrastructure you will need to configure
variables in **variables.tf** file, where:

> key_name - ssh key for connecting to instances;
>
> vpn_mode - setting infrastructure to work under openvpn. This variable accepts only true/false values;
>
> certificate - arn of aws ssl certificate;
>
> record_name - name of dns record in your route 53;
>
> hosted_zone_id - id of route 53 zone;

After configuring this file you can execute **deploy_infrastructure** script, which will
configure aws infrastructure and, enabling vpn_mode, will start openvpn-client on your pc.
