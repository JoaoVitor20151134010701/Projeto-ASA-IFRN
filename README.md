

Este trabalho tem como finalidade a construção de uma infraestrutura de rede integrada, contemplando serviços essenciais como DNS, proxy reverso e servidores de e-mail. A proposta busca não apenas demonstrar a configuração técnica desses serviços, mas também apresentar uma visão prática de como eles podem ser organizados em um ambiente real de administração de sistemas.

No projeto, o Bind é utilizado para a resolução de nomes e gerenciamento de zonas DNS, permitindo que diferentes domínios sejam configurados e resolvidos de forma eficiente. O Postfix e o Dovecot são empregados para a implementação do serviço de correio eletrônico, garantindo suporte a caixas postais virtuais, autenticação segura e armazenamento de mensagens. Já o Nginx atua como proxy reverso, responsável por direcionar requisições HTTP para diferentes sites hospedados, otimizando o acesso e oferecendo flexibilidade na gestão de múltiplos serviços web.

Toda a infraestrutura é organizada por meio de Docker Compose, o que possibilita modularidade, isolamento de serviços e facilidade de manutenção. Os diretórios do projeto estão estruturados para separar claramente cada componente: configurações de DNS, arquivos de e-mail, scripts de automação, proxy e páginas web estáticas. Essa organização facilita tanto o estudo quanto a replicação do ambiente.

Além da parte técnica, o projeto serve como base para aprendizado acadêmico e prático, permitindo que estudantes e profissionais compreendam de forma aplicada conceitos de redes, servidores e administração de sistemas. A integração entre os serviços demonstra como diferentes tecnologias podem trabalhar em conjunto para formar uma rede funcional, segura e escalável.

tree
.
├── README.md
├── bind
│   ├── bind.keys
│   ├── db.10.24.6
│   └── named.conf
├── compose.yaml
├── email
│   ├── Dockerfile
│   ├── dovecot
│   │   ├── 10-auth.conf
│   │   ├── 10-mail.conf
│   │   ├── 10-master.conf
│   │   └── 10-ssl.conf
│   ├── mail.sh
│   ├── mailname
│   ├── postfix
│   │   └── main.cf
│   └── vmail
│       ├── redes
│       ├── suport
│       ├── tech
│       │   └── Maildir
│       │       ├── dovecot-uidlist
│       │       ├── dovecot-uidvalidity
│       │       ├── dovecot-uidvalidity.6a0dfd6b
│       │       ├── dovecot.index.log
│       │       ├── dovecot.mailbox.log
│       │       └── subscriptions
│       └── usuario
├── proxy
│   └── default.conf
└── web
    ├── site1
    │   └── index.html
    ├── site2
    │   └── index.html
    └── site3
    
Autor: JOÃO VITOR DOS SANTOS NASCIMENTO
