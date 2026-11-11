use gestionacademico;
SELECT m.id_matricula, m.id_estudiante, m.id_curso,
       COUNT(*) AS total,
       SUM(CASE WHEN s.estado IN ('presente', 'atraso', 'justificado')
                THEN 1 ELSE 0 END) AS asistidas,
       ROUND(100.0 * SUM(CASE
           WHEN s.estado IN ('presente', 'atraso', 'justificado') THEN 1
           ELSE 0 END) / COUNT(*), 1) AS porcentaje
FROM matricula AS m
JOIN asistencia AS s ON s.id_matricula = m.id_matricula
GROUP BY m.id_matricula, m.id_estudiante, m.id_curso;