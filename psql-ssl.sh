*\ conexao via SSl



import psycopg2

conn = psycopg2.connect(
    dbname="meu_banco",
    user="meu_usuario",
    password="minha_senha",
    host="meu_ip_remoto",
    port="5432",
    sslmode="require"  # Exige SSL
)
