## Configurar VLANs lado Router
```
Router(config)#interface fastEthernet 0/0.1
Router(config-subif)#encapsulation dot1Q 1
Router(config-subif)#ip address 10.1.0.1 255.255.255.0
Router(config-subif)#no shutdown 
```

```
Router(config)#interface fastEthernet 0/0.10
Router(config-subif)#encapsulation dot1Q 10
Router(config-subif)#ip address 10.10.0.1 255.255.255.0
Router(config-subif)#exit
```

## Acceso telnet
```
remotox(config)# line vty 0 1
remotox(config-line)# login
remotox(config-line)# password cisco
remotox(config-line)# exit
```

## Ip router
#### Serial
```
Router(config)#interface Serial 0/0/1
Router(config-if)# encapsulation ppp
Router(config-if)#ip address 10.1.0.1 255.255.255.0
```
#### FastEthernet
```
remotox(config)# interface fastEthernet 0/0
remotox(config-if)# ip address <IP> <máscara>
```

## Routeo RIP
```
remotox(config)# router rip
remotox(config-router)# version 2
remotox(config-router)# network w.x.y.z
remotox(config-router)# passive-interface fastEthernet 0/0
remotox(config-router)# redistribute static
```

## Routeo Dinamico EIGRP
```
Router(config)#router eigrp 1 
Router(config-router)#network 10.0.0.0
```

## access-list
config t
access-list nro permit ip wildcard ip wildcard

access-list 101 permit ip 10.10.0.0 0.0.0.255 10.4.0.0 0.0.0.255
interface fastEthernet 0/0 
ip access-group 101 out

```
remotox(config)# access-list 1 permit 192.168.1.0 0.0.0.127
remotox(config)# interface fa0/1
remotox(config-if)# ip access-group 1 in
```

Para denegar un host
```
remotox(config)# access-list 1 deny 192.168.1.22 0.0.0.0
remotox(config)# interface fa0/1
remotox(config-if)# ip access-group 1 out
```

## VPN

