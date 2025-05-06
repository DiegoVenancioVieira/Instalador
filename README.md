# 📦 Instalador Whaticket Master

Este instalador foi criado para facilitar a instalação do Whaticket com Docker, Portainer e Traefik.

## ✅ Passo a passo

### 1. Clone este repositório
```bash
git clone https://github.com/SEU_USUARIO/whaticket-installer.git
cd whaticket-installer
```

### 2. Execute o instalador
```bash
bash install.sh
```

O script irá:
- Clonar automaticamente o projeto do Whaticket (sem você precisar baixar separado);
- Usar as variáveis do `.install-config` (ou perguntar caso ele não exista);
- Gerar o `.env` automaticamente;
- Substituir valores nos arquivos do projeto;
- Subir o ambiente com Docker Compose.

### 3. Configure (se quiser)
Edite `.install-config.example` com suas informações e salve como `.install-config`:

```bash
cp .install-config.example .install-config
nano .install-config
```

### 4. Acesse sua instalação
- Painel: `https://app.seusite.com.br`
- API: `https://api.seusite.com.br`

Feito para iniciantes. Nenhum conhecimento técnico necessário.
