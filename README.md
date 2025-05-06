# 📦 Instalador Whaticket Master

Este instalador foi criado para facilitar a instalação do Whaticket com Docker, Portainer e Traefik.

## ✅ Passo a passo

### 1. Clone este repositório
```bash
git clone https://github.com/SEU_USUARIO/whaticket-installer.git
cd whaticket-installer
```

### 2. Clone também o projeto Whaticket
```bash
git clone https://github.com/SEU_USUARIO/whaticketmaster.git
```

Sua estrutura deve ficar assim:
```
📂 sua-pasta/
├── 📁 whaticket-installer/
├── 📁 whaticketmaster/
```

### 3. Configure o instalador
Edite `.install-config.example` com suas informações e salve como `.install-config`:

```bash
cp .install-config.example .install-config
nano .install-config
```

### 4. Execute o instalador
```bash
bash install.sh
```

Ele irá gerar o `.env`, aplicar variáveis nos arquivos do projeto e subir o ambiente com Docker.

### 5. Acesse sua instalação
- Painel: `https://app.seusite.com.br`
- API: `https://api.seusite.com.br`

Feito para iniciantes. Nenhum conhecimento técnico necessário.
