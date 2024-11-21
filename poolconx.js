const { Pool } = require('pg');

const pool = new Pool({
  user: 'meu_usuario',
  host: 'localhost',
  database: 'meu_banco',
  password: 'minha_senha',
  port: 6432, // Porta do PgBouncer
  max: 10,    // Máximo de conexões simultâneas
});

(async () => {
  const res = await pool.query('SELECT * FROM minha_tabela');
  console.log(res.rows);
})();
