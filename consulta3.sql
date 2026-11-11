use gestionacademico;
SELECT e.id_estudiante, e.nombre, e.apellido
FROM estudiante AS e
WHERE NOT EXISTS (
    SELECT 1 FROM matricula AS m
    WHERE m.id_estudiante = e.id_estudiante AND m.estado = 'activa'
);