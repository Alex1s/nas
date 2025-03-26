
[https://askubuntu.com/questions/39760/how-can-i-control-hdd-spin-down-time](https://askubuntu.com/questions/39760/how-can-i-control-hdd-spin-down-time)
```
$ hdparm -S 120 /dev/sda

/dev/sda:
 setting standby to 120 (10 minutes)
$ hdparm -S 120 /dev/sdb

/dev/sdb:
 setting standby to 120 (10 minutes)
```


[https://serverfault.com/questions/275364/get-drive-power-state-without-waking-it-up](https://serverfault.com/questions/275364/get-drive-power-state-without-waking-it-up)
```
$ smartctl --nocheck standby -i /dev/sda
$ smartctl --nocheck standby -i /dev/sdb
```
