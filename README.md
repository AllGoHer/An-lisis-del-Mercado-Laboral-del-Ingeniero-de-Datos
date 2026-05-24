# Analisis-del-Mercado-Laboral-del-Ingeniero-de-Datos

Un proyecto de SQL que analiza el mercado laboral de los ingenieros de datos utilizando datos reales de ofertas de empleo. Demuestra mi capacidad para escribir código SQL analítico apto para producción, diseñar consultas eficientes y convertir preguntas de negocio en conclusiones basadas en datos.

![image](https://github.com/user-attachments/assets/27d6f1a2-7d7a-4acd-8c0c-343054aa453b)

## 🧾 Resumen ejecutivo (para responsables de contratación)

✅ Alcance del proyecto: Creación de tres consultas analíticas que responden a preguntas clave sobre el mercado laboral de los ingenieros de datos
✅ Modelado de datos: Uso de uniones entre varias tablas de hechos y dimensiones para extraer información relevante
✅ Análisis: se aplicaron agregaciones, filtrados y ordenaciones para identificar las habilidades más demandadas según la demanda, el salario y el valor global
✅ Resultados: se proporcionaron insights prácticos sobre el predominio de SQL/Python, las tendencias en la nube y los patrones salariales

Si solo tienes un minuto, echa un vistazo a esto:
1. [01_top_demand_skills.sql]() -
2. [02_top_paying_skills.sql]() -
3. [03_optimal_skills.sql]() -

## 🧩 Problema & Contexto

Los analistas del mercado laboral deben responder a preguntas como:

🎯 Las más demandadas: ¿Qué competencias son las más demandadas para los ingenieros de datos?
💰 Las mejores remuneradas: ¿Qué competencias permiten obtener los salarios más altos?
⚖️ El mejor equilibrio: ¿Cuál es el conjunto óptimo de competencias que equilibra la demanda y la remuneración?

Este proyecto analiza un almacén de datos creado con un diseño de esquema en estrella. La estructura del almacén consta de:

![image](https://github.com/user-attachments/assets/5aff4db7-b5b6-41bd-ac70-9ec620265aac)

**- Fact Table / Tabla de hechos:** job_postings_fact - Tabla central que contiene los detalles de las ofertas de empleo (puestos, ubicaciones, salarios, fechas, etc.)
**- Dimension Tables / Tablas de dimensiones:**
-- company_dim: información de la empresa vinculada a las ofertas de empleo.
-- skills_dim: catálogo de competencias con nombres y tipos de competencias.
**- Bridge Table / Tabla puente:** skills_job_dim: resuelve la relación muchos a muchos entre las ofertas de empleo y las competencias.

Mediante consultas en estas tablas interconectadas, extraje información sobre la demanda de competencias, los patrones salariales y las combinaciones óptimas de competencias para puestos de ingeniería de datos.

## 🧰 Tech Stack

🐤 Motor de consultas: DuckDB para consultas analíticas rápidas de tipo OLAP.
🧮 Lenguaje: SQL (estilo ANSI con funciones analíticas).
📊 Modelo de datos: Esquema en estrella con tablas de hechos, dimensiones y puente.
🛠️ Desarrollo: VS Code para la edición de SQL + Terminal para la CLI de DuckDB.
📦 Control de versiones: Git/GitHub para scripts SQL versionados.

## 📂 Estructura del Repositorio

1_EDA/
├── 01_top_demanded_skills.sql    # Consulta de análisis de demanda.
├── 02_top_paying_skills.sql      # Consulta análisis salarial.
├── 03_optimal_skills.sql         # Optimización combinada demanda/salario.
└── README.md                     # Estás aquí.

## 🏗 Resúmen de Análisis


















