
#!/bin/bash

echo "🔧 Aplicando variáveis de ambiente..."

# Lê variáveis da configuração
export $(grep -v '^#' .install-config | xargs)

# Caminho do projeto clonado
APP_PATH="../whaticketmaster"

# Substituições nos arquivos .env
cp $APP_PATH/.env.example $APP_PATH/.env

sed -i "s|https://api.example.com|$BACKEND_URL|g" $APP_PATH/.env
sed -i "s|https://app.example.com|$FRONTEND_URL|g" $APP_PATH/.env
sed -i "s|chrome_args_a_ser_mudado|$CHROME_ARGS|g" $APP_PATH/.env
sed -i "s/postgres_host_a_ser_mudado/$DB_HOST/g" $APP_PATH/.env
sed -i "s/porta_postgres_a_ser_mudada/$DB_PORT/g" $APP_PATH/.env
sed -i "s/usuario_postgres_a_ser_mudado/$DB_USER/g" $APP_PATH/.env
sed -i "s/senha_postgres_a_ser_mudada/$DB_PASS/g" $APP_PATH/.env
sed -i "s/nome_postgres_a_ser_mudado/$DB_NAME/g" $APP_PATH/.env
sed -i "s/fuso_horario_a_ser_mudado/$TZ/g" $APP_PATH/.env
sed -i "s/jwt_secreto_a_ser_mudado/$JWT_SECRET/g" $APP_PATH/.env
sed -i "s/jwt_refresh_secreto_a_ser_mudado/$JWT_REFRESH_SECRET/g" $APP_PATH/.env
sed -i "s/porta_backend_a_ser_mudada/$PORT/g" $APP_PATH/.env
sed -i "s/porta_proxy_a_ser_mudada/$PROXY_PORT/g" $APP_PATH/.env
sed -i "s/redis_uri_a_ser_mudado/$REDIS_URI/g" $APP_PATH/.env
sed -i "s/redis_limiter_max_a_ser_mudado/$REDIS_OPT_LIMITER_MAX/g" $APP_PATH/.env
sed -i "s/redis_limiter_duracao_a_ser_mudada/$REDIS_OPT_LIMITER_DURATION/g" $APP_PATH/.env
sed -i "s/gerencianet_sandbox_a_ser_mudado/$GERENCIANET_SANDBOX/g" $APP_PATH/.env
sed -i "s/gerencianet_client_id_a_ser_mudado/$GERENCIANET_CLIENT_ID/g" $APP_PATH/.env
sed -i "s/gerencianet_client_secret_a_ser_mudado/$GERENCIANET_CLIENT_SECRET/g" $APP_PATH/.env
sed -i "s/gerencianet_pix_cert_a_ser_mudado/$GERENCIANET_PIX_CERT/g" $APP_PATH/.env
sed -i "s/gerencianet_pix_key_a_ser_mudado/$GERENCIANET_PIX_KEY/g" $APP_PATH/.env
sed -i "s/user_limit_a_ser_mudado/$USER_LIMIT/g" $APP_PATH/.env
sed -i "s/connections_limit_a_ser_mudado/$CONNECTIONS_LIMIT/g" $APP_PATH/.env
sed -i "s/closed_send_by_me_a_ser_mudado/$CLOSED_SEND_BY_ME/g" $APP_PATH/.env
sed -i "s/mail_host_a_ser_mudado/$MAIL_HOST/g" $APP_PATH/.env
sed -i "s/mail_user_a_ser_mudado/$MAIL_USER/g" $APP_PATH/.env
sed -i "s/mail_pass_a_ser_mudado/$MAIL_PASS/g" $APP_PATH/.env
sed -i "s/mail_from_a_ser_mudado/$MAIL_FROM/g" $APP_PATH/.env
sed -i "s/mail_port_a_ser_mudada/$MAIL_PORT/g" $APP_PATH/.env
sed -i "s/hours_ticket_close_auto/$REACT_APP_HOURS_CLOSE_TICKETS_AUTO/g" $APP_PATH/.env
