
# 📦 Instalador Whaticket Master

Bem-vindo ao instalador automático do **Whaticket Master**!

Este instalador foi criado para facilitar a vida de quem não tem familiaridade com servidores ou programação. Com apenas alguns passos simples, você terá tudo funcionando com **Docker, Traefik e Portainer**.

> 🔒 Este instalador utiliza um repositório privado com token de acesso para baixar o sistema. Em breve, o acesso será controlado por tokens únicos adquiridos na compra.

---

## ✅ Passo a passo para instalação

### 1️⃣ Clone este repositório de instalação

Abra o terminal do seu servidor e execute:

```bash
git clone https://github.com/DiegoVenancioVieira/Instalador.git
cd Instalador
```

---

### 2️⃣ Configure as variáveis do sistema

Edite o arquivo `.install-config.example` com suas informações e salve como `.install-config`:

```bash
cp .install-config.example .install-config
nano .install-config
```

Preencha com os domínios, senha do banco, e-mail SMTP, entre outros.

> 🧠 **Dica:** Isso evita que você tenha que digitar tudo durante a instalação.

---

### 3️⃣ Execute o instalador

```bash
bash install.sh
```

O script irá:
- ✅ Clonar automaticamente o projeto do Whaticket (com token de acesso);
- ✅ Ler suas variáveis do `.install-config` (ou perguntar se não existir);
- ✅ Gerar o arquivo `.env` pronto;
- ✅ Substituir os valores corretos nos arquivos do sistema;
- ✅ Subir todos os containers com Docker Compose.

---

### 🌐 Acesse seu sistema

Após a instalação, acesse:

- 🖥️ Painel Web (Frontend): `https://app.seusite.com.br`
- 🔗 API (Backend): `https://api.seusite.com.br`
- ⚙️ Portainer: `https://portainer.seusite.com.br` *(se já estiver instalado)*

---

## 🛠 Suporte

Caso algo não funcione como esperado:

- Verifique se seu domínio e DNS estão configurados corretamente (Cloudflare, Registro.br etc);
- Confirme se o servidor possui Docker, Docker Compose, Portainer e Traefik instalados;
- Veja os logs com:

```bash
docker compose logs -f
```

---

Feito com ❤️ para facilitar sua jornada digital.

Whaticket Master - Sua comunicação mais inteligente.
