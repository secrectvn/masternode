#!/bin/bash
source ../syntax/logo.env
source ../syntax/menu.env
# Variables-----------------------------------------------------------------------------------
COINDIR=/root/masternode/$coin
ipvps=$(ip route get 1 | awk '{print $NF;exit}');
rpcpass=$(date +%s | sha256sum | base64 | head -c 32 ;);
wallpass=$(date +%s | sha256sum | base64 | head -c 16 ;);

# Function--------------------------
#
# ----------------------------------

pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}
# HAVECOIN--------------------------
  havecoin(){
                datadir=~/masternode/.havecoin ;
                mndir=~/masternode ;
                mkdir -p ~/masternode   ;
                read -p  "$grn Nhap thu muc ban muon luu file mdeamon HAVECOIN ( Mac dinh la : /root/masternode/ hoac /home/user/masternode/ ): $end"  mndir                     
                read -p "$grn Nhap thu muc ban muon luu data HAVECOIN (default /root/masternode/.havecoin or /home/user/masternode/.havecoin ): $end"  datadir                        
                read -p   "$grn Nhap Masternode Privkey ( chay lenh masternode genkey): $end" ; mnprivkey                      
                read -p  "$grn Nhap TXHASH (chay lenh masternode outputs): $end" ; txhash
                echo -e  "$grn Choice TXID 0 or 1: $end"
					select txid in 0 1
					do
							case $txid in
							0|1)
									break
									;;
							*)
									echo "$red Chon sai TXID. Vui long chon lai $end "
									;;
							esac
					done
                mkdir -p $datadir ;
                wget https://raw.githubusercontent.com/secrectvn/masternode/master/config/sample-conf.conf  -O $datadir/havecoin.conf ;
                  sed -i 's/RPCCOIN/HAVECOINRPC/g'  $datadir/havecoin.conf ;
                  sed -i 's/RPCPASS/$rpcpass/g'     $datadir/havecoin.conf ;
                  sed -i 's/RPCPORT/34788/g'        $datadir/havecoin.conf ;
                  sed -i 's/MNGENKEY/$mnprivkey/g'  $datadir/havecoin.conf ;
                  sed -i 's/IPVPS/$ipvps/g'         $datadir/havecoin.conf ;
                  sed -i 's/PORT/34787/g'           $datadir/havecoin.conf ;
                wget https://raw.githubusercontent.com/secrectvn/masternode/master/config/sample-conf.conf      -O $datadir/sample-conf.conf  ;
                  sed -i 's/HOSTNAME/$(hostname)/g' $datadir/sample-conf.conf  ;
                  sed -i 's/IPVPS/$ipvps/g'         $datadir/sample-conf.conf  ;
                  sed -i 's/PORT/34787/g'           $datadir/sample-conf.conf  ;
                  sed -i 's/MNGENKEY/$mnprivkey/g'  $datadir/sample-conf.conf  ;
                  sed -i 's/IPVPS/$ipvps/g'  	    $datadir/sample-conf.conf  ;
                  sed -i 's/MNOUTPUTS/$txhash/g'    $datadir/sample-conf.conf  ;
                  sed -i 's/TXINDEX/$txid/g'        $datadir/sample-conf.conf  ;
                cd $mndir && git clone https://github.com/scryclip/havecoin.git  havecoin   ;
                cd $mndir/havecoin/src && make -f makefile.unix USE_UPNP= && strip havecoind ;
                mv havecoind $mndir && cd $mndir &&  rm -rf $mndir/havecoin ;
        }
# BEETLECOIN-----------------------
#
# ----------------------------------
    beetlecoin(){
                echo "COMING SOON"
                        pause
        }
# function to display menus

#  Option action
read_main_options(){
        local choice
        read -p "Enter choice [ 1 - 9] " choice
        case $choice in
                1)      havecoin;;
                2)      exit 0 ;;
                3)      exit 0 ;;
                4)      exit 0 ;;
                0)      exit 0;;
                *) echo -e "${RED}Phim chon sai. Vui long chon lai ! ${STD}" && sleep 2
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
        show_main_menus
        read_main_options
done
