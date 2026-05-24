# Analisis-del-Mercado-Laboral-del-Ingeniero-de-Datos
_____________________________________________________________________________________________________________________________________________________________________________________________________________________________

Un proyecto de SQL que analiza el mercado laboral de los ingenieros de datos utilizando datos reales de ofertas de empleo. Demuestra mi capacidad para escribir código SQL analítico apto para producción, diseñar consultas eficientes y convertir preguntas de negocio en conclusiones basadas en datos.

![image](https://github.com/user-attachments/assets/27d6f1a2-7d7a-4acd-8c0c-343054aa453b)

_____________________________________________________________________________________________________________________________________________________________________________________________________________________________

## 🧾 Resumen ejecutivo (para responsables de contratación)

_____________________________________________________________________________________________________________________________________________________________________________________________________________________________

✅ Alcance del proyecto: Creación de tres consultas analíticas que responden a preguntas clave sobre el mercado laboral de los ingenieros de datos.

✅ Modelado de datos: Uso de uniones entre varias tablas de hechos y dimensiones para extraer información relevante.

✅ Análisis: se aplicaron agregaciones, filtrados y ordenaciones para identificar las habilidades más demandadas según la demanda, el salario y el valor global.

✅ Resultados: se proporcionaron insights prácticos sobre el predominio de SQL/Python, las tendencias en la nube y los patrones salariales.

Si solo tienes un minuto, echa un vistazo a esto:

1. [01_top_demand_skills.sql]() - Análisis de la demanda con uniones entre multiples tablas.
2. [02_top_paying_skills.sql]() - Análisis salarial con agregaciones.
3. [03_optimal_skills.sql]() - optimización de consulta combinada de demanda y salario.

_____________________________________________________________________________________________________________________________________________________________________________________________________________________________

## 🧩 Problema & Contexto

_____________________________________________________________________________________________________________________________________________________________________________________________________________________________

Los analistas del mercado laboral deben responder a preguntas como:

🎯 Las más demandadas: ¿Qué competencias son las más demandadas para los ingenieros de datos?

💰 Las mejores remuneradas: ¿Qué competencias permiten obtener los salarios más altos?

⚖️ El mejor equilibrio: ¿Cuál es el conjunto óptimo de competencias que equilibra la demanda y la remuneración?


Este proyecto analiza un almacén de datos creado con un diseño de esquema en estrella. La estructura del almacén consta de:

![image](https://github.com/user-attachments/assets/5aff4db7-b5b6-41bd-ac70-9ec620265aac)

* **Fact Table / Tabla de hechos:** <mark>job_postings_fact</mark> - Tabla central que contiene los detalles de las ofertas de empleo (puestos, ubicaciones, salarios, fechas, etc.).

* **Dimension Tables / Tablas de dimensiones:**

  * <mark>company_dim:</mark> información de la empresa vinculada a las ofertas de empleo.

  * <mark>skills_dim:</mark> catálogo de competencias con nombres y tipos de competencias.

* **Bridge Table / Tabla puente:** <mark>skills_job_dim:</mark> resuelve la relación muchos a muchos entre las ofertas de empleo y las competencias.

Mediante consultas en estas tablas interconectadas, extraje información sobre la demanda de competencias, los patrones salariales y las combinaciones óptimas de competencias para puestos de ingeniería de datos.

_____________________________________________________________________________________________________________________________________________________________________________________________________________________________

## 🧰 Tech Stack

_____________________________________________________________________________________________________________________________________________________________________________________________________________________________

🐤 Motor de consultas: DuckDB para consultas analíticas rápidas de tipo OLAP.

🧮 Lenguaje: SQL (estilo ANSI con funciones analíticas).

📊 Modelo de datos: Esquema en estrella con tablas de hechos, dimensiones y puente.

🛠️ Desarrollo: VS Code para la edición de SQL + Terminal para la CLI de DuckDB.

📦 Control de versiones: Git/GitHub para scripts SQL versionados.

_____________________________________________________________________________________________________________________________________________________________________________________________________________________________

## 📂 Estructura del Repositorio

_____________________________________________________________________________________________________________________________________________________________________________________________________________________________

1_EDA/

├── 01_top_demanded_skills.sql&emsp;&emsp;&emsp;# Consulta de análisis de demanda.

├── 02_top_paying_skills.sql&emsp;&emsp;&emsp;  # Consulta análisis salarial.

├── 03_optimal_skills.sql&emsp;&emsp;&emsp;&emsp;# Optimización combinada demanda/salario.

└── README.md&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;# Estás aquí.

_____________________________________________________________________________________________________________________________________________________________________________________________________________________________

## 🏗 Resúmen de Análisis

_____________________________________________________________________________________________________________________________________________________________________________________________________________________________

### Estructura de la consulta

1. [Top Demanded Skills](): identifica las 10 habilidades más demandadas para puestos de ingeniero de datos a distancia.
2. [Top Paying Skills:]() analiza las 25 habilidades mejor remuneradas con métricas de salario y demanda.
3. [Optimal Skills]() - calcula una puntuación óptima utilizando el logaritmo natural de la demanda combinado con el salario medio para identificar las habilidades más valiosas que conviene aprender.
   
### Conclusiones clave

🧠 **Lenguajes principales:**  *SQL y Python* aparecen cada uno en unas 29 000 ofertas de empleo, lo que los convierte en las habilidades más demandadas.

☁️ **Plataformas en la nube:**  *AWS y Azure* son fundamentales para los puestos de ingeniería de datos modernos.

🧱 **Infraestructura y herramientas:** *Kubernetes, Docker y Terraform* están asociados a salarios elevados.

🔥 **Herramientas de big data:** *Apache Spark* muestra una fuerte demanda con una remuneración competitiva.

_____________________________________________________________________________________________________________________________________________________________________________________________________________________________

### 💻 Conocimientos demostrados de SQL

_____________________________________________________________________________________________________________________________________________________________________________________________________________________________

#### Diseño y optimización de consultas

* **Uniones complejas:** operaciones <mark>INNER JOIN</mark> entre varias tablas (<mark>job_postings_fact</mark>, <mark>skills_job_dim</mark> y <mark>skills_dim</mark>).
* **Agregaciones:** <mark>COUNT()</mark>, <mark>MEDIAN()</mark>, <mark>ROUND()</mark> para análisis estadístico.
* **Filtrado:** lógica booleana con cláusulas <mark>WHERE</mark> y múltiples condiciones (<mark>job_title_short</mark>, <mark>job_work_from_home</mark>, <mark>salary_year_avg IS NOT NULL</mark>).
* **Orden y limitación:** <mark>ORDER BY</mark> con <mark>DESC</mark> y <mark>LIMIT</mark> para análisis de los N primeros.

#### Técnicas de análisis de datos

* **Agrupación:** <mark>GROUP BY</mark> para análisis categórico por habilidad.
* **Funciones matemáticas:** <mark>LN()</mark> para la transformación logarítmica natural con el fin de normalizar las métricas de demanda.
* **Métricas calculadas:** Puntuación óptima derivada que combina la demanda transformada logarítmicamente con el salario medio.
* **Cláusula HAVING:** Filtrado de resultados agregados (habilidades con >= 100 ofertas).
* **Manejo de valores NULL:** Filtrado adecuado de registros incompletos (<mark>salary_year_avg IS NOT NULL</mark>).
















