#!/bin/bash
ez_dir=/mnt/e/GITHUB/masternode
# SOURCE 
source $ez_dir/lib/logo.env
error=$(tput cup 21 14)
# VARIABLES
mn_dir='/root/masternode'
mn_address=$(ip route get 1 | awk '{print $NF;exit}');
rd_passwd=$(date +%s | sha256sum | base64 | head -c 32 ;);
wl_passwd=$(date +%s | sha256sum | base64 | head -c 16 ;);

# EZ-MASTERNODE

main_menu(){
	tput clear
	main_banner
	tput cup 15 15
		echo "1. CAI DAT MASTERNODE" 
	tput cup 16 15
		echo "2. START / STOP MASTERNODE " 
	tput cup 17 15
		echo "3. KIEM TRA MASTERNODE" 
	tput cup 18 15
		echo "4. Exit"
	tput bold
	tput cup 20 15
}
ins_mn(){
	tput clear
	# INPUT MASTERNODE INFOMATION
	read -p  " $gre Nhap ten coin ban muon chay Masternode :  $end " project
	source $ez_dir/lib/projects/${project}/conf.env	
	mkdir -p $mn_dir/${project}/
	read -p  "$gre Nhap Masternode Genkey ( chay lenh masternode genkey): $end"  mn_genkey ;
	read -p  "$gre Nhap TXHASH (chay lenh masternode outputs): $end" tx_hash ;
	echo -e  "$gre Choice TXID 0 or 1: $end"
		select tx_id in 0 1
			do
			case $tx_id in 
			0|1) break ;;
			*) echo "$red Chon sai TXID. Vui long chon lai $end ";;
			esac
			done

	
		
	# COIN.CONF
	cp $ez_dir/configs/project-sample.env  $mn_dir/${project}/${project}.conf
	cp $ez_dir/configs/masternode-sample.env  $mn_dir/${project}/masternode.conf ;
	sed -i "s|RPCCOIN|$project-RPC|g"  $mn_dir/${project}/${project}.conf ;
	sed -i "s|RPCPASS|$rd_passwd|g"  $mn_dir/${project}/${project}.conf ;
	sed -i "s|RPCPORT|$rpc_port|g"  $mn_dir/${project}/${project}.conf ;
	sed -i "s|MN_DATA|$mn_data|g"  $mn_dir/${project}/${project}.conf ;
	sed -i "s|MN_PID|$mn_pid|g"  $mn_dir/${project}/${project}.conf ;
	sed -i "s|MN_GENKEY|$mn_genkey|g"  $mn_dir/${project}/${project}.conf ;
	sed -i "s|MN_ADDR|$mn_address|g"  $mn_dir/${project}/${project}.conf ;
	sed -i "s|MN_PORT|$mn_port|g"  $mn_dir/${project}/${project}.conf ;
	
	# MASTERNODE.CONF
	
	sed -i "s|MN_ALIAS|$(hostname)|g"  $mn_dir/${project}/masternode.conf ;
	sed -i "s|MN_ADDR|$mn_address|g"  $mn_dir/${project}/masternode.conf ;
	sed -i "s|MN_PORT|$mn_port|g"  $mn_dir/${project}/masternode.conf ;
	sed -i "s|MN_GENKEY|$mn_genkey|g"  $mn_dir/${project}/masternode.conf ;
	sed -i "s|TX_HASH|$tx_hash|g"  $mn_dir/${project}/masternode.conf ;
	sed -i "s|TX_ID|$tx_id|g"  $mn_dir/${project}/masternode.conf ;
	
	
	cat $mn_dir/${project}/masternode.conf ; sleep 30s

	# BUILD COIND
	echo " CAI DAT THANH CONG";
	#build_${project}
}



pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}
action_main_options(){
        local choice
        read -p "Enter choice [ 1 - 4] " choice
        case $choice in
                1)      ins_mn ;;
                2)      exit 0 ;;
                3)      exit 0 ;;
                4)      exit 0 ;;
                0)      exit 0;;
                *) echo -e "$red $error Phim chon sai. Vui long chon lai ! $end" && sleep 2
        esac
}
# ----------------------------------------------
# Trap CTRL+C, CTRL+Z and quit singles
# ----------------------------------------------
trap '' SIGINT SIGQUIT SIGTSTP
# LOGIC-------------------------------
#
# ------------------------------------
while true
do
        main_menu
        action_main_options
done