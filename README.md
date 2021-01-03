# shell_script_learning

> This project is me trying to learn shell script based on my real requirment for v2ray deployment. I'd like to write a simple shell script helping me to quickly deploy a v2ray for the server end in a brand new VPS. 

# Description for scripts

## gitall.sh
* simple script to help commit through git

## sync-config.sh
Syncronize config file to client or server end.
### Usage:
* Two enviroment viriable which this script depending on:
  * REMOTE_SSH: Remote ssh address as format: ```username@hostname```
  * V2RAY_CONFIG_LOC: Local v2ray configuration repository location
* Options:
    * -s: push local config to the server side
    * -c: push local config to the client side