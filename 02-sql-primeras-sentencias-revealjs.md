---
theme: "robot-lung"
customTheme: "custom-ivan"
highlightTheme: "monokai-sublime"
transitionSpeed: "fast"
# highlightTheme: "base16/hopscotch"

---

# SQL { .font-xxxl }
## Crear una BBDD usando comandos { .font-xl }

---

### BASES DE DATOS

Para crear una base de datos con **SQLite** solo tenemos que crear un archivo con extensión `.db` o `.sqlite`.


---


### TABLAS

##### Recordemos: 

#### Tipos de datos:

|             |          |
| ----------- | -------- |
| **INTEGER** | Entero   |
| **REAL**    | Decimal  |
| **TEXT**    | Texto    |
| **BLOB**    | Binario  |
| **NUMERIC** | Numérico |


---

### TABLAS

##### Recordemos: 

#### Atributos:

|                   |                                                                                                 |
| ----------------- | ----------------------------------------------------------------------------------------------- |
| **PRIMARY KEY**   | Para establecer una llave primaria en ese campo.                                                |
| **AUTOINCREMENT** | Para decirle a SQLite que se encargue de añadir ese campo de forma incremental automáticamente. |
| **NOT NULL**      | Para no permitir que el campo quede vacío. Hay que insertar datos obligatoriamente.             |
| **UNIQUE**        | Para restringir la posibilidad de que haya dos registros con el mismo valor.                    |
| **DEFAULT**       | Para definir un valor por defecto si no se ha establecido uno al añadir el registro.            |

---

### TABLAS

#### CREAR TABLA {.left}
```sql
CREATE TABLE nombre_tabla ( 
    nombre_columna TIPO ATRIBUTO1 ATRIBUTO2, 
    nombre_columna_2 TIPO ATRIBUTO1 ATRIBUTO2 
);

...

CREATE TABLE IF NOT EXISTS nombre_tabla (.......);
```

---

### TABLAS

#### CREAR TABLA EJEMPLO {.left}
```sql
CREATE TABLE alumnos (
    alumno_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    primer_apellido TEXT NOT NULL,
    segundo_apellido TEXT,
    email TEXT NOT NULL UNIQUE
);
```
	
---

### TABLAS

#### BORRAR TABLA {.left}

```sql
DROP TABLE nombre_tabla;

DROP TABLE IF EXISTS nombre_tabla;
```

---

### TABLAS

#### CAMBIAR NOMBRE TABLA {.left}

```sql
ALTER TABLE nombre_tabla RENAME TO nuevo_nombre_tabla;
```

#### CAMBIAR NOMBRE COLUMNA {.left}
```sql
ALTER TABLE alumnos RENAMTE COLUMN nombre_columna TO nuevo_nombre_columna;
```

#### AÑADIR NUEVA COLUMNA {.left}
```sql
ALTER TABLE alumnos
	ADD COLUMN nota INTEGER DEFAULT 5;
```
	
---

### TABLAS

#### AÑADIR RELACIONES {.left}

```sql
...
columna_esta_tabla INT NOT NULL,
FOREIGN KEY (columna_esta_tabla) REFERENCES tabla_relacion(columna_relacion)
    ON UPDATE RESTRICT o CASCADE o SET NULL o SET DEFAULT
    ON DELETE RESTRICT o CASCADE o SET NULL o SET DEFAULT 
```

---

### TABLAS

#### AÑADIR RELACIONES EJEMPLO {.left}

```sql
CREATE TABLE matriculas (
    curso_id INTEGER NOT NULL,
    alumno_id INTEGER NOT NULL,
    fecha TEXT NOT NULL,

    PRIMARY KEY (curso_id, alumno_id),

    FOREIGN KEY (curso_id) REFERENCES alumnos(curso_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    FOREIGN KEY (alumno_id) REFERENCES  alumnos(alumno_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);
```

---

### TABLAS

#### VARIAS PRIMARY KEY {.left}

En el anterior ejemplo, la tabla `matriculas` tiene dos PRIMARY KEY. Esto es muy interesante porque en este caso no sería necesario que la tabla matrículas tenga un campo `matricula_id` como llave primaria. En este caso, la combinación de `curso_id` y `alumno_id` es única y no se repite.

Esto es lo que se conoce como **llave primaria compuesta**. <span class="azul">Y en este caso serviría para que no se repitieran los alumnos en un mismo curso.</span>


---

# THE END {.invisible aria-hidden="true"}
🔚 {.font-xxxl}
