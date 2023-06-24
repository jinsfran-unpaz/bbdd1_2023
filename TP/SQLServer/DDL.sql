USE Empleados;
CREATE TABLE empleados (
    id_emp            INT             NOT NULL,
    fecha_nacimiento  DATE            NOT NULL,
    nombre            VARCHAR(14)     NOT NULL,
    apellido          VARCHAR(16)     NOT NULL,
    genero            CHAR(1)         NOT NULL,
    fecha_alta        DATE            NOT NULL,
    CONSTRAINT PK_empleados PRIMARY KEY (id_emp)
);

CREATE TABLE departamentos (
    id_dept           CHAR(4)         NOT NULL,
    nombre_dept       VARCHAR(40)     NOT NULL UNIQUE,
    CONSTRAINT PK_departamentos PRIMARY KEY (id_dept)
);

CREATE TABLE dept_respo (
   id_emp             INT             NOT NULL,
   id_dept            CHAR(4)         NOT NULL,
   fecha_desde        DATE            NOT NULL,
   fecha_hasta        DATE            NOT NULL,
   CONSTRAINT FK_dept_respo_empleados FOREIGN KEY (id_emp)  REFERENCES empleados (id_emp),
   CONSTRAINT FK_dept_respo_departamentos FOREIGN KEY (id_dept) REFERENCES departamentos (id_dept),
   CONSTRAINT PK_dept_respo PRIMARY KEY (id_emp,id_dept)
);

CREATE TABLE dept_emp (
    id_emp            INT             NOT NULL,
    id_dept           CHAR(4)         NOT NULL,
    fecha_desde       DATE            NOT NULL,
    fecha_hasta       DATE            NOT NULL,
    CONSTRAINT FK_dept_emp_empleados FOREIGN KEY (id_emp)  REFERENCES empleados (id_emp),
    CONSTRAINT FK_dept_emp_departamentos FOREIGN KEY (id_dept) REFERENCES departamentos (id_dept),
    CONSTRAINT PK_dept_emp PRIMARY KEY (id_emp,id_dept)
);

CREATE TABLE puestos (
    id_emp            INT             NOT NULL,
    puesto            VARCHAR(50)     NOT NULL,
    fecha_desde       DATE            NOT NULL,
    fecha_hasta       DATE,
    CONSTRAINT FK_puestos_empleados FOREIGN KEY (id_emp) REFERENCES empleados (id_emp),
    CONSTRAINT PK_puestos PRIMARY KEY (id_emp,puesto, fecha_desde)
);

CREATE TABLE sueldos (
    id_emp            INT             NOT NULL,
    sueldo            INT             NOT NULL,
    fecha_desde       DATE            NOT NULL,
    fecha_hasta       DATE            NOT NULL,
    CONSTRAINT FK_sueldos_empleados FOREIGN KEY (id_emp) REFERENCES empleados (id_emp),
    CONSTRAINT PK_sueldos PRIMARY KEY (id_emp, fecha_desde)
);
