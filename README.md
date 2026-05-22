# BIND-PROXY-WEB

Projeto desenvolvido para a disciplina de Administração de Sistemas Abertos (ASA), utilizando Docker Desktop, VSCode, BIND9, NGINX, Postfix, Dovecot e Thunderbird.

---

# Objetivo do Projeto

Implementar uma infraestrutura completa contendo:

- Servidor DNS utilizando BIND9
- Reverse Proxy utilizando NGINX
- 3 websites independentes
- Servidor de e-mail com Postfix + Dovecot
- Persistência de usuários e caixas de e-mail
- Testes de envio e recebimento utilizando Thunderbird
- Ambiente totalmente containerizado com Docker

---

# Tecnologias Utilizadas

- Docker Desktop
- Docker Compose
- Ubuntu 22.04
- BIND9
- NGINX
- Postfix
- Dovecot
- Mozilla Thunderbird
- VSCode

---

# Estrutura do Projeto

```bash
bind-proxy-web/
│
├── bind/
│   ├── bind.keys
│   ├── db.10.24.6
│   ├── db.jonaslab.test
│   ├── named.conf
│   └── teste-dns.sh
│
├── email/
│   ├── dovecot/
│   │   ├── 10-auth.conf
│   │   ├── 10-mail.conf
│   │   ├── 10-master.conf
│   │   └── 10-ssl.conf
│   │
│   ├── postfix/
│   │   └── main.cf
│   │
│   ├── vmail/
│   ├── Dockerfile
│   ├── mail.sh
│   └── mailname
│
├── proxy/
│   └── default.conf
│
├── web/
│   ├── site1/
│   ├── site2/
│   └── site3/
│
└── compose.yaml


Arquitetura da Solução
DNS (BIND9)

Responsável pela resolução dos domínios:

jonastech.jonaslab.test
jonasredes.jonaslab.test
jonasti.jonaslab.test
mail.jonaslab.test


Reverse Proxy (NGINX)

O proxy recebe as requisições HTTP e redireciona para:

Domínio	Container
jonastech.jonaslab.test	site1
jonasredes.jonaslab.test	site2
jonasti.jonaslab.test	site3

Websites

Cada website possui:

Página HTML personalizada
Identidade visual própria
Conteúdo institucional independente


Servidor de E-mail

Implementado utilizando:

Postfix → envio SMTP
Dovecot → recebimento IMAP/POP3

Contas de E-mail               Criadas
Usuários Email	               Senha
tech	tech@jonaslab.test	   123456
suport	suport@jonaslab.test   123456
usuario	usuario@jonaslab.test  123456
redes	redes@jonaslab.test	   123456

Persistência de Dados

Foi implementada persistência utilizando Docker Volumes:

volumes:
  - vmail-data:/var/mail/vmail

Isso garante que:

usuários continuem existindo
e-mails não sejam perdidos
caixas postais sejam preservadas

mesmo após remoção dos containers.

Configuração DNS no Windows

Para funcionamento local:

IPv4 configurado manualmente
DNS apontando para:
127.0.0.1

O IPv6 foi desativado temporariamente para evitar conflito de resolução DNS local.

Como Executar o Projeto
Subir os containers
docker compose up -d

Verificar containers
docker ps

Testar DNS
nslookup jonastech.jonaslab.test

Acessar os Sites
http://jonastech.jonaslab.test
http://jonasredes.jonaslab.test
http://jonasti.jonaslab.test

Configuração Thunderbird

Servidor IMAP

Campo	    Valor
Servidor	mail.jonaslab.test
Porta	    143
Segurança	Nenhum

Servidor SMTP

Campo	    Valor
Servidor	mail.jonaslab.test
Porta	    587
Segurança	Nenhum


Testes Realizados
Resolução DNS
Reverse Proxy
Acesso simultâneo aos 3 sites
Envio de e-mails
Recebimento de e-mails
Persistência de dados
Comunicação entre containers


Observações

Este projeto foi desenvolvido exclusivamente para fins acadêmicos e laboratoriais.

Os certificados SSL utilizados são autoassinados (snakeoil).




Autor

Jonas Campos Amorim