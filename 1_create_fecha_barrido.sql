
-- Tabla intermedia con los valores STRING 
CREATE TABLE IF NOT EXISTS disparadores.fecha_barrido(
    CUENTA_SAT STRING,
    FECHA_BARRIDO STRING,
    ESTATUS_BC STRING,
    FILE_DATE STRING,
    LAST_UPDATE STRING
);

-- Tabla final/trf con respectivos valores
CREATE TABLE IF NOT EXISTS disparadores_trf.fecha_barrido(
    CUENTA_SAT INTEGER,
    FECHA_BARRIDO DATE,
    ESTATUS_BC STRING,
    FILE_DATE DATE,
    LAST_UPDATE DATE
);

