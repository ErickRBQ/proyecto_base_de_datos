use gestionacademico;
SELECT c.id_curso, a.nombre AS asignatura,
       p.nombre, p.apellidos, c.periodo_academico
FROM curso AS c
JOIN asignatura AS a ON a.id_asignatura = c.id_asignatura
JOIN profesor AS p ON p.id_profesor = c.id_profesor;