use gestionacademico;
SELECT DISTINCT e.id_estudiante, e.nombre, e.apellido
FROM estudiante AS e
JOIN matricula AS m ON m.id_estudiante = e.id_estudiante;