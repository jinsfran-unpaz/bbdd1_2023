USE Empleados;

SET @tiempoini=NOW(6);

DROP TABLE IF EXISTS valores_esperados, valores_encontrados;
CREATE TABLE valores_esperados (
    tabla   VARCHAR(30)  NOT NULL PRIMARY KEY,
    regs    INT          NOT NULL,
    crc_md5 VARCHAR(100) NOT NULL
);

CREATE TABLE valores_encontrados (
    tabla   VARCHAR(30)  NOT NULL PRIMARY KEY,
    regs    INT          NOT NULL,
    crc_md5 VARCHAR(100) NOT NULL
);

INSERT INTO valores_esperados VALUES 
('empleados',   300024,'4ec56ab5ba37218d187cf6ab09ce1aa1'),
('departamentos',      9,'26eb605e3ec58718f8d588f005b3d2aa'),
('dept_respo',    24,'8720e2f0853ac9096b689c14664f847e'),
('dept_emp',    331603,'ccf6fe516f990bdaa49713fc478701b7'),
('puestos',      443308,'bfa016c472df68e70a03facafa1bc0a8'),
('sueldos',   2844047,'fd220654e95aea1b169624ffe3fca934');
SELECT tabla, regs AS registros_esperados, crc_md5 AS crc_esperado FROM valores_esperados;

SET @crc= '';
DROP TABLE IF EXISTS tchecksum;
CREATE TABLE tchecksum (chk char(100));
INSERT INTO tchecksum 
    SELECT @crc := MD5(CONCAT_WS('#',@crc,id_emp,fecha_nacimiento,nombre,apellido,genero,fecha_alta)) 
    FROM empleados ORDER BY id_emp;
INSERT INTO valores_encontrados VALUES ('empleados', (SELECT COUNT(*) FROM empleados),@crc);

SET @crc = '';
INSERT INTO tchecksum 
    SELECT @crc := MD5(CONCAT_WS('#',@crc, id_dept,nombre_dept)) 
    FROM departamentos ORDER BY id_dept;
INSERT INTO valores_encontrados VALUES ('departamentos', (SELECT COUNT(*) FROM departamentos), @crc);

SET @crc = '';
INSERT INTO tchecksum 
    SELECT @crc := MD5(CONCAT_WS('#',@crc, id_dept,id_emp, fecha_desde,fecha_hasta)) 
    FROM dept_respo ORDER BY id_dept,id_emp;
INSERT INTO valores_encontrados VALUES ('dept_respo', (SELECT COUNT(*) FROM dept_respo), @crc);

SET @crc = '';
INSERT INTO tchecksum 
    SELECT @crc := MD5(CONCAT_WS('#',@crc, id_dept,id_emp, fecha_desde,fecha_hasta)) 
    FROM dept_emp ORDER BY id_dept,id_emp;
INSERT INTO valores_encontrados VALUES ('dept_emp', (SELECT COUNT(*) FROM dept_emp), @crc);

SET @crc = '';
INSERT INTO tchecksum 
    SELECT @crc := MD5(CONCAT_WS('#',@crc, id_emp, puesto, fecha_desde,fecha_hasta)) 
    FROM puestos ORDER BY id_emp,puesto,fecha_desde;
INSERT INTO valores_encontrados VALUES ('puestos', (SELECT COUNT(*) FROM puestos), @crc);

SET @crc = '';
INSERT INTO tchecksum 
    SELECT @crc := MD5(CONCAT_WS('#',@crc, id_emp, sueldo, fecha_desde,fecha_hasta)) 
    FROM sueldos ORDER BY id_emp,fecha_desde,fecha_hasta;
INSERT INTO valores_encontrados VALUES ('sueldos', (SELECT COUNT(*) FROM sueldos), @crc);

DROP TABLE IF EXISTS tchecksum;

SELECT tabla, regs AS 'registros_encontrados', crc_md5 AS crc_encontrado FROM valores_encontrados;

SELECT  
    e.tabla, 
    CASE WHEN e.regs=f.regs THEN 'OK' ELSE 'No OK' END AS coinciden_registros, 
    CASE WHEN e.crc_md5=f.crc_md5 THEN 'OK' ELSE 'No OK' END AS coindicen_crc 
FROM 
    valores_esperados e INNER JOIN valores_encontrados f ON e.tabla=f.tabla;

SET @crc_fail=(SELECT COUNT(*) FROM valores_esperados e INNER JOIN valores_encontrados f ON (e.tabla=f.tabla) WHERE f.crc_md5 != e.crc_md5);
SET @count_fail=(SELECT COUNT(*) FROM valores_esperados e INNER JOIN valores_encontrados f ON (e.tabla=f.tabla) WHERE f.regs != e.regs);

DROP TABLE valores_esperados,valores_encontrados;

SELECT 'UUID' AS Resumen, @@server_uuid AS Resultado
UNION ALL
SELECT 'CRC', CASE WHEN @crc_fail = 0 THEN 'OK' ELSE 'Error' END
UNION ALL
SELECT 'Cantidad', CASE WHEN @count_fail = 0 THEN 'OK' ELSE 'Error' END
UNION ALL
SELECT 'Tiempo', TIMESTAMPDIFF(MICROSECOND,@tiempoini,NOW(6))/1000;
