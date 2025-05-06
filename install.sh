#!/bin/bash

CONFIG_FILE=".install-config"
read -p "Cole aqui seu token GitHub (fine-grained): " GITHUB_TOKEN
WHATICKET_REPO_URL=git clone https://${GITHUB_TOKEN}@github.com/DiegoVenancioVieira/whaticketmaster.git

WHATICKET_DIR="../whaticketmaster"

echo "🚀 Instalador Whaticket Master"
echo "=============================="

# Clonar repositório do Whaticket se não existir
if [ ! -d "$WHATICKET_DIR" ]; then
  echo "📥 Clonando repositório Whaticket..."
  git clone $WHATICKET_REPO_URL $WHATICKET_DIR
else
  echo "📁 Repositório do Whaticket já está presente. Pulando clone."
fi

# Carrega variáveis do arquivo .install-config ou pergunta ao usuário
if [ -f "$CONFIG_FILE" ]; then
  echo "🔍 Lendo variáveis de $CONFIG_FILE"
  export $(grep -v '^#' "$CONFIG_FILE" | xargs)
else
  echo "⚠️ Arquivo $CONFIG_FILE não encontrado. Vamos criar um novo com as informações."

  read -p "Domínio do BACKEND (ex: api.exemplo.com.br): " BACKEND_URL
  read -p "Domínio do FRONTEND (ex: app.exemplo.com.br): " FRONTEND_URL
  read -p "Senha do Postgres: " DB_PASS
  read -p "Fuso horário (ex: America/Sao_Paulo): " TZ
  read -p "E-mail SMTP (ex: contato@seudominio.com): " MAIL_USER
  read -p "Senha SMTP: " MAIL_PASS
  read -p "Nome de envio do e-mail (ex: Suporte <contato@seudominio.com>): " MAIL_FROM

  DB_HOST="postgres_whaticket"
  DB_PORT="5432"
  DB_USER="postgres"
  DB_NAME="whaticket"
  JWT_SECRET=$(openssl rand -base64 32)
  JWT_REFRESH_SECRET=$(openssl rand -base64 32)
  PORT="3000"
  PROXY_PORT="443"
  CHROME_ARGS="--no-sandbox --disable-setuid-sandbox"
  REDIS_URI="redis://:$DB_PASS@whaticket_redis:6379"
  REDIS_OPT_LIMITER_MAX="1"
  REDIS_OPT_LIMITER_DURATION="3000"
  GERENCIANET_SANDBOX="false"
  GERENCIANET_CLIENT_ID=""
  GERENCIANET_CLIENT_SECRET=""
  GERENCIANET_PIX_CERT=""
  GERENCIANET_PIX_KEY=""
  USER_LIMIT="10000"
  CONNECTIONS_LIMIT="100000"
  CLOSED_SEND_BY_ME="true"
  MAIL_HOST="smtp.hostinger.com"
  MAIL_PORT="465"
  REACT_APP_BACKEND_URL="https://$BACKEND_URL"
  REACT_APP_HOURS_CLOSE_TICKETS_AUTO="24"

  cat <<EOF > $CONFIG_FILE
BACKEND_URL=https://$BACKEND_URL
FRONTEND_URL=https://$FRONTEND_URL
DB_HOST=$DB_HOST
DB_PORT=$DB_PORT
DB_USER=$DB_USER
DB_PASS=$DB_PASS
DB_NAME=$DB_NAME
TZ=$TZ
JWT_SECRET=$JWT_SECRET
JWT_REFRESH_SECRET=$JWT_REFRESH_SECRET
PORT=$PORT
PROXY_PORT=$PROXY_PORT
CHROME_ARGS=$CHROME_ARGS
REDIS_URI=$REDIS_URI
REDIS_OPT_LIMITER_MAX=$REDIS_OPT_LIMITER_MAX
REDIS_OPT_LIMITER_DURATION=$REDIS_OPT_LIMITER_DURATION
GERENCIANET_SANDBOX=$GERENCIANET_SANDBOX
GERENCIANET_CLIENT_ID=$GERENCIANET_CLIENT_ID
GERENCIANET_CLIENT_SECRET=$GERENCIANET_CLIENT_SECRET
GERENCIANET_PIX_CERT=$GERENCIANET_PIX_CERT
GERENCIANET_PIX_KEY=$GERENCIANET_PIX_KEY
USER_LIMIT=$USER_LIMIT
CONNECTIONS_LIMIT=$CONNECTIONS_LIMIT
CLOSED_SEND_BY_ME=$CLOSED_SEND_BY_ME
MAIL_HOST=$MAIL_HOST
MAIL_USER=$MAIL_USER
MAIL_PASS=$MAIL_PASS
MAIL_FROM=$MAIL_FROM
MAIL_PORT=$MAIL_PORT
REACT_APP_BACKEND_URL=$REACT_APP_BACKEND_URL
REACT_APP_HOURS_CLOSE_TICKETS_AUTO=$REACT_APP_HOURS_CLOSE_TICKETS_AUTO
EOF

  echo "✅ Arquivo $CONFIG_FILE criado."
  export $(grep -v '^#' "$CONFIG_FILE" | xargs)
fi

echo ""
echo "📦 Gerando arquivos de ambiente..."
cp $WHATICKET_DIR/.env.example $WHATICKET_DIR/.env

echo "🔧 Aplicando variáveis nos arquivos..."
chmod +x ./add-env-vars.sh
./add-env-vars.sh

echo "🐳 Subindo containers com Docker Compose..."
cd $WHATICKET_DIR
docker compose up -d --build

echo ""
echo "✅ Instalação concluída com sucesso!"
