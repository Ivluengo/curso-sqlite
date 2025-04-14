---
theme: "robot-lung"
customTheme: "custom-ivan"
highlightTheme: "monokai-sublime"
transitionSpeed: "fast"
# highlightTheme: "base16/hopscotch"
---

# SQL { .font-xxxl }
## CRUD { .font-xl }

---

### <span class="rosa">C</span>RUD { .font-xl }
#### Create <span class="emoticono">👉</span> Insert { .font-lg }

---

<!-- CREATE 👉 INSERT -->

### <span class="rosa">C</span>RUD { .font-xl }

#### Create <span class="emoticono">👉</span> Insert { .font-lg }

```sql
-- Insertar 1 registro añadiendo todos los campos.
INSERT INTO nombre_tabla VALUES (...);

-- Insertar 1 registro añadiendo SOLO LOS CAMPOS INDICADOS.
INSERT INTO nombre_tabla (campo1, campo2, campo3) VALUES (valor1, valor2, valor3);

```
Hacerlo de la segunda forma sirve sobretodo para poder insertar los campos de forma desordenada y para no tener que insertar los campos que no sean necesarios. {.font-sm}

```sql
-- Ejemplo 1:
INSERT INTO alumnos VALUES (1, 'Juan', 'Perez', 'Garcia', 'j@j.com'); 

-- Ejemplo 2:
INSERT INTO alumnos (nombre, primer_apellido, segundo_apellido, email) 
VALUES ('Juan', 'Perez', 'Garcia', 'j@j.com');
```

---

<!-- CREATE 👉 INSERT -->

### <span class="rosa">C</span>RUD { .font-xl }

#### Create <span class="emoticono">👉</span> Insert { .font-lg }
```sql
-- Insertar varios registros al mismo tiempo.
INSERT INTO nombre_tabla (campo1, campo2) 
VALUES  (valor1, valor2),
        (valor3, valor4),
        (valor5, valor6);
```

```sql
-- Ejemplo:
INSERT INTO tipos_de_pago (nombre)
VALUES  ('Efectivo'), 
        ('Tarjeta'),
        ('Transferencia');
```

---

### C<span class="rosa">R</span>UD { .font-xl }
#### READ <span class="emoticono">👉</span> SELECT { .font-lg }

---

<!-- MOSTRAR ALGO COMO RESULTADO -->

### C<span class="rosa">R</span>UD { .font-lg }

#### Read <span class="emoticono">👉</span> Select { .font-md }
**MOSTRAR ALGO COMO RESULTADO** {.left .w-90 .m-auto}

```sql
-- Mostrar algo como resultado.
SELECT 2 + 2, 'hola';

/*  +-------+------+
    | 2 + 2 | hola |
    +-------+------+
    |     4 | hola |
    +-------+------+  */
```
```sql
-- Mostrar todos los registros de una tabla.
SELECT * from alumnos;

/*  +-----------+--------+-----------------+------------------+---------+
    | alumno_id | nombre | primer_apellido | segundo_apellido | email   |
    +-----------+--------+-----------------+------------------+---------+
    |         1 | Juan   | Perez           | Garcia           | j@j.com |
    |         2 | Pedro  | Garcia          | Perez            | p@p.com |
    +-----------+--------+-----------------+------------------+---------+  */
```
---

<!-- SELECCIONAR VARIAS COLUMNAS -->

### C<span class="rosa">R</span>UD { .font-xl }

#### Read <span class="emoticono">👉</span> Select { .font-lg }
**SELECCIONAR VARIAS COLUMNAS** {.left .w-90 .m-auto}


```sql
-- Mostrar solo resultados que cumplan una condición.
SELECT alumno_id, nombre
FROM alumnos;

/*  +-----------+--------+
    | alumno_id | nombre |
    +-----------+--------+
    |         1 | Juan   |
    |         2 | Pedro  |
    |         3 | Maria  |
    +-----------+--------+  */
```

---

<!-- SELECCIONAR REGISTROS NO REPETIDOS 👉 DISTINCT -->

### C<span class="rosa">R</span>UD { .font-xl }

#### Read <span class="emoticono">👉</span> Select { .font-lg }
**SELECCIONAR REGISTROS NO REPETIDOS** <span class="emoticono">👉</span> *DISTINCT* {.left .w-90 .m-auto}


```sql
-- Mostrar solo resultados no repetidos.
SELECT DISTINCT profesor_id
FROM cursos;

/*  +-------------+
    | profesor_id |
    +-------------+
    |           1 |
    |           2 |
    +-------------+  */
```

---

<!-- SELECCIONAR SOLO UN NÚMERO DE REGISTROS 👉 LIMIT-->

### C<span class="rosa">R</span>UD { .font-xl }

#### Read <span class="emoticono">👉</span> Select { .font-lg }
**SELECCIONAR SOLO UN NÚMERO DE REGISTROS** <span class="emoticono">👉</span> *LIMIT* {.left .w-90 .m-auto}


```sql
-- Mostrar solo 2 resultados.
SELECT nombre
FROM cursos;

SELECT nombre
FROM cursos
LIMIT 2;

/*                LIMIT 2
    +--------+  +--------+ 
    | nombre |  | nombre |
    +--------+  +--------+
    | HTML   |  | HTML   |
    | CSS    |  | CSS    |
    | JS     |  +--------+
    +--------+              */
```
¡Ojo! La cláusula **LIMIT** debería ir siempre al final.

---

<!-- FILTRAR 👉 WHERE -->

### C<span class="rosa">R</span>UD { .font-xl }

#### Read <span class="emoticono">👉</span> Select { .font-lg }
**FILTRAR** <span class="emoticono">👉</span> <span class="rosa">**WHERE**</span> {.left .w-90 .m-auto}


```sql
-- Mostrar solo resultados que cumplan una condición.
SELECT *
FROM alumnos
WHERE email = 'j@j.com';

/*  +-----------+--------+-----------------+------------------+---------+
    | alumno_id | nombre | primer_apellido | segundo_apellido | email   |
    +-----------+--------+-----------------+------------------+---------+
    |         1 | Juan   | Perez           | Garcia           | j@j.com |
    +-----------+--------+-----------------+------------------+---------+  */
```

---

<!-- FILTRAR 👉 WHERE -->

### C<span class="rosa">R</span>UD { .font-xl }

#### Read <span class="emoticono">👉</span> Select { .font-lg }
**FILTRAR** <span class="emoticono">👉</span> <span class="rosa">**WHERE**</span> {.left .w-90 .m-auto}


```sql
-- Mostrar solo resultados que cumplan una condición.
SELECT *
FROM alumnos
WHERE id > 1;

/*  +-----------+--------+-----------------+------------------+---------+
    | alumno_id | nombre | primer_apellido | segundo_apellido | email   |
    +-----------+--------+-----------------+------------------+---------+
    |         2 | Pedro  | Garcia          | Perez            | p@p.com |
    |         3 | Maria  | López           | Martínez         | m@m.com |
    +-----------+--------+-----------------+------------------+---------+  */
```

---

<!-- FILTRAR 👉 WHERE 👉 OPERADORES -->

### C<span class="rosa">R</span>UD { .font-xl }

#### Read <span class="emoticono">👉</span> Select { .font-lg }
**FILTRAR** <span class="emoticono">👉</span> <span class="rosa">**WHERE**</span> <span class="emoticono">👉</span> *OPERADORES* {.left .w-90 .m-auto}


```sql
-- Operadores de comparación.
SELECT * FROM alumnos WHERE id > 1;  -- Mayor que
SELECT * FROM alumnos WHERE id >= 1; -- Mayor o igual que
SELECT * FROM alumnos WHERE id < 1;  -- Menor que
SELECT * FROM alumnos WHERE id <= 1; -- Menor o igual que
SELECT * FROM alumnos WHERE id = 1;  -- Igual que
SELECT * FROM alumnos WHERE id != 1; -- Distinto de
SELECT * FROM alumnos WHERE id <> 1; -- Distinto de
```

---

<!-- FILTRAR 👉 WHERE 👉 AND -->

### C<span class="rosa">R</span>UD { .font-xl }

#### Read <span class="emoticono">👉</span> Select { .font-lg }
**FILTRAR** <span class="emoticono">👉</span> <span class="rosa">**WHERE**</span> <span class="emoticono">👉</span> *<span class="azul u">AND</span>, OR y NOT* {.left .w-90 .m-auto}


```sql
-- Operadores de comparación.
SELECT curso_id, nombre, fecha_inicio, profesor_id 
FROM cursos 
WHERE fecha_inicio >= '2023-01-01' AND fecha_inicio <= '2023-05-31';

/*  +----------+--------+--------------+-------------+
    | curso_id | nombre | fecha_inicio | profesor_id |
    +----------+--------+--------------+-------------+
    |        1 | HTML   | 2023-03-15   |           1 |
    |        2 | CSS    | 2023-04-05   |           1 |
    +----------+--------+--------------+-------------+/
```

---

<!-- FILTRAR 👉 WHERE 👉OR -->

### C<span class="rosa">R</span>UD { .font-xl }

#### Read <span class="emoticono">👉</span> Select { .font-lg }
**FILTRAR** <span class="emoticono">👉</span> <span class="rosa">**WHERE**</span> <span class="emoticono">👉</span> *AND, <span class="azul u">OR</span> y NOT* {.left .w-90 .m-auto}


```sql
-- Operadores de comparación.
SELECT curso_id, nombre, fecha_inicio, profesor_id 
FROM cursos 
WHERE fecha_inicio < '2023-02-01' OR profesor_id = 2;

/*  +----------+--------+--------------+-------------+
    | curso_id | nombre | fecha_inicio | profesor_id |
    +----------+--------+--------------+-------------+
    |        3 | JS     | 2023-06-20   |           2 |
    +----------+--------+--------------+-------------+  */
```

---

<!-- FILTRAR 👉 WHERE 👉 NOT -->

### C<span class="rosa">R</span>UD { .font-xl }

#### Read <span class="emoticono">👉</span> Select { .font-lg }
**FILTRAR** <span class="emoticono">👉</span> <span class="rosa">**WHERE**</span> <span class="emoticono">👉</span> *AND, OR y <span class="azul u">NOT</span>* {.left .w-90 .m-auto}


```sql
-- Operadores de comparación.
SELECT curso_id, nombre, fecha_inicio, profesor_id 
FROM cursos 
WHERE NOT (fecha_inicio < '2023-02-01' OR profesor_id = 2);

/*  +----------+--------+--------------+-------------+
    | curso_id | nombre | fecha_inicio | profesor_id |
    +----------+--------+--------------+-------------+
    |        1 | HTML   | 2023-03-15   |           1 |
    |        2 | CSS    | 2023-04-05   |           1 |
    +----------+--------+--------------+-------------+  */
```

---

<!-- FILTRAR 👉 WHERE 👉 IN (valor, valor, valor) -->

### C<span class="rosa">R</span>UD { .font-xl }

#### Read <span class="emoticono">👉</span> Select { .font-lg }
**FILTRAR** <span class="emoticono">👉</span> <span class="rosa">**WHERE**</span> <span class="emoticono">👉</span> *IN (valor, valor, valor)* {.left .w-90 .m-auto}


```sql
-- Obtener cursos que sean de HTML o de CSS

SELECT curso_id, nombre, precio
FROM cursos 
WHERE nombre = 'HTML' OR nombre = 'CSS';


SELECT curso_id, nombre, precio
FROM cursos 
WHERE nombre IN ('HTML', 'CSS');

/*  +----------+--------+--------+
    | curso_id | nombre | precio |
    +----------+--------+--------+
    |        1 | HTML   |  50.00 |
    |        2 | CSS    | 100.00 |
    +----------+--------+--------+  */
```

---

<!-- FILTRAR 👉 WHERE 👉 BETWEEN -->

### C<span class="rosa">R</span>UD { .font-xl }

#### Read <span class="emoticono">👉</span> Select { .font-lg }
**FILTRAR** <span class="emoticono">👉</span> <span class="rosa">**WHERE**</span> <span class="emoticono">👉</span> *BETWEEN* {.left .w-90 .m-auto}


```sql
-- Obtener cursos entre una fecha y otra.

SELECT curso_id, nombre, precio
FROM cursos 
WHERE fecha_inicio BETWEEN '2023-01-01' AND '2023-05-31';

/*  +----------+--------+--------+
    | curso_id | nombre | precio |
    +----------+--------+--------+
    |        1 | HTML   |  50.00 |
    |        2 | CSS    | 100.00 |
    +----------+--------+--------+  */
```

---

<!-- FILTRAR 👉 WHERE 👉 LIKE 'B%' -->

### C<span class="rosa">R</span>UD { .font-xl }

#### Read <span class="emoticono">👉</span> Select { .font-lg }
**FILTRAR** <span class="emoticono">👉</span> <span class="rosa">**WHERE**</span> <span class="emoticono">👉</span> *LIKE 'B%'* {.left .w-90 .m-auto}


```sql
-- Obtener profesores que EMPIECEN por unas letras.

SELECT nombre, primer_apellido
FROM profesores 
WHERE nombre LIKE 'b%';

/*  +---------+-----------------+
    | nombre  | primer_apellido |
    +---------+-----------------+
    | Bárbara | Imbernón        |
    | Berto   | Yánez           |
    +---------+-----------------+  */
```

---

<!-- FILTRAR 👉 WHERE 👉 LIKE '%B' -->

### C<span class="rosa">R</span>UD { .font-xl }

#### Read <span class="emoticono">👉</span> Select { .font-lg }
**FILTRAR** <span class="emoticono">👉</span> <span class="rosa">**WHERE**</span> <span class="emoticono">👉</span> *LIKE '%B'* {.left .w-90 .m-auto}


```sql
-- Obtener profesores que TERMINEN por unas letras.

SELECT nombre, primer_apellido
FROM profesores 
WHERE primer_apellido LIKE '%z';

/*  +--------+-----------------+
    | nombre | primer_apellido |
    +--------+-----------------+
    | Samuel | Rodríguez       |
    | Berto  | Yánez           |
    +--------+-----------------+  */
```

---

<!-- FILTRAR 👉 WHERE 👉 LIKE '%B%' -->

### C<span class="rosa">R</span>UD { .font-xl }

#### Read <span class="emoticono">👉</span> Select { .font-lg }
**FILTRAR** <span class="emoticono">👉</span> <span class="rosa">**WHERE**</span> <span class="emoticono">👉</span> *LIKE '%B%'* {.left .w-90 .m-auto}


```sql
-- Obtener profesores cuyo email sea de hackaboss.

SELECT nombre, email
FROM profesores 
WHERE email LIKE '%hackaboss%';

/*  +---------+---------------------+
    | nombre  | email               |
    +---------+---------------------+
    | Bárbara | barb@hackaboss.com  |
    | Berto   | berto@hackaboss.com |
    +---------+---------------------+  */
```

---

<!-- FILTRAR 👉 WHERE 👉 LIKE '__B' -->

### C<span class="rosa">R</span>UD { .font-xl }

#### Read <span class="emoticono">👉</span> Select { .font-lg }
**FILTRAR** <span class="emoticono">👉</span> <span class="rosa">**WHERE**</span> <span class="emoticono">👉</span> *LIKE '__B'* {.left .w-90 .m-auto}


```sql
-- Obtener profesores cuyo email sea de hackaboss.

SELECT nombre, primer_apellido
FROM profesores 
WHERE primer_apellido LIKE '%z';

SELECT nombre, primer_apellido
FROM profesores 
WHERE primer_apellido LIKE '____z';

/*             '%z'                          '____z'
    +--------+-----------------+   +--------+-----------------+
    | nombre | primer_apellido |   | nombre | primer_apellido |
    +--------+-----------------+   +--------+-----------------+
    | Samuel | Rodríguez       |   | Berto  | Yánez           |
    | Berto  | Yánez           |   +--------+-----------------+
    +--------+-----------------+                                 */
```

---

<!-- FILTRAR 👉 WHERE 👉 IS NULL -->

### C<span class="rosa">R</span>UD { .font-xl }

#### Read <span class="emoticono">👉</span> Select { .font-lg }
**FILTRAR** <span class="emoticono">👉</span> <span class="rosa">**WHERE**</span> <span class="emoticono">👉</span> *IS NULL* {.left .w-90 .m-auto}


```sql
-- Obtener profesores cuyo segundo apellido sea nulo.

SELECT nombre, segundo_apellido
FROM profesores 
WHERE segundo_apellido IS NULL;

SELECT nombre, segundo_apellido
FROM profesores 
WHERE segundo_apellido IS NOT NULL;

/*                                             IS NOT NULL
         IS NULL                  +---------+------------------+         
+--------+------------------+     | nombre  | segundo_apellido |
| nombre | segundo_apellido |     +---------+------------------+
+--------+------------------+     | Ivan    | Padrosa          |
| Berto  | NULL             |     | Samuel  | Rey              |
+--------+------------------+     | Bárbara | Fuentes          |
                                  +---------+------------------+  */
```

---

<!-- COLUMNAS QUE CALCULAN -->

### C<span class="rosa">R</span>UD { .font-xl }

#### Read <span class="emoticono">👉</span> Select { .font-lg }
**COLUMNAS QUE CALCULAN** {.left .w-90 .m-auto}


```sql
-- Mostrar una columna que calcula un resultado.
SELECT 
    producto_id, 
    nombre, 
    precio, 
    precio + precio * 0.21
FROM productos;

/*  +-------------+-----------------------------+--------+------------------------+
    | producto_id | nombre                      | precio | precio + precio * 0.21 |
    +-------------+-----------------------------+--------+------------------------+
    |           1 | Teléfono inteligente        | 599.99 |               725.9879 |
    |           2 | Televisor                   | 299.99 |               362.9879 |
    |           3 | Camiseta de algodón         |  29.99 |                36.2879 |
    |           4 | Set de utensilios de cocina |  79.99 |                96.7879 |
    +-------------+-----------------------------+--------+------------------------+  */
```

---

<!-- ALIAS PARA COLUMNAS 👉 AS -->

### C<span class="rosa">R</span>UD { .font-xl }

#### Read <span class="emoticono">👉</span> Select { .font-lg }
**ALIAS PARA COLUMNAS** <span class="emoticono">👉</span> <span class="rosa">**AS**</span> {.left .w-90 .m-auto}


```sql
-- Mostrar una columna que calcula un resultado.
SELECT 
    producto_id, 
    nombre, 
    precio, 
    precio + precio * 0.21 AS 'Precio + IVA'
FROM productos;

/*  +-------------+-----------------------------+--------+--------------+
    | producto_id | nombre                      | precio | Precio + IVA |
    +-------------+-----------------------------+--------+--------------+
    |           1 | Teléfono inteligente        | 599.99 |     725.9879 |
    |           2 | Televisor                   | 299.99 |     362.9879 |
    |           3 | Camiseta de algodón         |  29.99 |      36.2879 |
    |           4 | Set de utensilios de cocina |  79.99 |      96.7879 |
    +-------------+-----------------------------+--------+--------------+  */
```

---

<!-- EJERCICIO 01 -->

### C<span class="rosa">R</span>UD { .font-xl }

#### Read <span class="emoticono">👉</span> Select { .font-lg }
<span class="rosa">**EJERCICIO 01** {.left}

::: {.left}
* De la tabla de `items_pedido` de la BBDD de la `tienda`:
* Consigue los items que tengan un número de pedido de `6`
* cuyo precio total (cantidad * precio_unitario) sea `mayor de 30`

<!-- 
SELECT *
FROM items_pedido
WHERE pedido_id = 6 AND (cantidad * precio_unitario) > 30;
 -->


---

<!-- EJERCICIO 02 -->

### C<span class="rosa">R</span>UD { .font-xl }

#### Read <span class="emoticono">👉</span> Select { .font-lg }
<span class="rosa">**EJERCICIO 02** {.left}

::: {.left}
* De la tabla de `productos` de la BBDD `tienda`:
* Consigue los items que tengan una `cantidad_stock` igual a `90, 14 y 70`.
:::

<!-- 
SELECT *
FROM productos
WHERE cantidad_stock IN (90, 14, 70);
 -->


---

<!-- EJERCICIO 03 -->

### C<span class="rosa">R</span>UD { .font-xl }

#### Read <span class="emoticono">👉</span> Select { .font-lg }
<span class="rosa">**EJERCICIO 03** {.left}

::: {.left}
* De la tabla de `productos` de la BBDD `tienda`:
* Consigue los items que tengan un `precio_unitario` entre `2 y 4`&euro;.
:::

<!-- 
SELECT * 
FROM productos
WHERE precio_unitario BETWEEN 2 AND 4;
 -->




---

<!-- EJERCICIO 04 -->

### C<span class="rosa">R</span>UD { .font-xl }

#### Read <span class="emoticono">👉</span> Select { .font-lg }
<span class="rosa">**EJERCICIO 04** {.left}

::: {.left}
* De la tabla de `consumidores` de la BBDD `tienda`:
* Consigue los items que su `direccion` sea una `Calle` o una `Avenida`.
* y que su número de teléfono tenga algún `9`.
:::

<!-- 
SELECT *
FROM consumidores
WHERE 
	(direccion LIKE 'Calle%' OR direccion LIKE 'Avenida%')
    AND telefono LIKE '%9%';
 -->

---

<!-- EJERCICIO 05 -->

### C<span class="rosa">R</span>UD { .font-xl }

#### Read <span class="emoticono">👉</span> Select { .font-lg }
<span class="rosa">**EJERCICIO 05** {.left}

::: {.left}
* De la tabla de `pedidos` de la BBDD `tienda`:
* Consigue los items que no hayan sido enviados aún.
:::
<!-- 
SELECT pedido_id, consumidor_id, fecha_envio
FROM pedidos
WHERE fecha_envio IS NOT NULL;
 -->

---

<!-- ORDENAR 👉 ORDER BY -->

### C<span class="rosa">R</span>UD { .font-xl }

#### Read <span class="emoticono">👉</span> Select { .font-lg }
**ORDENAR** <span class="emoticono">👉</span> <span class="rosa">**ORDER BY**</span> {.left .w-90 .m-auto}


```sql
-- Mostrar los resultados ordenados alfabéticamente.
SELECT alumno_id, nombre
FROM alumnos
ORDER BY nombre;

/*  +-----------+--------+
    | alumno_id | nombre |
    +-----------+--------+
    |         1 | Juan   |
    |         3 | Maria  |
    |         2 | Pedro  |
    +-----------+--------+  */
```

---

<!-- ORDENAR 👉 ORDER BY 👉 ASC and DESC -->

### C<span class="rosa">R</span>UD { .font-xl }

#### Read <span class="emoticono">👉</span> Select { .font-lg }
**ORDENAR** <span class="emoticono">👉</span> <span class="rosa">**ORDER BY**</span> <span class="emoticono">👉</span> *ASC and DESC* {.left .w-90 .m-auto}


```sql
-- Mostrar los resultados ordenados de forma ASCendente y DESCendente.
SELECT profesor_id, nombre, primer_apellido
FROM profesores
ORDER BY nombre ASC;

SELECT profesor_id, nombre, primer_apellido
FROM profesores
ORDER BY nombre DESC;

/*                  ASC                                           DESC
    +-------------+---------+-----------------+  +-------------+---------+-----------------+
    | profesor_id | nombre  | primer_apellido |  | profesor_id | nombre  | primer_apellido |
    +-------------+---------+-----------------+  +-------------+---------+-----------------+
    |           3 | Bárbara | Imbernón        |  |           2 | Samuel  | Rodríguez       |
    |           4 | Berto   | Yánez           |  |           1 | Ivan    | Luengo          |
    |           1 | Ivan    | Luengo          |  |           4 | Berto   | Yánez           |
    |           2 | Samuel  | Rodríguez       |  |           3 | Bárbara | Imbernón        |
    +-------------+---------+-----------------+  +-------------+---------+-----------------+  */
```

---

<!-- FILTRAR Y ORDENAR 👉 WHERE … ORDER BY -->

### C<span class="rosa">R</span>UD { .font-xl }

#### Read <span class="emoticono">👉</span> Select { .font-lg }
**FILTRAR Y ORDENAR** <span class="emoticono">👉</span> <span class="rosa">**WHERE ... ORDER BY**</span> {.left .w-90 .m-auto}


```sql
-- Mostrar los resultados filtrados por email ordenados alfabéticamente.
SELECT alumno_id, nombre
FROM alumnos
WHERE email LIKE '%.com' -- 'lo que sea .com'
ORDER BY nombre;

/*  +-----------+--------+
    | alumno_id | nombre |
    +-----------+--------+
    |         1 | Juan   |
    |         3 | Maria  |
    |         2 | Pedro  |
    +-----------+--------+  */
```

---

<!-- ORDEN DE LAS CLÁUSULAS -->

### C<span class="rosa">R</span>UD { .font-xl }

#### Read <span class="emoticono">👉</span> Select { .font-lg }
**¡ORDEN DE LAS CLÁUSULAS!**  {.left .w-90 .m-auto}


```sql
-- El órden en que ponemos las cláusulas es super importante
SELECT *    
FROM productos
WHERE precio_unitario > 2
ORDER BY precio_unitario DESC
LIMIT 5;

/*  +-------------+-----------------------------+--------+--------------+
    | producto_id | nombre                      | precio | Precio + IVA |
    +-------------+-----------------------------+--------+--------------+
    |           1 | Teléfono inteligente        | 599.99 |     725.9879 |
    |           2 | Televisor                   | 299.99 |     362.9879 |
    |           3 | Camiseta de algodón         |  29.99 |      36.2879 |
    |           4 | Set de utensilios de cocina |  79.99 |      96.7879 |
    +-------------+-----------------------------+--------+--------------+  */
```

---

### CR<span class="rosa">U</span>D { .font-xl }
#### UPDATE <span class="emoticono">👉</span> UPDATE { .font-lg }

---

<!-- UPDATE -->

### CR<span class="rosa">U</span>D { .font-xl }

#### UPDATE { .font-lg }

```sql
UPDATE nombre_tabla SET columna = valor WHERE condicion;

-- Actualizar 1 columna de 1 registro.
UPDATE profesores 
SET nombre = 'Juan'
WHERE profesor_id = 1;

-- Actualizar varias columnas de 1 registro.
UPDATE profesores 
SET nombre = 'Juan', segundo_apellido = 'Hernández'
WHERE profesor_id = 1;

-- Actualizar varias columnas de varios registro.
UPDATE matriculas
SET precio_pagado = precio_pagado + 10
WHERE alumno_id = 1; 
```

¡Ojo! Porque depende de la configuración que tengas no te dejará actualizar VARIOS REGISTROS. Para que te eje habría que desmarcar la casilla `Safe Updates` dentro de la pestaña `SQL Editor` de las *Preferencias* de <span class="u">MySQL Workbench</span>. {.font-xs}

---

<!-- EJERCICIO 01 -->

### CR<span class="rosa">U</span>D { .font-xl }

#### UPDATE {.font-lg}

<span class="rosa">**EJERCICIO 01**</span> {.left}

::: {.left}
* De la tabla de `consumidores` de la BBDD de la `tienda`:
  * Dale a aquellos que han nacido más tarde de 1990
  * 50 puntos extra
:::

<!-- 
UPDATE consumidores
SET puntos = puntos + 50
WHERE fecha_nacimiento >= '1991-01-01';
 -->


---

### CRU<span class="rosa">D</span> { .font-xl }
#### DELETE <span class="emoticono">👉</span> DELETE { .font-lg }

---


<!-- DELETE -->

### CRU<span class="rosa">D</span> { .font-xl }

#### DELETE { .font-lg }

```sql
DELETE FROM nombre_tabla WHERE condicion;

-- Borrar 1 registro
DELETE FROM cursos
WHERE curso_id = 1;

-- Borrar varios registros
DELETE FROM matriculas
WHERE alumno_id = 1;
```

¡👀! ¡CUIDADO CON DEJAR LA CLAUSULA DELETE SIN LA CONDICIÓN!
**<div class="rosa">¡BORRARÁS TODA LA TABLA!</div>**

---

# THE END {.invisible aria-hidden="true"}
🔚 {.font-xxxl}
