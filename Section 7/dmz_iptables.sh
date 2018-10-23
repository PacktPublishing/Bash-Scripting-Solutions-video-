
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

sysctl -w net.ipv4.ip_forward=1

iptables -t filter -A FORWARD -i eth0 -o eth2 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -t filter -A FORWARD -i eth2 -o eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -t filter -A FORWARD -i enp0s3 -o eth2 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -t filter -A FORWARD -i eth2 -o enp0s3 -m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -t nat -A PREROUTING -p tcp -i enp0s3 -d 200.0.0.1 --dport 80 -j DNAT --to-dest 192.168.20.2
iptables -t nat -A PREROUTING -p tcp -i enp0s3 -d 200.0.0.1 --dport 443 -j DNAT --to-dest 192.168.20.2

iptables -t nat -A PREROUTING -p tcp -i enp0s3 -d 200.0.0.1 --dport 25 -j DNAT --to-dest 192.168.20.3

iptables -t nat -A PREROUTING -p udp -i enp0s3 -d 200.0.0.1 --dport 53 -j DNAT --to-dest 192.168.20.4
iptables -t nat -A PREROUTING -p tcp -i enp0s3 -d 200.0.0.1 --dport 53 -j DNAT --to-dest 192.168.20.4
