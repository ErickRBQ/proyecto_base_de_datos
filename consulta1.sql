use gestionacademico;
SELECT m.id_matricula, m.id_estudiante, m.id_curso,
       m.fecha, m.estado, c.id_asignatura, c.id_profesor,
       c.periodo_academico
FROM matricula AS m
JOIN curso AS c ON c.id_curso = m.id_curso
WHERE m.estado = 'activa' AND c.periodo_academico = '2026-II';