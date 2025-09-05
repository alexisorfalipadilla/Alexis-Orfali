# Análisis Exploratorio de Datos (EDA) de Clientes de Tarjetas de Crédito

---

## Resumen Ejecutivo

Este informe documenta un análisis exploratorio detallado sobre un conjunto de datos que registra el comportamiento de uso de tarjetas de crédito de aproximadamente 10.000 clientes activos, durante los 12 meses previos a su recopilación. El objetivo principal consiste en caracterizar el perfil demográfico y financiero de los usuarios, identificar patrones de comportamiento relevantes y determinar las variables que inciden en la retención o abandono de clientes.

### Metodología del Análisis
La metodología del análisis consta de tres fases principales, cada una diseñada para garantizar la calidad y la utilidad de los hallazgos:

---

### **1. Carga y preprocesamiento de datos**
Se importan los registros desde un archivo CSV y se validan la integridad y la consistencia de las variables. Se identifican los valores faltantes mediante funciones de conteo de null y se documenta su proporción en cada campo. Para las variables numéricas, se detectan valores atípicos con el método del **rango intercuartílico (IQR)** y, cuando corresponda, se imputan con la media aritmética del conjunto. Las variables categóricas se normalizan unificando etiquetas, corrigiendo inconsistencias de formato y agrupando aquellas categorías con frecuencia relativa inferior al 5 % en la etiqueta “Otros” para asegurar una representación mínima en cada nivel.

---

### **2. Análisis univariado**
Se examina cada variable en forma independiente para caracterizar su distribución y sus propiedades estadísticas. En el caso de las variables numéricas, se calculan los **estadísticos descriptivos** —media, mediana, desviación estándar, coeficientes de asimetría y curtosis— y se complementan con histogramas y diagramas de caja (boxplots) que facilitan la identificación de sesgos y valores extremos. Para las variables cualitativas, se construyen tablas de frecuencia absoluta y relativa, acompañadas de gráficos de barras, con el fin de determinar el peso de cada categoría y detectar posibles irregularidades en la codificación.

---

### **3. Análisis bivariado**
Se describe la relación entre pares de variables mediante técnicas estrictamente descriptivas.

* **Para dos variables cualitativas**, se construyen tablas de contingencia que muestran frecuencias absolutas y relativas, acompañadas de gráficos de barras agrupadas para facilitar la comparación.
* **Cuando una variable es numérica y la otra categórica**, se calculan estadísticos de tendencia central (media, mediana) y de dispersión (desviación estándar, rango intercuartílico) por cada categoría, y se representan mediante diagramas de caja y gráficos de barras de medias.

Este enfoque permite identificar patrones de comportamiento y diferencias entre segmentos de clientes sin recurrir a análisis de correlación ni a pruebas estadísticas de asociación.
---
### Hallazgos clave del análisis univariado

A continuación se exponen los principales hallazgos derivados del examen individual de las variables demográficas y su vinculación con el comportamiento de los clientes:

---

#### Perfil demográfico y relación con el banco

* **Edad**: La edad promedio de los clientes es de **46,82 años**, con una distribución prácticamente uniforme en todos los rangos etarios. Se recomienda segmentar la población para detectar diferencias de comportamiento.
* **Número de dependientes**: El cliente promedio tiene **1,23 dependientes**. Para simplificar, se sugiere categorizar esta variable en niveles: 0, 1–2 y $\geq$ 3.
* **Antigüedad con el banco**: La relación promedio con la entidad es de **36,03 meses**. Se propone clasificar la antigüedad en segmentos (nuevos, intermedios, leales) para optimizar las estrategias de retención.
* **Productos contratados**: El número medio de productos por cliente es de **3,81** (IQR: 2–5). Se observa que los clientes con más de cinco productos tienen mayores tasas de retención. Esto sugiere priorizar campañas de *cross-selling* en segmentos con menor adopción de productos.
* **Género**: La distribución por género es ligeramente mayoritaria en el segmento femenino (**52,9 %**) frente al masculino (**47,1 %**). Un análisis segmentado puede revelar preferencias diferenciales en productos y comportamientos de gasto.
* **Estado civil**: El **46,3 %** de los clientes está casado y el **38,9 %** soltero. Para simplificar la categorización, se recomienda agrupar 'Divorciado' y 'No especificado' en la categoría 'Otros'.
* **Nivel de ingresos**: El **35,2 %** de los clientes reporta ingresos anuales inferiores a $40 000, y el **9,1 %** no informa esta variable. Antes de usar los ingresos en modelos predictivos, debe evaluarse el posible sesgo de los datos faltantes y definir un método de imputación apropiado.
