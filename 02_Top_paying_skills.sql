/*
Pregunta: ¿Cuáles son las competencias mejor remuneradas para los ingenieros de datos?
- Calcular el salario medio de cada competencia requerida en los puestos de ingeniero de datos
- Centrarse en puestos a distancia con salarios especificados
- Incluir la frecuencia de las competencias para identificar tanto el salario como la demanda
- ¿Por qué? Ayuda a identificar qué competencias ofrecen la mejor remuneración, al tiempo que muestra 
    cuán comunes son esas competencias, lo que proporciona una visión más completa para establecer las prioridades en el desarrollo de competencias

*/

SELECT 
    sd.skills,
    ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary,
    COUNT(jpf.*) AS skill_count
FROM job_postings_fact jpf
INNER JOIN skills_job_dim sjd ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
WHERE
    jpf.job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = True 
GROUP BY
    sd.skills
HAVING
    COUNT(sd.skills) >= 100
ORDER BY
    median_salary DESC
LIMIT 25;

/*
A continuación se presenta un desglose de las competencias mejor remuneradas para los ingenieros de datos:

Datos clave:
- Rust sigue siendo la competencia mejor remunerada, con un salario medio de 210 000 dólares, aunque la demanda sigue siendo relativamente limitada (232 ofertas de empleo).
- Tanto Terraform como Golang tienen salarios medios elevados, de 184 000 dólares, y una fuerte demanda (Terraform: 3248 ofertas; Golang: 912 ofertas).
- Otras habilidades destacadas que combinan una alta remuneración con una frecuencia de demanda de moderada a alta son:
  - Spring: salario medio de 175 500 dólares (364 ofertas)
  - Neo4j: salario medio de 170 000 $ (277 ofertas)
  - RGPD: salario medio de 169 600 $ (582 ofertas)
  - GraphQL: salario medio de 167 500 $ (445 ofertas)
  - Kubernetes: salario medio de 150 500 $ (4202 ofertas)
  - Airflow: salario medio de 150 000 $ (9996 ofertas)
- Bitbucket, Ruby, Redis, Ansible y Jupyter aparecen todos entre los 25 primeros puestos en cuanto a remuneración, cada uno con cientos de ofertas.
- La mayoría de las habilidades de la lista ya no son casos atípicos extremos con solo un puñado de ofertas; en cambio, muchas muestran una demanda consistentemente alta.

Conclusión: Aunque la habilidad mejor remunerada (Rust) sigue teniendo menos demanda que las principales herramientas de nube y datos, la mayoría de las habilidades mejor 
remuneradas cuentan tanto con salarios sólidos como con una demanda significativa. Esto sugiere que aprender herramientas como Terraform, Golang, Spring, Neo4j y, especialmente, 
las herramientas básicas de ingeniería de datos (Airflow, Kubernetes) ofrece un buen equilibrio entre remuneración y empleabilidad.

┌────────────┬───────────────┬─────────────┐
│   skills   │ median_salary │ skill_count │
│  varchar   │    double     │    int64    │
├────────────┼───────────────┼─────────────┤
│ rust       │      210000.0 │         232 │
│ terraform  │      184000.0 │        3248 │
│ golang     │      184000.0 │         912 │
│ spring     │      175500.0 │         364 │
│ neo4j      │      170000.0 │         277 │
│ gdpr       │      169616.0 │         582 │
│ zoom       │      168438.0 │         127 │
│ graphql    │      167500.0 │         445 │
│ mongo      │      162250.0 │         265 │
│ fastapi    │      157500.0 │         204 │
│ django     │      155000.0 │         265 │
│ bitbucket  │      155000.0 │         478 │
│ crystal    │      154224.0 │         129 │
│ atlassian  │      151500.0 │         249 │
│ c          │      151500.0 │         444 │
│ typescript │      151000.0 │         388 │
│ kubernetes │      150500.0 │        4202 │
│ node       │      150000.0 │         179 │
│ ruby       │      150000.0 │         736 │
│ airflow    │      150000.0 │        9996 │
│ css        │      150000.0 │         262 │
│ redis      │      149000.0 │         605 │
│ ansible    │      148798.0 │         475 │
│ vmware     │      148798.0 │         136 │
│ jupyter    │      147500.0 │         400 │
├────────────┴───────────────┴─────────────┤
│ 25 rows                        3 columns │
└──────────────────────────────────────────┘

*/
