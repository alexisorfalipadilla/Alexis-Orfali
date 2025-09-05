## **Descripción General del Proyecto**

Este proyecto presenta un **dashboard analítico** diseñado para ofrecer una **visión integral y descriptiva de una base de datos de 10,130 clientes**. El dashboard combina **indicadores demográficos y financieros** clave, permitiendo una comprensión profunda de la cartera de clientes. 

Su diseño modular, que incorpora métricas agregadas, gráficos de barras y gráficos circulares, facilita la navegación y la interpretación de los datos. La paleta de colores distintiva, junto con una leyenda clara, **segmenta eficazmente a los clientes existentes de aquellos que han abandonado**, lo que ayuda a identificar patrones de comportamiento y a tomar decisiones estratégicas.

## **Componentes Principales del Dashboard**

El dashboard está organizado en secciones intuitivas para un análisis rápido y efectivo:

### **Métricas Clave**

* **Total de Clientes**: Ubicado en la esquina superior izquierda, este indicador muestra el número total de clientes analizados: **10,130**.
* **Promedio de Crédito**: Muestra el crédito promedio de los clientes, con un valor de **9.28K**.
* **Edad Promedio de Clientes**: Indica la edad promedio de los clientes, con un valor de **46.33 años**.

### **Distribuciones Demográficas**

* **Distribución por Género**: Un gráfico de barras que compara la cantidad de clientes entre las categorías **Male** y **Female**.
* **Distribución por Estado Civil**: Otro gráfico de barras que muestra la distribución de clientes según su estado civil: **Married, Single** y **Separated**.
* **Distribución de Nivel Educativo**: Un gráfico circular que detalla la proporción de clientes en seis categorías de educación: **Graduate, High School, Uneducated, College, Post-Graduate** y **Doctorate**.

### **Análisis Financiero y de Producto**

* **Distribución de Nivel de Ingresos**: Un gráfico circular que segmenta a los clientes en cinco rangos de ingresos, desde "Menos de USD 40,000" hasta "Más de USD 120,000".
* **Cantidad por Categoría de Tarjeta**: Un gráfico de barras que visualiza la distribución de clientes entre las cuatro categorías de tarjeta: **Blue, Silver, Gold** y **Platinum**.

## **Modelado de Datos y Relaciones**

La arquitectura del dashboard se basa en un diseño de tabla de hechos que garantiza la integridad y la precisión de los datos.

* La **tabla de hechos** contiene un único registro por cliente, actuando como la fuente de datos principal para todas las métricas.
* Las **dimensiones** asignadas incluyen atributos demográficos (género, estado civil, nivel educativo), atributos financieros (nivel de ingresos, promedio de crédito) y la segmentación del producto (categoría de tarjeta).
* Se asegura la **integridad referencial** entre las métricas (conteo, promedios) y las dimensiones, lo que permite realizar filtrados cruzados de forma eficiente y sin duplicaciones, garantizando la fiabilidad de los análisis.

<img width="1362" height="769" alt="image" src="https://github.com/user-attachments/assets/e3549299-d1a0-43ea-8480-e539b408bd3d" />

¡Bienvenido al dashboard de análisis de clientes! Puedes acceder a la visualización interactiva en Power BI haciendo clic en el siguiente enlace: **[Dashboard de Clientes]([https://app.powerbi.com/links/DQ2JGZj7GJ?ctid=49ec9f52-8e28-4b20-a441-92ebf26c544c&pbi_source=linkShare](https://app.powerbi.com/view?r=eyJrIjoiZDMyNTQwNjAtNjQxMC00MWZiLWJiNmUtMzk3OWNhNGJiNDIyIiwidCI6IjQ5ZWM5ZjUyLThlMjgtNGIyMC1hNDQxLTkyZWJmMjZjNTQ0YyIsImMiOjR9))**.
