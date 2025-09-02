use credit_Card;

-- 1.- DESCRIPCION DE LA TABLA IMPORTADA
describe bankchurners;

-- 2.-  EXTRAER VALORES UNICOS DE CADA DIMENSION

-- Valores únicos de nivel de educación
SELECT DISTINCT Education_Level AS nivel_educacion
FROM credit_card.bankchurners
ORDER BY nivel_educacion;

-- Valores únicos de estado civil
SELECT DISTINCT Marital_Status AS estado_civil
FROM credit_card.bankchurners
ORDER BY estado_civil;

-- Valores únicos de categoría de ingreso
SELECT DISTINCT Income_Category AS categoria_ingreso
FROM credit_card.bankchurners
ORDER BY categoria_ingreso;

-- Valores únicos de categoría de tarjeta
SELECT DISTINCT Card_Category AS tipo_tarjeta
FROM credit_card.bankchurners
ORDER BY tipo_tarjeta;

-- Valores únicos de bandera de attrition (churn)
SELECT DISTINCT Attrition_Flag AS flag_baja
FROM credit_card.bankchurners
ORDER BY flag_baja;

-- Valores únicos de género
SELECT DISTINCT Gender AS genero
FROM credit_card.bankchurners
ORDER BY genero;

--- 3.-creacion de tablas dimensionales
-- 3.1 dim_educacion
CREATE TABLE dim_educacion (
  id_educacion     TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  nivel_educacion  VARCHAR(20)       NOT NULL,
  PRIMARY KEY (id_educacion),
  UNIQUE KEY ux_dim_educacion (nivel_educacion)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 3.2 dim_estado_civil
CREATE TABLE  dim_estado_civil (
  id_estado_civil  TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  estado_civil     VARCHAR(15)       NOT NULL,
  PRIMARY KEY (id_estado_civil),
  UNIQUE KEY ux_dim_estado_civil (estado_civil)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 3.3 dim_categoria_ingreso
CREATE TABLE  dim_categoria_ingreso (
  id_categoria_ingreso TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  categoria_ingreso    VARCHAR(20)       NOT NULL,
  PRIMARY KEY (id_categoria_ingreso),
  UNIQUE KEY ux_dim_categoria_ingreso (categoria_ingreso)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 3.4 dim_tipo_tarjeta
CREATE TABLE  dim_tipo_tarjeta (
  id_tipo_tarjeta  TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  tipo_tarjeta     VARCHAR(20)       NOT NULL,
  PRIMARY KEY (id_tipo_tarjeta),
  UNIQUE KEY ux_dim_tipo_tarjeta (tipo_tarjeta)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 3.5 dim_genero
CREATE TABLE   dim_genero (
  id_genero       TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  genero          CHAR(1)           NOT NULL,
  PRIMARY KEY (id_genero),
  UNIQUE KEY ux_dim_genero (genero)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 4.6 dim_estado_cliente
CREATE TABLE  dim_estado_cliente (
  id_estado_cliente  TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  estado_cliente     VARCHAR(25)       NOT NULL,
  PRIMARY KEY (id_estado_cliente),
  UNIQUE KEY ux_dim_estado_cliente (estado_cliente)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- 5. Diseñar la tabla de hechos llamada clientes y hacer otros ajustes a la base de datos



-- 5.1 Crear tabla clientes 
CREATE TABLE clientes (
  cliente_num               INT UNSIGNED       NOT NULL,
  id_educacion              TINYINT UNSIGNED   NOT NULL,
  id_estado_civil           TINYINT UNSIGNED   NOT NULL,
  id_categoria_ingreso      TINYINT UNSIGNED   NOT NULL,
  id_tipo_tarjeta           TINYINT UNSIGNED   NOT NULL,
  id_genero                 TINYINT UNSIGNED   NOT NULL,
  id_estado_cliente         TINYINT UNSIGNED   NOT NULL,
  customer_age              SMALLINT UNSIGNED  NOT NULL,
  dependent_count           TINYINT UNSIGNED   NOT NULL,
  months_on_book            SMALLINT UNSIGNED  NOT NULL,
  total_relationship_count  TINYINT UNSIGNED   NOT NULL,
  months_inactive_12_mon    TINYINT UNSIGNED   NOT NULL,
  contacts_count_12_mon     TINYINT UNSIGNED   NOT NULL,
  credit_limit              DECIMAL(12,2)      NOT NULL,
  total_revolving_bal       DECIMAL(12,2)      NOT NULL,
  avg_open_to_buy           DECIMAL(12,2)      NOT NULL,
  total_amt_chng_q4_q1      DECIMAL(6,3)       NOT NULL,
  total_trans_amt           DECIMAL(12,2)      NOT NULL,
  total_trans_ct            INT UNSIGNED       NOT NULL,
  total_ct_chng_q4_q1       DECIMAL(6,3)       NOT NULL,
  avg_utilization_ratio     DECIMAL(5,4)       NOT NULL,
  PRIMARY KEY (cliente_num),
  FOREIGN KEY (id_educacion)          REFERENCES dim_educacion       (id_educacion),
  FOREIGN KEY (id_estado_civil)       REFERENCES dim_estado_civil    (id_estado_civil),
  FOREIGN KEY (id_categoria_ingreso)  REFERENCES dim_categoria_ingreso(id_categoria_ingreso),
  FOREIGN KEY (id_tipo_tarjeta)       REFERENCES dim_tipo_tarjeta     (id_tipo_tarjeta),
  FOREIGN KEY (id_genero)             REFERENCES dim_genero           (id_genero),
  FOREIGN KEY (id_estado_cliente)     REFERENCES dim_estado_cliente   (id_estado_cliente)
) ENGINE=InnoDB
  DEFAULT CHARSET = utf8mb4
  COMMENT = 'Tabla de clientes con atributos demográficos y métricas financieras';

-- 5.2 Renombrar tabla original de staging

RENAME TABLE bankchurners TO stg_dataset;
SHOW TABLES LIKE 'stg_dataset';
SELECT COUNT(*) FROM stg_dataset;

-- 5.3 Validaciones del modelo mostrando relaciones con las otras tablas

SHOW TABLES LIKE 'dim_%';

SHOW CREATE TABLE clientes;

-- 6. Insercion de datos

-- 6.1 Educacion
INSERT INTO dim_educacion (nivel_educacion) VALUES
  ('College'),
  ('Doctorate'),
  ('Graduate'),
  ('High School'),
  ('Post-Graduate'),
  ('Uneducated'),
  ('Unknown');



-- 6.2 Estado civil
INSERT INTO dim_estado_civil (estado_civil) VALUES
  ('Divorced'),
  ('Married'),
  ('Single'),
  ('Unknown');



-- 6.3 categoria ingreso
INSERT INTO dim_categoria_ingreso (categoria_ingreso) VALUES
  ('$120K +'),
  ('$40K - $60K'),
  ('$60K - $80K'),
  ('$80K - $120K'),
  ('Less than $40K'),
  ('Unknown');


-- 6.4 tipo_tarjeta
INSERT INTO dim_tipo_tarjeta (tipo_tarjeta) VALUES
  ('Blue'),
  ('Gold'),
  ('Platinum'),
  ('Silver');


-- 6.5 estado cliente
INSERT INTO dim_estado_cliente (estado_cliente) VALUES
  ('Attrited Customer'),
  ('Existing Customer');


-- 6.6 Genero

INSERT INTO dim_genero (genero) VALUES
  ('F'),
  ('M');

-- 6.7 Validar datos ingresados
SELECT 'dim_educacion' AS tabla, COUNT(*) FROM dim_educacion
UNION ALL
SELECT 'dim_estado_civil', COUNT(*) FROM dim_estado_civil
UNION ALL
SELECT 'dim_categoria_ingreso', COUNT(*) FROM dim_categoria_ingreso
UNION ALL
SELECT 'dim_tipo_tarjeta', COUNT(*) FROM dim_tipo_tarjeta
UNION ALL
SELECT 'dim_estado_cliente', COUNT(*) FROM dim_estado_cliente
UNION ALL
SELECT 'dim_genero', COUNT(*) FROM dim_genero;


-- 7. MIGRACION FINAL DESDE EL STG_DATASET HASTA LA TABLA DE HECHOS CLIENTE
USE credit_card;

-- 7.1 Validación previa de correspondencias para detectar filas huérfanas
SELECT 
  s.CLIENTNUM,
  s.Education_Level,
  s.Marital_Status,
  s.Income_Category,
  s.Card_Category,
  s.Gender,
  s.Attrition_Flag
FROM stg_dataset s
LEFT JOIN dim_educacion         de  ON TRIM(s.Education_Level)  = de.nivel_educacion
LEFT JOIN dim_estado_civil      dsc ON TRIM(s.Marital_Status)   = dsc.estado_civil
LEFT JOIN dim_categoria_ingreso dci ON TRIM(s.Income_Category)  = dci.categoria_ingreso
LEFT JOIN dim_tipo_tarjeta      dtt ON TRIM(s.Card_Category)    = dtt.tipo_tarjeta
LEFT JOIN dim_genero            dg  ON TRIM(s.Gender)           = dg.genero
LEFT JOIN dim_estado_cliente    esc ON TRIM(s.Attrition_Flag)   = esc.estado_cliente
WHERE 
  de.id_educacion IS NULL
  OR dsc.id_estado_civil IS NULL
  OR dci.id_categoria_ingreso IS NULL
  OR dtt.id_tipo_tarjeta IS NULL
  OR dg.id_genero IS NULL
  OR esc.id_estado_cliente IS NULL
LIMIT 10;


-- 7.2 Inserción definitiva

START TRANSACTION;

INSERT INTO clientes (
  cliente_num,
  id_educacion,
  id_estado_civil,
  id_categoria_ingreso,
  id_tipo_tarjeta,
  id_genero,
  id_estado_cliente,
  customer_age,
  dependent_count,
  months_on_book,
  total_relationship_count,
  months_inactive_12_mon,
  contacts_count_12_mon,
  credit_limit,
  total_revolving_bal,
  avg_open_to_buy,
  total_amt_chng_q4_q1,
  total_trans_amt,
  total_trans_ct,
  total_ct_chng_q4_q1,
  avg_utilization_ratio
)
SELECT
  s.CLIENTNUM,
  de.id_educacion,
  dsc.id_estado_civil,
  dci.id_categoria_ingreso,
  dtt.id_tipo_tarjeta,
  dg.id_genero,
  esc.id_estado_cliente,
  s.Customer_Age,
  s.Dependent_count,
  s.Months_on_book,
  s.Total_Relationship_Count,
  s.Months_Inactive_12_mon,
  s.Contacts_Count_12_mon,
  s.Credit_Limit,
  s.Total_Revolving_Bal,
  s.Avg_Open_To_Buy,
  s.Total_Amt_Chng_Q4_Q1,
  s.Total_Trans_Amt,
  s.Total_Trans_Ct,
  s.Total_Ct_Chng_Q4_Q1,
  s.Avg_Utilization_Ratio
FROM stg_dataset AS s
JOIN dim_educacion         AS de  ON TRIM(s.Education_Level)  = de.nivel_educacion
JOIN dim_estado_civil      AS dsc ON TRIM(s.Marital_Status)   = dsc.estado_civil
JOIN dim_categoria_ingreso AS dci ON TRIM(s.Income_Category)  = dci.categoria_ingreso
JOIN dim_tipo_tarjeta      AS dtt ON TRIM(s.Card_Category)    = dtt.tipo_tarjeta
JOIN dim_genero            AS dg  ON TRIM(s.Gender)           = dg.genero
JOIN dim_estado_cliente    AS esc ON TRIM(s.Attrition_Flag)   = esc.estado_cliente;

COMMIT;

-- 7.3 Validar que los datos esten insertados correctamente
-- 7.3.1 Contar datos de origen vs datos de destino
SELECT 
  (SELECT COUNT(*) FROM stg_dataset) AS origen,
  (SELECT COUNT(*) FROM clientes)    AS destino;
  
  -- 7.3.2 Revisar estadísticas de las métricas clave
  SELECT
  MIN(credit_limit)            AS min_limit,
  MAX(credit_limit)            AS max_limit,
  MIN(avg_utilization_ratio)   AS min_util,
  MAX(avg_utilization_ratio)   AS max_util,
  SUM(credit_limit IS NULL)    AS nulos_limit,
  SUM(avg_utilization_ratio IS NULL) AS nulos_util
FROM clientes;
-- 7.3.3 Mostrar datos
SELECT cliente_num, customer_age, credit_limit, avg_utilization_ratio
FROM clientes
ORDER BY cliente_num
LIMIT 5;
-- 7.4 Limpieza de staging

DROP TABLE IF EXISTS stg_dataset;



-- 8. Conversion de datos al castellano
-- 8.1 Cambiar nombres de columnas en  la tabla clientes


-- 8.1.1 Listar los nombres de las FK
SELECT 
  constraint_name,
  column_name
FROM information_schema.key_column_usage
WHERE table_schema = 'credit_card'
  AND table_name   = 'clientes'
  AND referenced_table_name IS NOT NULL;

-- 8.1.2 Eliminar FKs y PK

ALTER TABLE clientes
  DROP FOREIGN KEY clientes_ibfk_1,
  DROP FOREIGN KEY clientes_ibfk_2,
  DROP FOREIGN KEY clientes_ibfk_3,
  DROP FOREIGN KEY clientes_ibfk_4,
  DROP FOREIGN KEY clientes_ibfk_5,
  DROP FOREIGN KEY clientes_ibfk_6,
  DROP PRIMARY KEY;

-- 8.1.3. Renombrar columnas al castellano
ALTER TABLE clientes
  RENAME COLUMN cliente_num               TO numero_cliente,
  RENAME COLUMN customer_age              TO edad,
  RENAME COLUMN dependent_count           TO cantidad_dependientes,
  RENAME COLUMN months_on_book            TO meses_antiguedad,
  RENAME COLUMN total_relationship_count  TO total_relaciones,
  RENAME COLUMN months_inactive_12_mon    TO meses_inactividad_12m,
  RENAME COLUMN contacts_count_12_mon     TO contactos_12m,
  RENAME COLUMN credit_limit              TO limite_credito,
  RENAME COLUMN total_revolving_bal       TO saldo_rotativo_total,
  RENAME COLUMN avg_open_to_buy           TO promedio_disponible,
  RENAME COLUMN total_amt_chng_q4_q1      TO variacion_monto_q4_q1,
  RENAME COLUMN total_trans_amt           TO monto_transacciones_total,
  RENAME COLUMN total_trans_ct            TO cantidad_transacciones,
  RENAME COLUMN total_ct_chng_q4_q1       TO variacion_ct_q4_q1,
  RENAME COLUMN avg_utilization_ratio     TO ratio_utilizacion_promedio;

-- 8.1.4 Recrear PK y FKs
-- 
ALTER TABLE clientes
  ADD PRIMARY KEY (numero_cliente),
  ADD CONSTRAINT fk_clientes_educacion
    FOREIGN KEY (id_educacion) REFERENCES dim_educacion(id_educacion),
  ADD CONSTRAINT fk_clientes_estado_civil
    FOREIGN KEY (id_estado_civil) REFERENCES dim_estado_civil(id_estado_civil),
  ADD CONSTRAINT fk_clientes_categoria_ingreso
    FOREIGN KEY (id_categoria_ingreso) REFERENCES dim_categoria_ingreso(id_categoria_ingreso),
  ADD CONSTRAINT fk_clientes_tipo_tarjeta
    FOREIGN KEY (id_tipo_tarjeta) REFERENCES dim_tipo_tarjeta(id_tipo_tarjeta),
  ADD CONSTRAINT fk_clientes_genero
    FOREIGN KEY (id_genero) REFERENCES dim_genero(id_genero),
  ADD CONSTRAINT fk_clientes_estado_cliente
    FOREIGN KEY (id_estado_cliente) REFERENCES dim_estado_cliente(id_estado_cliente);

-- 8.1.5 Validar cambios
SHOW CREATE TABLE clientes;


-- 8.2 Castellanizar los datos de las tablas dimensionales
-- 8.2.1 dim_educacion
UPDATE dim_educacion
SET nivel_educacion = 'Universidad'
WHERE nivel_educacion = 'College';
UPDATE dim_educacion
SET nivel_educacion = 'Doctorado'
WHERE nivel_educacion = 'Doctorate';
UPDATE dim_educacion
SET nivel_educacion = 'Graduado'
WHERE nivel_educacion = 'Graduate';
UPDATE dim_educacion
SET nivel_educacion = 'Secundaria'
WHERE nivel_educacion = 'High School';
UPDATE dim_educacion
SET nivel_educacion = 'Postgrado'
WHERE nivel_educacion = 'Post-Graduate';
UPDATE dim_educacion
SET nivel_educacion = 'Sin educación'
WHERE nivel_educacion = 'Uneducated';
UPDATE dim_educacion
SET nivel_educacion = 'Desconocido'
WHERE nivel_educacion = 'Unknown';

-- 8.2.2 dim_estado_civil
UPDATE dim_estado_civil
SET estado_civil = 'Divorciado'
WHERE estado_civil = 'Divorced';
UPDATE dim_estado_civil
SET estado_civil = 'Casado'
WHERE estado_civil = 'Married';
UPDATE dim_estado_civil
SET estado_civil = 'Soltero'
WHERE estado_civil = 'Single';
UPDATE dim_estado_civil
SET estado_civil = 'Desconocido'
WHERE estado_civil = 'Unknown';

-- 8.2.3 dim_categoria_ingreso
ALTER TABLE dim_categoria_ingreso
  MODIFY COLUMN categoria_ingreso VARCHAR(30) NOT NULL;

UPDATE dim_categoria_ingreso
SET categoria_ingreso = 'Más de USD 120.000'
WHERE categoria_ingreso = 'More than $120K';
UPDATE dim_categoria_ingreso
SET categoria_ingreso = 'USD 40.000 – USD 60.000'
WHERE categoria_ingreso = '$40K – $60K';
UPDATE dim_categoria_ingreso
SET categoria_ingreso = 'USD 60.000 – USD 80.000'
WHERE categoria_ingreso = '$60K – $80K';
UPDATE dim_categoria_ingreso
SET categoria_ingreso = 'USD 80.000 – USD 120.000'
WHERE categoria_ingreso = '$80K – $120K';
UPDATE dim_categoria_ingreso
SET categoria_ingreso = 'Menos de USD 40.000'
WHERE categoria_ingreso = 'Less than $40K';
UPDATE dim_categoria_ingreso
SET categoria_ingreso = 'Desconocido'
WHERE categoria_ingreso = 'Unknown';






-- 8.2.4 dim_estado_cliente
UPDATE dim_estado_cliente
SET estado_cliente = 'Cliente dado de baja'
WHERE estado_cliente = 'Attrited Customer';
UPDATE dim_estado_cliente
SET estado_cliente = 'Cliente existente'
WHERE estado_cliente = 'Existing Customer';

-- 8.2.5 verificaciones

SELECT * FROM dim_categoria_ingreso ORDER BY id_categoria_ingreso;
SELECT * FROM dim_educacion       ORDER BY id_educacion;
SELECT * FROM dim_estado_civil    ORDER BY id_estado_civil;
SELECT * FROM dim_estado_cliente  ORDER BY id_estado_cliente;


-- 9. Vistas y consultas
-- 9.1 Vista principal 

SELECT
  c.numero_cliente,
  de.nivel_educacion        AS educacion,
  ec.estado_civil           AS estado_civil,
  ci.categoria_ingreso      AS categoria_ingreso,
  tt.tipo_tarjeta           AS tipo_tarjeta,
  g.genero                  AS genero,
  cl.estado_cliente         AS estado_cliente,
  c.edad,
  c.cantidad_dependientes,
  c.meses_antiguedad,
  c.total_relaciones,
  c.meses_inactividad_12m,
  c.contactos_12m,
  c.limite_credito,
  c.saldo_rotativo_total,
  c.promedio_disponible,
  c.variacion_monto_q4_q1,
  c.monto_transacciones_total,
  c.cantidad_transacciones,
  c.variacion_ct_q4_q1,
  c.ratio_utilizacion_promedio
FROM clientes AS c
INNER JOIN dim_educacion           AS de ON c.id_educacion           = de.id_educacion
INNER JOIN dim_estado_civil        AS ec ON c.id_estado_civil        = ec.id_estado_civil
INNER JOIN dim_categoria_ingreso   AS ci ON c.id_categoria_ingreso   = ci.id_categoria_ingreso
INNER JOIN dim_tipo_tarjeta        AS tt ON c.id_tipo_tarjeta        = tt.id_tipo_tarjeta
INNER JOIN dim_genero              AS g  ON c.id_genero              = g.id_genero
INNER JOIN dim_estado_cliente      AS cl ON c.id_estado_cliente      = cl.id_estado_cliente;

-- 9.2 Vista detalle por cliente

CREATE OR REPLACE VIEW vw_clientes_detalle AS
SELECT
  c.numero_cliente,
  de.nivel_educacion        AS educacion,
  ec.estado_civil           AS estado_civil,
  ci.categoria_ingreso      AS categoria_ingreso,
  tt.tipo_tarjeta           AS tipo_tarjeta,
  g.genero                  AS genero,
  cl.estado_cliente         AS estado_cliente,
  c.edad,
  c.cantidad_dependientes,
  c.meses_antiguedad,
  c.total_relaciones,
  c.meses_inactividad_12m,
  c.contactos_12m,
  c.limite_credito,
  c.saldo_rotativo_total,
  c.promedio_disponible,
  c.variacion_monto_q4_q1,
  c.monto_transacciones_total,
  c.cantidad_transacciones,
  c.variacion_ct_q4_q1,
  c.ratio_utilizacion_promedio
FROM clientes AS c
INNER JOIN dim_educacion         AS de  ON c.id_educacion         = de.id_educacion
INNER JOIN dim_estado_civil      AS ec  ON c.id_estado_civil      = ec.id_estado_civil
INNER JOIN dim_categoria_ingreso AS ci  ON c.id_categoria_ingreso = ci.id_categoria_ingreso
INNER JOIN dim_tipo_tarjeta      AS tt  ON c.id_tipo_tarjeta      = tt.id_tipo_tarjeta
INNER JOIN dim_genero            AS g   ON c.id_genero            = g.id_genero
INNER JOIN dim_estado_cliente    AS cl  ON c.id_estado_cliente    = cl.id_estado_cliente;



-- 9.3 Tasa de churn por nivel educativo

CREATE OR REPLACE VIEW vw_churn_por_educacion AS
SELECT
  de.nivel_educacion AS educacion,
  COUNT(*)                                    AS total_clientes,
  SUM(cl.estado_cliente = 'Cliente dado de baja') AS atritados,
  ROUND(SUM(cl.estado_cliente = 'Cliente dado de baja')/COUNT(*), 4) AS tasa_churn
FROM vw_clientes_detalle cl
JOIN dim_educacion de ON cl.educacion = de.nivel_educacion
GROUP BY de.nivel_educacion;

-- 9.4 Límite de crédito promedio por categoría de ingreso

CREATE OR REPLACE VIEW vw_limite_promedio_por_ingreso AS
SELECT
  cl.categoria_ingreso,
  ROUND(AVG(cl.limite_credito), 2) AS limite_promedio,
  MIN(cl.limite_credito)          AS limite_min,
  MAX(cl.limite_credito)          AS limite_max
FROM vw_clientes_detalle cl
GROUP BY cl.categoria_ingreso;

-- 9.5 Utilización promedio de crédito por tipo de tarjeta
CREATE OR REPLACE VIEW vw_utilizacion_por_tarjeta AS
SELECT
  cl.tipo_tarjeta,
  ROUND(AVG(cl.ratio_utilizacion_promedio), 4) AS utilizacion_promedio
FROM vw_clientes_detalle cl
GROUP BY cl.tipo_tarjeta;

-- 9.6 Resumen transaccional por tipo de tarjeta
CREATE OR REPLACE VIEW vw_resumen_transaccional_tarjeta AS
SELECT
  cl.tipo_tarjeta,
  ROUND(AVG(cl.monto_transacciones_total), 2) AS avg_monto_transacciones,
  ROUND(AVG(cl.cantidad_transacciones), 2)    AS avg_cantidad_transacciones,
  ROUND(AVG(cl.variacion_monto_q4_q1), 3)     AS avg_var_monto_q4_q1
FROM vw_clientes_detalle cl
GROUP BY cl.tipo_tarjeta;

-- 9.7 Clasificación por género y tipo de tarjeta

CREATE OR REPLACE VIEW vw_clasificacion_genero_tarjeta AS
SELECT
  cl.genero,
  cl.tipo_tarjeta,
  COUNT(*) AS total_clientes,
  ROUND(AVG(cl.limite_credito), 2) AS limite_promedio,
  ROUND(AVG(cl.ratio_utilizacion_promedio), 4) AS utilizacion_promedio,
  SUM(cl.estado_cliente = 'Cliente dado de baja') AS atritados,
  ROUND(SUM(cl.estado_cliente = 'Cliente dado de baja') / COUNT(*), 4) AS tasa_churn
FROM vw_clientes_detalle cl
GROUP BY cl.genero, cl.tipo_tarjeta
ORDER BY cl.genero, cl.tipo_tarjeta;


-- 10. Consultas para analisis exploratorio

-- 10.1 vw_churn_por_educacion:

SELECT * FROM vw_churn_por_educacion;
-- 10.2 vw_limite_promedio_por_ingreso
SELECT * FROM vw_limite_promedio_por_ingreso;

-- 10.3  Utilizacion por tarjeta
SELECT * FROM vw_utilizacion_por_tarjeta;

-- 10.4 vw_resumen_transaccional_tarjeta
SELECT * FROM vw_resumen_transaccional_tarjeta; 

-- 10.5 vw_clasificacion_genero_tarjeta
SELECT * FROM vw_clasificacion_genero_tarjeta; 
