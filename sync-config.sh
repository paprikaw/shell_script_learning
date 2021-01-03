#!/bin/sh

print_usage() {
	printf "Usage: syc-config.sh -a remote_server_address"
}

while getopts "cs" opt; do
	case ${opt} in
	c)
		echo ">>>>>>>>>Copy files to the cliend end..."
		cp ${V2RAY_CONFIG_LOC}/client_end/config.json /usr/local/etc/v2ray
		echo ">>>>>>>>>Restart client v2ray..."
		brew services restart v2ray 
		brew services 
		;;
	s) # Sync for server side
		echo ">>>>>>>>>Rsync file to the remote server end..."
		if [[ -z "${V2RAY_CONFIG_LOC}" ]] || [[ -z "${REMOTE_SSH}" ]]; then
			echo "V2RAY_CONFIG_LOC and REMOTE_SSH should be set"
			exit 1
		else
			rsync -Pz ${V2RAY_CONFIG_LOC}/server_end/config.json $REMOTE_SSH:/usr/local/etc/v2ray/config.json
			echo ">>>>>>>>>Restart v2ray for remote server..."
			ssh ${REMOTE_SSH} "sudo service v2ray restart; sudo service v2ray status"
		fi
		;;
	\?)
		print_usage
		echo "Invalid option: $OPTARG" #There is no match flags
		;;
	esac
done
echo ">>>>>>>>>Done!"
