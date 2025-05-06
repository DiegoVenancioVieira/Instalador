# 📦 Instalador Whaticket Master

Bem-vindo ao instalador automático do **Whaticket Master**!

Este instalador foi criado para facilitar a vida de quem não tem familiaridade com servidores ou programação. Com apenas alguns passos simples, você terá tudo funcionando com **Docker, Traefik e Portainer**.

> 🔒 Este instalador utiliza um repositório privado com token de acesso para baixar o sistema. Em breve, o acesso será controlado por tokens únicos adquiridos na compra.

---

## ✅ Passo a passo para instalação

### 1️⃣ Clone este repositório de instalação

Abra o terminal do seu servidor e execute:

```bash
cd /opt
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

💡 Caso apareça erro informando que `nano` não foi encontrado, instale com:

```bash
sudo apt update && sudo apt install nano -y
cp .install-config.example .install-config
nano .install-config
```

✍️ Preencha com os domínios, senha do banco, e-mail SMTP, entre outros.

💾 Salvar e sair no nano:
- Pressione `Ctrl + O` e depois `Enter` para salvar.
- Pressione `Ctrl + X` para sair.

---

### 3️⃣ Execute o instalador

```bash
cd /opt/Instalador
bash install.sh
```

🔑 O instalador irá solicitar que você cole o **token de acesso do GitHub**.
> Solicite o token de acesso no whatsapp: 

---

### 4️⃣ Acesse seu sistema

Após a instalação, acesse:

- 🖥️ Painel Web (Frontend): `https://app.seusite.com.br`
- 🔗 API (Backend): `https://api.seusite.com.br`
- ⚙️ Portainer: `https://portainer.seusite.com.br` *(se já estiver instalado)*

---

### 🔍 Verificar se o Whaticket está funcionando

Para verificar **somente os containers do Whaticket**, execute:

```bash
docker ps --filter name=whaticket
```

Você deverá ver 4 containers: `whaticket_backend`, `whaticket_frontend`, `postgres_whaticket` e `whaticket_redis`.

Para ver logs em tempo real do backend:

```bash
docker logs -f whaticketmaster-whaticket_backend-1
```

---

## 🛠 Suporte

Caso algo não funcione como esperado:

- Verifique se seu domínio e DNS estão configurados corretamente (Cloudflare, Registro.br etc);
- Confirme se o servidor possui Docker, Docker Compose, Portainer e Traefik instalados;
- Veja os logs com:

```bash
docker compose logs -f
```
- Copiar e enviar o log de erro para o whatsapp:

Feito com ❤️ para facilitar sua jornada digital.

**Whaticket Master – Sua comunicação mais inteligente.**
