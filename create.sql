use gestionacademico;
CREATE TABLE profesor (
    id_profesor INT AUTO_INCREMENT PRIMARY KEY,
    nombre      VARCHAR(60) NOT NULL,
    apellidos   VARCHAR(80) NOT NULL,
    celular     VARCHAR(15) UNIQUE
) ENGINE=InnoDB;

CREATE TABLE asignatura (
    id_asignatura INT AUTO_INCREMENT PRIMARY KEY,
    nombre        VARCHAR(100) NOT NULL,
    horas         INT NOT NULL CHECK (horas > 0),
    id_profesor   INT NOT NULL,
    FOREIGN KEY (id_profesor) REFERENCES profesor(id_profesor)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE curso (
    id_curso          INT AUTO_INCREMENT PRIMARY KEY,
    id_asignatura     INT NOT NULL,
    id_profesor       INT NOT NULL,
    periodo_academico VARCHAR(30) NOT NULL,
    UNIQUE (id_asignatura, id_profesor, periodo_academico),
    FOREIGN KEY (id_asignatura) REFERENCES asignatura(id_asignatura)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (id_profesor) REFERENCES profesor(id_profesor)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE estudiante (
    id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    nombre        VARCHAR(60) NOT NULL,
    apellido      VARCHAR(80) NOT NULL,
    celular       VARCHAR(15),
    correo        VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE matricula (
    id_matricula  INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT NOT NULL,
    id_curso      INT NOT NULL,
    fecha         DATE NOT NULL,
    estado        VARCHAR(20) NOT NULL DEFAULT 'activa',
    CHECK (estado IN ('activa', 'retirada', 'aprobada', 'reprobada')),
    UNIQUE (id_estudiante, id_curso),
    FOREIGN KEY (id_estudiante) REFERENCES estudiante(id_estudiante)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE asistencia (
    id_asistencia INT AUTO_INCREMENT PRIMARY KEY,
    id_matricula  INT NOT NULL,
    fecha         DATE NOT NULL,
    estado        VARCHAR(15) NOT NULL,
    justificacion VARCHAR(255),
    CHECK (estado IN ('presente', 'ausente', 'atraso', 'justificado')),
    UNIQUE (id_matricula, fecha),
    FOREIGN KEY (id_matricula) REFERENCES matricula(id_matricula)
        ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;