use gestionacademico;

INSERT INTO profesor (id_profesor, nombre, apellidos, celular) VALUES
  (1, 'Elena', 'Vega', NULL), (2, 'Mario', 'Salas', NULL),
  (3, 'Laura', 'Mora', NULL), (4, 'Diego', 'Paz', NULL),
  (5, 'Sofía', 'Reyes', NULL);

INSERT INTO asignatura (id_asignatura, nombre, horas, id_profesor) VALUES
  (1, 'Estadística analítica', 64, 1), (2, 'Bases de datos', 80, 2),
  (3, 'Programación', 80, 3), (4, 'Redes', 64, 4),
  (5, 'Matemática discreta', 64, 5);

INSERT INTO curso (id_curso, id_asignatura, id_profesor, periodo_academico)
VALUES
  (1, 1, 1, '2026-II'), (2, 2, 2, '2026-II'), (3, 3, 3, '2026-II'),
  (4, 4, 4, '2026-II'), (5, 5, 5, '2026-I');

INSERT INTO estudiante (id_estudiante, nombre, apellido, correo) VALUES
  (1, 'Erick', 'Rogel', 'erick@example.com'),
  (2, 'Ana', 'Pineda', 'ana@example.com'),
  (3, 'Carlos', 'Ruiz', 'carlos@example.com'),
  (4, 'Lucía', 'Mena', 'lucia@example.com'),
  (5, 'Mateo', 'Luna', 'mateo@example.com');

INSERT INTO matricula (id_matricula, id_estudiante, id_curso, fecha, estado)
VALUES
  (1, 1, 1, '2026-10-01', 'activa'),
  (2, 1, 2, '2026-10-01', 'activa'),
  (3, 2, 1, '2026-10-01', 'activa'),
  (4, 3, 3, '2026-10-02', 'activa'),
  (5, 4, 4, '2026-10-02', 'retirada'),
  (6, 4, 5, '2026-04-06', 'aprobada');

INSERT INTO asistencia (id_asistencia, id_matricula, fecha, estado,
                        justificacion)
VALUES
  (1, 1, '2026-10-06', 'presente', NULL),
  (2, 1, '2026-10-08', 'ausente', NULL),
  (3, 2, '2026-10-07', 'atraso', NULL),
  (4, 3, '2026-10-06', 'justificado', 'Permiso académico'),
  (5, 4, '2026-10-07', 'presente', NULL),
  (6, 6, '2026-04-10', 'presente', NULL);