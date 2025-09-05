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
Se exploran las relaciones entre pares de variables para descubrir patrones y dependencias de interés para el negocio. Para pares de variables numéricas, se calcula la **matriz de correlación de Pearson** y se visualiza mediante un mapa de calor; se complementa con diagramas de dispersión que permiten detectar tendencias y agrupamientos. Cuando ambas variables son categóricas, se elaboran tablas de contingencia y se aplica la **prueba de chi cuadrado de independencia** para evaluar la significancia de la asociación. Se dedica especial atención a las interacciones con impacto directo en la retención de clientes, como la relación entre tipo de tarjeta y tasa de abandono, y entre nivel de ingresos y volumen de transacciones mensuales.
