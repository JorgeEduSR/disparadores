-- Reprocesamiento de eliminacion de registros 
DELETE FROM disparadores_trf.fecha_barrido WHERE LAST_UPDATE = CURRENT_DATE('America/Monterrey')

-- Carga normal de la tabla intermedia a la tabla final
INSERT disparadores_trf.fecha_barrido(
    CUENTA_SAT,
    FECHA_BARRIDO,
    ESTATUS_BC,
    FILE_DATE,
    LAST_UPDATE
) WITH W AS (
    SELECT
    SAFE_CAST (CUENTA_SAT AS INTEGER) AS CUENTA_SAT,
    SAFE_CAST (FECHA_BARRIDO AS DATE) AS FECHA_BARRIDO,
    SAFE_CAST (ESTATUS_BC AS STRING) AS ESTATUS_BC,
    SAFE_CAST (source.FILE_DATE AS DATE) AS FILE_DATE,
    CURRENT_DATE('America/Monterrey') AS LAST_UPDATE
    FROM disparadores.nombre_de_la_tabla AS source);


-- Auditoria de datos, no realizar el codigo hasta despues
INSERT INTO audit.audit_table_log(
    dateset, 
    table_name,
    type,
    last_update_date,
    row
) VALUES (
    'disparadores_trf',
    'nombre_de_la_tabla',
    'INSERT',
    CURRENT_DATE('America/Monterrey'),
    (SELECT COUNT(*) FROM disparadores_trf.fecha_barrido WHERE LAST_UPDATE = CURRENT_DATE('America/Monterrey'));
);

