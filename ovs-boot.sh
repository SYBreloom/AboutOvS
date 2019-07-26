# written by $￥ — 19.07.26
# 1. 清除之前的ovs进程
ps -ef | grep ovs | grep -v grep| cut -c 8-15 | sudo xargs kill -s 9
# 2. 启动ovs-server
sudo ovsdb-server -v --remote=punix:/usr/local/var/run/openvswitch/db.sock --remote=db:Open_vSwitch,Open_vSwitch,manager_options --private-key=db:Open_vSwitch,SSL,private_key \
             --certificate=db:Open_vSwitch,SSL,certificate \
             --bootstrap-ca-cert=db:Open_vSwitch,SSL,ca_cert \
             --pidfile --detach --log-file
# 3.初始化ovsdb
sudo ovs-vsctl --no-wait init
# 4.启动ovs主进程
sudo ovs-vswitchd --pidfile --detach --log-file
