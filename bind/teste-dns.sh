#!/bin/sh

echo "=== Testando zona forward jonas.lan ==="
dig @127.0.0.1 site1.jonas.lan
dig @127.0.0.1 site2.jonas.lan
dig @127.0.0.1 site3.jonas.lan
dig @127.0.0.1 mail.jonas.lan
dig @127.0.0.1 ns.jonas.lan

echo "=== Testando aliases ==="
dig @127.0.0.1 www.jonas.lan
dig @127.0.0.1 portal.jonas.lan
dig @127.0.0.1 webmail.jonas.lan

echo "=== Testando zona reverse 25.172.in-addr.arpa ==="
dig -x 172.25.0.2 @127.0.0.1
dig -x 172.25.0.3 @127.0.0.1
dig -x 172.25.0.4 @127.0.0.1
dig -x 172.25.0.5 @127.0.0.1
dig -x 172.25.0.10 @127.0.0.1
dig -x 172.25.0.20 @127.0.0.1

echo "=== Teste concluído ==="
