/*
Pregunta: ¿Cuáles son las habilidades más demandadas para los ingenieros de datos?
- Realizar una unión entre las ofertas de empleo y la tabla de uniones internas.
- Identificar las 10 habilidades más demandadas para los ingenieros de datos.
- Centrarse en las ofertas de empleo a distancia.
- ¿Por qué? Para obtener las 10 habilidades con mayor demanda en el mercado laboral a distancia,
    lo que ofrece información sobre las habilidades más valiosas para los ingenieros de datos que buscan trabajo a distancia
*/

SELECT 
    sd.skills,
    COUNT(jpf.*) AS demand_count
FROM job_postings_fact jpf
INNER JOIN skills_job_dim sjd ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
WHERE
    jpf.job_title_short = 'Data Engineer' 
    AND jpf.job_work_from_home = True 
GROUP BY
    sd.skills
ORDER BY
    demand_count DESC
LIMIT 10;

/*
A continuación se presenta el desglose de las competencias más demandadas para los ingenieros de datos:
SQL y Python son, con diferencia, las competencias más demandadas, con alrededor de 29 000 ofertas de empleo cada una, casi el doble que la siguiente competencia más cercana.
Las plataformas en la nube completan la lista de las competencias principales, con AWS a la cabeza con unas 18 000 ofertas, seguida de Azure con unas 14 000.
Apache Spark completa el top 5 con casi 13 000 ofertas, lo que pone de relieve la importancia de las habilidades de procesamiento de big data.

Conclusiones clave:
- SQL y Python siguen siendo las habilidades fundamentales para los ingenieros de datos
- Las plataformas en la nube (AWS, Azure) son fundamentales para la ingeniería de datos moderna
- Las herramientas de big data como Spark siguen siendo muy valoradas
- Las herramientas de canalización de datos (Airflow, Snowflake, Databricks) muestran una demanda creciente
- Java y GCP completan el top 10 de las habilidades más solicitadas.

┌────────────┬──────────────┐
│   skills   │ demand_count │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ sql        │        29221 │
│ python     │        28776 │
│ aws        │        17823 │
│ azure      │        14143 │
│ spark      │        12799 │
│ airflow    │         9996 │
│ snowflake  │         8639 │
│ databricks │         8183 │
│ java       │         7267 │
│ gcp        │         6446 │
├────────────┴──────────────┤
│ 10 rows         2 columns │
└───────────────────────────┘

*/

