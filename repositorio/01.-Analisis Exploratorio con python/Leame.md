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

---
### Comportamiento financiero y de transacciones

* **Límite de crédito:** El límite promedio es de **$4.835,88**, con una alta dispersión y valores atípicos superiores a $10.000. Se recomienda segmentar a los clientes en niveles —bajo, medio, alto y premium— para personalizar ofertas y gestionar el riesgo.
* **Saldo rotativo:** El saldo rotativo medio es de **$1.162,81**, con una proporción considerable de clientes que tienen saldos bajos o nulos. Para optimizar el análisis, se sugiere agrupar los saldos en cuartiles (Q1-Q4) e identificar segmentos con mayor potencial de crecimiento.
* **Uso de crédito:** La utilización promedio del crédito es inferior al **20 %**, lo que indica un uso moderado de la línea disponible. Se propone clasificar esta ratio en categorías —bajo, medio y alto— para incorporarla en modelos de riesgo crediticio.
* **Monto total de transacciones anual:** El monto promedio anual es de aproximadamente **$3.990**, con valores atípicos que superan los $5.800. La identificación de “súper usuarios” permite diseñar campañas de fidelización y maximizar la rentabilidad de los clientes más activos.
* **Número de transacciones:** En promedio, el cliente realiza **64,84 transacciones al año**. Los segmentos con menos de 50 transacciones anuales muestran un mayor riesgo de abandono. Se recomienda establecer umbrales de alerta y desarrollar estrategias para reactivar a estos clientes.

Este análisis financiero y transaccional ofrece una base sólida para segmentar a los clientes y diseñar acciones dirigidas a optimizar la rentabilidad, mitigar el riesgo y reducir el abandono.
---
Aquí tienes el texto en formato Markdown, incluyendo una tabla:

### Análisis de relaciones clave

El análisis contrasta la proporción de clientes existentes y abandonantes según la categoría de su tarjeta, con el fin de identificar segmentos con mayor riesgo de abandono.

| Categoría de tarjeta | Clientes existentes (%) | Clientes abandonantes (%) |
| :--- | :--- | :--- |
| Blue | 94,2 | 88,6 |
| Silver | 4,8 | 8,4 |
| Gold | 0,9 | 2,5 |
| Platinum | 0,1 | 0,5 |

Se observa que la categoría **Blue** predomina en ambos colectivos; sin embargo, los clientes con tarjetas **Silver**, **Gold** y **Platinum** presentan tasas de abandono proporcionalmente superiores a su participación en la cartera activa. Este comportamiento indica que, a pesar de su menor volumen, dichos segmentos muestran una mayor propensión al abandono, lo cual es especialmente importante dada su contribución al ingreso y la rentabilidad de la entidad.
---
### Conclusiones y Recomendaciones

El conjunto de datos presenta un nivel de calidad adecuado, sin valores faltantes críticos y con una proporción limitada de datos atípicos. Sin embargo, las variables relacionadas con el crédito y las transacciones requieren transformaciones antes de ser utilizadas en modelos predictivos para evitar sesgos y mejorar la estabilidad.

---

#### Calidad de variables financieras

Se identificaron valores extremos en **Credit_Limit**, **Total_Revolving_Bal** y **Total_Trans_Amt**. Se recomienda aplicar técnicas como la winsorización o el escalado robusto para mitigar la influencia de estos valores atípicos sin perder información relevante sobre los "súper usuarios".

---

#### Segmentación estratégica

Las variables con mayor poder de discriminación para la segmentación son la antigüedad del cliente, el número de productos contratados y el volumen y monto de las transacciones. Configurar estos atributos en niveles (ej. por antigüedad: nuevos, intermedios, leales) facilitará el diseño de campañas de marketing y la asignación de recursos.

---

#### Medición de riesgo y compromiso

El riesgo crediticio y el compromiso del cliente se capturan de manera más sólida combinando **Credit_Limit**, **Avg_Utilization_Ratio** y **Total_Revolving_Bal**. Se sugiere integrar estas variables en un índice compuesto que sirva como predictor en modelos de abandono y mora.

---

#### Depuración de variables redundantes

Las probabilidades derivadas del clasificador **Naive Bayes (NBC_Prob_Attrition y NBC_Prob_NoAttrition)** muestran baja variabilidad y un sesgo marcado. Se recomienda excluirlas de la fase de modelado y, en su lugar, explorar otros métodos que aporten información diferenciada.

---

#### Umbral de retención

La tasa global de abandono es del **16,1 %**. Cualquier iniciativa de retención debe demostrar una reducción significativa por debajo de este valor. Se sugiere implementar pruebas piloto A/B en segmentos de alto riesgo y medir el impacto antes de escalar las acciones.

---

#### Próximos pasos

Para reforzar la estrategia, se proponen los siguientes pasos:

* Construir un modelo predictivo de abandono, validado con validación cruzada y métricas de discriminación (ROC-AUC) y calibración.
* Desarrollar un panel de control interactivo en Power BI para monitorear en tiempo real los indicadores de riesgo, retención y rentabilidad por segmento.
* Probar campañas específicas (venta cruzada de productos y ofertas personalizadas de línea de crédito) en los segmentos identificados como “súper usuarios” para maximizar la rentabilidad.
* Implementar análisis de sentimiento a partir de fuentes de retroalimentación del cliente (encuestas NPS, comentarios en canales digitales) para enriquecer el perfil de riesgo y compromiso.
