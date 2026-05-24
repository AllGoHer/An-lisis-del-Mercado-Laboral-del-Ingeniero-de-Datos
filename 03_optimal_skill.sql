/*
Pregunta: ¿Cuáles son las competencias más idóneas para los ingenieros de datos, teniendo en cuenta tanto la demanda como el salario?
- Crea una columna de clasificación que combine el número de ofertas y el salario medio para identificar las competencias más valiosas.
- Céntrate únicamente en puestos de ingeniero de datos a distancia con salarios anuales especificados.
- ¿Por qué?
    - Este enfoque destaca las competencias que equilibran la demanda del mercado y la remuneración económica. Ponderan adecuadamente las 
    competencias básicas en lugar de permitir que las competencias poco comunes o atípicas distorsionen los resultados.
    - La transformación logarítmica natural garantiza que tanto las habilidades con salarios altos como las muy demandadas se revelen como
     las más prácticas y valiosas para aprender en las carreras de ingeniería de datos.
*/

SELECT 
    sd.skills,
    ROUND(MEDIAN(jpf.salary_year_avg), 1) AS median_salary,
    COUNT(jpf.*) AS demand_count,
    ROUND(LN(COUNT(jpf.*)), 1) AS ln_demand_count,
    ROUND((LN(COUNT(jpf.*)) * MEDIAN(jpf.salary_year_avg))/1_000_000, 2) AS optimal_score
FROM job_postings_fact jpf
INNER JOIN skills_job_dim sjd ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
WHERE
    jpf.job_title_short = 'Data Engineer'
    AND jpf.salary_year_avg IS NOT NULL
    AND jpf.job_work_from_home = True 
GROUP BY
    sd.skills
HAVING 
    COUNT(sjd.job_id) >= 100
ORDER BY
    optimal_score DESC
LIMIT 25;

/*
A continuación se presenta un desglose de las competencias más óptimas para los ingenieros de datos, basadas tanto en la alta demanda como en los altos salarios:

Competencias principales por puntuación óptima:
- Terraform encabeza la lista con un salario medio de 184 000 dólares y 193 ofertas de empleo, lo que le otorga la «puntuación óptima» global más alta.
- Python y SQL dominan la demanda (más de 1100 ofertas cada uno), con unos sólidos salarios medios de 135 000 $ y 130 000 $, respectivamente.
- AWS (783 ofertas, mediana de 137 000 $), Spark (503 ofertas, mediana de 140 000 $) y Airflow (386 ofertas, mediana de 150 000 $) son tecnologías de nube y big data muy solicitadas.
- Kafka ofrece una alta remuneración (mediana de 145 000 $) y una demanda sólida (292 ofertas).
- Herramientas como Snowflake, Azure y Databricks cuentan cada una con entre 250 y 475 ofertas de empleo y salarios medios de entre 128 000 y 137 000 dólares.

Herramientas de DevOps e ingeniería:
- Airflow (150 000 dólares), Kubernetes (150 500 dólares) y Docker (135 000 dólares) destacan por su combinación de demanda y salarios medios elevados.
- Git (140 000 $/208 ofertas) y Github (135 000 $/127 ofertas) tienen una amplia utilidad y una remuneración competitiva.

Lenguajes destacados:
- Java (303 ofertas, mediana de 135 000 $) y Scala (247 ofertas, mediana de 137 000 $) siguen siendo opciones sólidas para puestos de ingeniería de datos bien remunerados.
- Go (140 000 $/113 ofertas) es otro lenguaje de programación con una remuneración excelente.

Bases de datos y nube:
- Redshift (130 000 $/274 ofertas), GCP (136 000 $/196 ofertas), Hadoop (135 000 $/198 ofertas), NoSQL (134 400 $/193 ofertas) y MongoDB (135 800 $/136 ofertas) completan un conjunto de habilidades de ingeniería de datos muy completo.
- R, Pyspark y BigQuery ofrecen salarios competitivos y cumplen con el umbral de demanda.

Resumen:
Las habilidades que aparecen sistemáticamente entre las primeras puestos combinan de forma equilibrada una fuerte demanda del mercado (seguridad laboral) y beneficios económicos. Python, SQL, AWS, Spark, Airflow y Terraform son especialmente estratégicos tanto para oportunidades inmediatas como para el crecimiento profesional a largo plazo en ingeniería de datos.
*/

┌────────────┬───────────────┬──────────────┬─────────────────┬───────────────┐
│   skills   │ median_salary │ demand_count │ ln_demand_count │ optimal_score │
│  varchar   │    double     │    int64     │     double      │    double     │
├────────────┼───────────────┼──────────────┼─────────────────┼───────────────┤
│ terraform  │      184000.0 │          193 │             5.3 │          0.98 │
│ python     │      135000.0 │         1133 │             7.0 │          0.95 │
│ aws        │      137320.3 │          783 │             6.7 │          0.92 │
│ sql        │      130000.0 │         1128 │             7.0 │          0.91 │
│ airflow    │      150000.0 │          386 │             6.0 │           0.9 │
│ spark      │      140000.0 │          503 │             6.2 │          0.87 │
│ kafka      │      145000.0 │          292 │             5.7 │          0.83 │
│ snowflake  │      135500.0 │          438 │             6.1 │          0.83 │
│ azure      │      128000.0 │          475 │             6.2 │          0.79 │
│ java       │      135000.0 │          303 │             5.7 │          0.77 │
│ scala      │      137290.5 │          247 │             5.5 │          0.76 │
│ kubernetes │      150500.0 │          147 │             5.0 │          0.75 │
│ databricks │      132750.0 │          266 │             5.6 │          0.74 │
│ git        │      140000.0 │          208 │             5.3 │          0.74 │
│ redshift   │      130000.0 │          274 │             5.6 │          0.73 │
│ gcp        │      136000.0 │          196 │             5.3 │          0.72 │
│ hadoop     │      135000.0 │          198 │             5.3 │          0.72 │
│ nosql      │      134415.0 │          193 │             5.3 │          0.71 │
│ pyspark    │      140000.0 │          152 │             5.0 │           0.7 │
│ docker     │      135000.0 │          144 │             5.0 │          0.68 │
│ mongodb    │      135750.0 │          136 │             4.9 │          0.67 │
│ r          │      134775.0 │          133 │             4.9 │          0.66 │
│ go         │      140000.0 │          113 │             4.7 │          0.66 │
│ github     │      135000.0 │          127 │             4.8 │          0.65 │
│ bigquery   │      135000.0 │          123 │             4.8 │          0.65 │
├────────────┴───────────────┴──────────────┴─────────────────┴───────────────┤
│ 25 rows                                                           5 columns │
└─────────────────────────────────────────────────────────────────────────────┘
