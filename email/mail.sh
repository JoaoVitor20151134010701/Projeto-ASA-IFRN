#!/bin/bash

# Ativa a porta 587 (Submission) no arquivo master.cf do Postfix
sed -i 's/#submission inet n/submission inet n/g' /etc/postfix/master.cf

# Garante que o diretório base dos e-mails existe
mkdir -p /var/mail/vmail

# Função para criar o usuário no sistema Linux
criar_usuario() {
    local user=$1
    local name=$2
    
    # Verifica se o usuário já existe para não quebrar em reinícios
    if ! id "$user" &>/dev/null; then
        useradd -c "$name" -d /var/mail/vmail/$user -m -s /bin/false "$user" || true
        echo "$user:123456" | chpasswd
    fi

    # Garante a criação da estrutura de pastas Maildir obrigatória para o Dovecot
    mkdir -p /var/mail/vmail/$user/Maildir/{cur,new,tmp}
}

# --- Criação das Contas de E-mail ---
criar_usuario "tech" "tech"
criar_usuario "suport" "suport"
criar_usuario "usuario" "usuario"
criar_usuario "redes" "redes"
criar_usuario "joao" "joao"
criar_usuario "maria" "maria"

# --- Aplicação Rígida de Permissões ---
for user in tech suport usuario redes; do
    if [ -d "/var/mail/vmail/$user" ]; then
        chown -R "$user:$user" "/var/mail/vmail/$user"
        chmod -R 700 "/var/mail/vmail/$user"
    fi
done