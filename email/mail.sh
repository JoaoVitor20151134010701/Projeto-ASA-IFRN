#!/bin/bash

# Criando a pasta raiz onde todos os e-mails ficarão centralizados para persistência
mkdir -p /var/mail/vmail

# Função p criar usuário
criar_usuario() {
    local user=$1
    local name=$2
    if ! id "$user" &>/dev/null; then
        # Define a home do usuário dentro da pasta que será persistida
        # Adicionado "|| true" para ignorar se o Linux reclamar do chown automático do useradd no volume
        useradd -c "$name" -d /var/mail/vmail/$user -m -s /bin/false "$user" || true
        echo "$user:123456" | chpasswd
    fi
}

#contas
criar_usuario "tech" "tech"
criar_usuario "suport" "suport"
criar_usuario "user" "user"
criar_usuario "redes" "redes"

#permissões
chown -R mail:mail /var/mail/vmail || true
chmod -R 770 /var/mail/vmail || true