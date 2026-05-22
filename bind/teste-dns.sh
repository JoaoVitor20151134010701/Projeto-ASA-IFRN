#!/bin/sh

echo "=== Testando zona forward dsrjoaovitor ==="
dig @127.0.0.1 site1.dsrjoaovitor
dig @127.0.0.1 site2.dsrjoaovitor
dig @127.0.0.1 site3.dsrjoaovitor
dig @127.0.0.1 mail.dsrjoaovitor
dig @127.0.0.1 ns.dsrjoaovitor

echo "=== Testando aliases ==="
dig @127.0.0.1 www.dsrjoaovitor
dig @127.0.0.1 portal.dsrjoaovitor
dig @127.0.0.1 webmail.dsrjoaovitor

echo "=== Testando zona reverse 25.172.in-addr.arpa ==="
dig -x 172.25.0.2 @127.0.0.1
dig -x 172.25.0.3 @127.0.0.1
dig -x 172.25.0.4 @127.0.0.1
dig -x 172.25.0.5 @127.0.0.1
dig -x 172.25.0.10 @127.0.0.1
dig -x 172.25.0.20 @127.0.0.1

echo "=== Teste concluído ==="
