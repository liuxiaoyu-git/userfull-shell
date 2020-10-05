NET_IF_NAME=$(nmcli con show |awk '{print $1}' | sed -n '2p')

read -p "Please input host name:" HOSTNAME
read -p "Please input ${NET_IF_NAME} IP (for example 192.168.1.12/24):" IP
read -p "Please input ${NET_IF_NAME} GATEWAY (for example 192.168.1.1):" GATEWAY
read -p "Please input ${NET_IF_NAME} DNS (for example 192.168.1.1):" DNS

hostnamectl set-hostname ${HOSTNAME}
nmcli connection modify ${NET_IF_NAME} ipv4.addresses ${IP}
nmcli connection modify ${NET_IF_NAME} ipv4.dns ${DNS}
nmcli connection modify ${NET_IF_NAME} ipv4.gateway ${GATEWAY}

echo "===================================================="
read -p "Please input ENTER to make all modifies works." DNS
echo "Please re-login using new IP."

systemctl restart network
