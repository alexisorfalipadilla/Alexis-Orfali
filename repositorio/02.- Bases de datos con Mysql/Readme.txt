Proyecto 2: Análisis en SQL del dataset BankChurners
Este proyecto documenta la reconfiguración y análisis del conjunto de datos BankChurners, transformándolo de un formato plano a una base de datos relacional optimizada para un análisis exploratorio y la toma de decisiones estratégicas.

1. Fundamentos y Beneficios del Enfoque Relacional
La transformación a un modelo relacional se justifica por varias ventajas clave:

Normalización: Elimina la duplicidad de datos y minimiza inconsistencias, garantizando la integridad referencial.

Escalabilidad: La estructura de tablas interconectadas permite un crecimiento ordenado y eficiente del dataset.

Flexibilidad de Consultas: Habilita el uso de JOINs y funciones avanzadas de SQL para realizar análisis multifacéticos.

Análisis Avanzado: La organización estructurada facilita la integración con herramientas de visualización, análisis estadístico y modelos de machine learning.

2. Metodología del Proyecto
El proyecto siguió una hoja de ruta estructurada, con los siguientes pasos clave:

Creación del Esquema: Se creó el esquema credit_card en MySQL para alojar la estructura de la base de datos.

Importación y Exploración: El dataset BankChurners se importó a una tabla inicial, y se realizaron consultas exploratorias para entender su composición y tipos de datos.

Diseño del Modelo: Se diseñó una estructura normalizada que distingue entre datos estáticos del cliente (edad, género) y dinámicos (transacciones, cambios de comportamiento).

Normalización Lingüística: Los nombres de las tablas y campos se tradujeron al español para mejorar la accesibilidad y comprensión.

Creación de Vistas: Se implementaron vistas para simplificar consultas complejas y optimizar los análisis recurrentes.

Análisis Exploratorio: Se realizaron una serie de consultas analíticas para obtener insights valiosos sobre el comportamiento de los clientes.

3. Análisis y Hallazgos Clave
El análisis exploratorio reveló información valiosa en diversas áreas:

Análisis del Churn por Nivel Educativo
Se identificó que los clientes con niveles educativos de Doctorado y Postgrado presentan las tasas de abandono más altas, sugiriendo que son un grupo de riesgo que requiere estrategias de retención especializadas. La falta de información en el grupo "Desconocido" también representa un riesgo importante.

Análisis del Límite de Crédito por Ingresos
Se confirmó una relación lineal entre el nivel de ingresos y el límite de crédito asignado. Sin embargo, se encontraron valores atípicos en el segmento de ingresos bajos, lo que sugiere la necesidad de auditar estas asignaciones.

Análisis de la Utilización por Tipo de Tarjeta
El segmento de tarjetas Blue mostró un ratio de utilización del 29.09%, significativamente más alto que los demás. Esto puede indicar un mayor riesgo de sobreendeudamiento en este grupo.

Resumen Transaccional por Tipo de Tarjeta
El análisis demostró que los clientes de tarjetas de mayor categoría (Gold y Platinum) no solo gastan más en cada transacción, sino que también realizan más transacciones. Esto resalta la oportunidad de ofrecer productos premium para aprovechar su alto gasto.

Clasificación por Género y Tipo de Tarjeta
El análisis más detallado reveló que los clientes del segmento femenino con tarjeta Blue tienen un alto riesgo de abandono debido a sus límites de crédito bajos y alta utilización. Por otro lado, los hombres con tarjeta Platinum mostraron una tasa de abandono excepcionalmente baja.

4. Conclusiones y Recomendaciones
La normalización del dataset BankChurners a un modelo relacional no solo mejoró la integridad y escalabilidad de los datos, sino que también desbloqueó la capacidad de realizar análisis exploratorios profundos. Los hallazgos subrayan la importancia de la segmentación granular para diseñar estrategias de negocio más efectivas.

Se recomienda:

Diseñar campañas de retención específicas para los segmentos de alto riesgo.

Implementar un proceso para enriquecer los datos "Desconocidos".

Revisar las políticas de asignación de crédito y el modelo de producto para los segmentos de mayor riesgo.

Este proyecto sirve como una demostración práctica de cómo los principios de diseño de bases de datos son fundamentales para la inteligencia de negocios y la toma de decisiones basada en datos.