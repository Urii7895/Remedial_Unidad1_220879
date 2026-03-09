# Remedial_Unidad1_220879

**Examen remedial de SQL**: generación de pacientes, médicos y citas médicas en la base `hospital_220879`.

**Objetivo:** Este examen tiene como objetivo demostrar habilidades en la administración de bases de datos, incluyendo **respaldo, generación de datos de prueba y documentación en Git** de la base de datos `hospital_220879`.

---

## 1️⃣ Respaldo de base de datos
Antes de cualquier cambio, se hizo el **respaldo de la base de datos** para asegurar que no se pierdan datos reales.

![Respaldo de base de datos](Capturas/respaldo.png)  
*Captura del respaldo de la base de datos `hospital_220879`.*

---

## 2️⃣ Implementación de procedimientos de generación de pacientes
Se implementaron los siguientes procedimientos almacenados:

- `generar_pacientes(cantidad INT)`: genera pacientes aleatorios.  
- `generar_medicos(cantidad INT)`: genera médicos aleatorios.  
- `generar_citas_medicas(cantidad INT)`: genera citas médicas relacionando pacientes y médicos.

![Procedimientos SQL](Capturas/Procedures 2.png)  
*Captura mostrando los procedimientos implementados en el equipo.*

---

## 3️⃣ Generación de 1000 pacientes
Se ejecutó el procedimiento `generar_pacientes(1000)` para poblar la tabla de pacientes con datos semi-reales.

```sql
CALL generar_pacientes(1000);


