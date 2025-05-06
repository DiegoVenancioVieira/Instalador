#!/bin/bash
set -e

echo "🚀 Instalador Whaticket Master"
echo "=============================="

# Solicita token do GitHub
read -p "Cole aqui seu token GitHub (fine-grained): " GITHUB_TOKEN

# Valida token e clona repositório
echo "📥 Clonando repositório Whaticket..."
git clone https://${GITHUB_TOKEN}@github.com/DiegoVenancioVieira/whaticketmaster.git ../whaticketmaster || {
  echo "❌ Erro ao clonar repositório. Verifique token ou permissões."
  exit 1
}

# Carrega ou cria arquivo .install-config
CONFIG_FILE=".install-config"
if [ ! -f "$CONFIG_FILE" ]; then
  echo "⚠️ Arquivo .install-config não encontrado. Vamos criar um novo com as informações."

  read -p "Domínio do BACKEND (ex: api.exemplo.com.br): " BACKEND_URL
  read -p "Domínio do FRONTEND (ex: app.exemplo.com.br): " FRONTEND_URL
  read -p "Senha do Postgres: " DB_PASS
  read -p "Fuso horário (ex: America/Sao_Paulo): " TZ
  read -p "E-mail SMTP (ex: contato@seudominio.com): " MAIL_USER
  read -p "Senha SMTP: " MAIL_PASS
  read -p "Nome de envio do e-mail (ex: Suporte <contato@seudominio.com>): " MAIL_FROM

  cat <<EOF > $CONFIG_FILE
DB_HOST=postgres_whaticket
DB_PORT=5432
DB_USER=postgres
DB_PASS=$DB_PASS
DB_NAME=whaticket
TZ=$TZ

JWT_SECRET=$(openssl rand -base64 32)
JWT_REFRESH_SECRET=$(openssl rand -base64 32)
PORT=3000
PROXY_PORT=443
BACKEND_URL=$BACKEND_URL
FRONTEND_URL=$FRONTEND_URL
CHROME_ARGS="--no-sandbox --disable-setuid-sandbox"

REDIS_URI=redis://:12345@whaticket_redis:6379
REDIS_OPT_LIMITER_MAX=1
REDIS_OPT_LIMITER_DURATION=3000

GERENCIANET_SANDBOX=false
GERENCIANET_CLIENT_ID=
GERENCIANET_CLIENT_SECRET=
GERENCIANET_PIX_CERT=
GERENCIANET_PIX_KEY=

USER_LIMIT=10000
CONNECTIONS_LIMIT=100000
CLOSED_SEND_BY_ME=true

MAIL_HOST=smtp.hostinger.com
MAIL_USER=$MAIL_USER
MAIL_PASS=$MAIL_PASS
MAIL_FROM="$MAIL_FROM"
MAIL_PORT=465

REACT_APP_BACKEND_URL=$BACKEND_URL
REACT_APP_HOURS_CLOSE_TICKETS_AUTO=24
EOF

  echo "✅ Arquivo .install-config criado."
fi

echo "📦 Lendo e exportando variáveis..."
source "$CONFIG_FILE"

# Cria .env a partir do modelo
echo "📦 Gerando arquivos de ambiente..."
if [ ! -f ../whaticketmaster/.env.example ]; then
  echo "❌ .env.example ausente no repositório. Abortando."
  exit 1
fi
cp ../whaticketmaster/.env.example ../whaticketmaster/.env

# Aplica variáveis
echo "🔧 Aplicando variáveis nos arquivos..."
chmod +x add-env-vars.sh
./add-env-vars.sh

# Sobe os containers
echo "🐳 Subindo containers com Docker Compose..."
cd ../whaticketmaster
docker compose up -d

echo "✅ Instalação concluída com sucesso!"
