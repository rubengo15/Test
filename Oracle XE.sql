SELECT * FROM emp;
--LA MEJOR PRAXIS ES UTILIZAR EL NOMBRE DE LOS CAMPOS--
--CONTROL + ENTER = EJECUTA LA LINEA DONDE ESTEMOS POSICIONADOS--
SELECT apellido, oficio, salario FROM emp;
--ORDENACION DE DATOS--
-- LA ORDENACION DE BASE SIEMPRE ES ASCENDENTE--
SELECT * FROM emp ORDER BY apellido;
-- PARA PONERLO ASCENDENTE SE USA EL ASC AL FINAL--
SELECT * FROM emp ORDER BY apellido ASC;
-- PARA PONERLO DESCENDENTE SE USA EL DESC AL FINAL--
SELECT * FROM emp ORDER BY apellido DESC;
--ORDENAR POR MAS DE UN CAMPO--
SELECT * FROM emp ORDER BY dept_no, oficio;
--FILTRADO DE REGISTROS--
--OPERADORES DE COMPARACION--
/* 
= IGUAL
>= MAYOR O IGUAL
<= MENOR O IGUAL
> MAYOR
< MENOR
<> DISTINTO
*/
--ORACLE POR DEFECTO DIFERENCIA ENTRE MAYUSCULAS Y MINUSCULAS EN SUS TEXTOS (STRING/VARCHAR)--
--TODO LO QUE NO SEA UN NUMERO SE ESCRIBE ENTRE COMILLAS SIMPLES '..'--
-- PARA FILTRAR SE UTILIZA LA PALABRA where Y SE ESCRIBE SOLAMENTE UNA VEZ EN TODA LA CONSULTA
-- DESPUES DEL FROM
--  MOSTRAR TODOS LOS EMPLANEADOS DEL DEPARTAMENTO 10
SELECT * FROM emp WHERE dept_no = 10; 
--  MOSTRAR TODOS LOS EMPLEADOS CUYO OFICIO SEA DIRECTOR
SELECT * FROM emp WHERE oficio = 'DIRECTOR';
--  MOSTRAR TODOS LOS OFICIOS QUE SEAN DIFERENTES A DIRECTOR
SELECT * FROM emp WHERE oficio <> 'DIRECTOR';
SELECT * FROM emp WHERE oficio != 'DIRECTOR';

-- OPERADORES RELACIONALES
-- NOS PERMITEN REALIZAR MAS DE UNA PREGUNTA DENTRO DE UNA CONSULTA
/*
OR --> MUESTRA LOS DATOS DE CADA FILTRO
AND --> TODOS LOS FILTROS DEBEN CUMPLIRSE
NOT --> NEGACION DE UNA CONDICION (EVITARLO SIEMPRE)
*/
--  MOSTRAR LOS EMPLEADOS DEL DEPARTAMENTO 10 Y QUE TENGAN OFICIO DIRECTOR
SELECT * FROM emp WHERE dept_no = 10 AND oficio = 'DIRECTOR';
SELECT * FROM emp WHERE dept_no = 10 OR oficio = 'DIRECTOR';
--  MOSTRAR LOS EMPLEADOS DEL DEPARTAMENTO 10 Y DEL DEPARTAMENTO 20
SELECT * FROM emp WHERE dept_no = 10 AND dept_no = 20; -- ESTE NO MUESTRA NADA AL NO HABER EMPLEADOS QUE COMPARTAN AMBOS DEPARTAMENTOS
SELECT * FROM emp WHERE dept_no = 10 OR dept_no = 20;
-- TENEMOS OTROS OPERADORES ADEMAS DE LOS ESTANDAR
-- BETWEEN MUESTRA LOS DATOS ENTRE UN RANGO INCLUSIVE
--  MOSTRAR LOS EMPLEADOS CUYO SALARIO ESTE ENTRE 251000 Y 390000
SELECT * FROM emp WHERE salario BETWEEN 251000 AND 390000 ORDER BY salario DESC; -- ordenador por salio de forma descendente
-- PODEMOS HACER LA MISMA CONSULTA CON OPERADORES Y ES EFICIENTE
SELECT * FROM emp WHERE salario >= 251000 AND salario <= 390000 ORDER BY salario DESC;
-- LA NEGACION ES ALGO DE LO QUE DEBEMOS DE HUIR
--  MOSTRAR LOS EMPLEADOS QUE NO SEAN DIRECTOR
SELECT * FROM emp WHERE NOT oficio = 'DIRECTOR'; -- EL not SIEMPRE VA DESPUES DEL WHERE
-- PODEMOS REALIZAR LA CONSULTA CON OPERADOR
SELECT * FROM emp WHERE oficio <> 'DIRECTOR';
-- EXISTE UN OPERADOR PARA BUSCAR COINCIDENCIAS EN TEXTO
-- NOS PERMITE MEDIANTE CARACTERES ESPECIALES HACER FILTROS DE TEXTO
/* 
% BUSCA CULAQUIER CARACTER Y LOGINTUD
_ UN CARACTER CUALQUIERA
? UN CARACTER NUMERICO
*/
--  MOSTRAR LOS EMPLEADOS CUYOS APELLIDOS EMPIEZAN POR S
SELECT * FROM emp WHERE apellido LIKE 's%';
--  MOSTRAR LOS EMPLEADOS CUYOS APELLIDOS FINALIZA EN A
SELECT * FROM emp WHERE apellido LIKE '%a';
--  MOSTRAR TODOS LOS EMPLEADOS CUYOS APELLIDOS SEAN DE CUATRO LETRAS
SELECT * FROM emp WHERE apellido LIKE '____'; -- CADA GUION BAJO ES UNA LETRA, POR ESO HAY 4 GUIONES BAJOS
-- EXISTE OTRO OPERADOR PARA BUSCAR COINCIDENCIAS DE IGUALDAD EN UN MISMO CAMPO
-- IN (VALOR1, VALOR2)
--  MOSTRA LOS EMPLEADOS DEL DEPARTAMENTO 10 Y DEL 20
SELECT * FROM emp WHERE dept_no IN (10, 20, 30);
-- NOT IN (VALOR1, VALOR2) MUESTRA LOS QUE NOS ESTAN DENTRO DE ESTOS VALORES
SELECT * FROM emp WHERE dept_no NOT IN (10, 20); 

-- CAMPOS CALCULADOS
-- UN CAMPO CALCULADO ES UNA HERRAMIENTA EN UNA CONSULTA
-- UN CAMPO CALCULADO SIEMPRE DEBE DE TENER UN ALIAS
-- SIRVE PARA GENERENAR CAMPOS QUE NO EXISTAN EN LA TABLA Y LOS PODEMOS CALCULAR
-- MOSTRAR EL APELLIDO, EL SALARIO, COMISION Y EL SALARIO TOTAL DE TODOS LOS EMPLEADOS (SALARIO + COMISION) DE TODOS LOS EMPLEADOS
SELECT APELLIDO, SALARIO AS SUELDO, COMISION, (SALARIO + COMISION) AS TOTAL FROM emp;
-- UN CAMPO CALCULADO ES SOLO PARA EL CURSOR
-- MOSTRAR EL APELLIDO, EL SALARIO, COMISION Y EL SALARIO TOTAL DE TODOS LOS EMPLEADOS (SALARIO + COMISION) DE TODOS LOS EMPLEADOS CUYO SALARIO + COMISION SEA MAYOR A 344500
SELECT APELLIDO, SALARIO AS SUELDO, COMISION, (SALARIO + COMISION) AS TOTAL FROM emp WHERE (SALARIO + COMISION) >= 344500;
-- QUEREMOS LA CONSULTA ORIGINAL Y ORDENAR POR ELLA
SELECT APELLIDO, SALARIO AS SUELDO, COMISION, (SALARIO + COMISION) AS TOTAL FROM emp ORDER BY TOTAL; -- ORDER BY AFECTA SOBRE EL SELECT, DESPUES IRIA EL WHERE
-- CLAUSULA DISTINC: SE UTILIZA PARA EL SELECT Y LO QUE REALIZA ES ELIMINAR REPETIDOS DE LA CONSULTA
-- MOSTRAR EL OFICIO DE LOS EMPLEADOS
SELECT OFICIO FROM emp;
-- MOSTRAR LOS DIFERENTES OFICIOS DE LOS EMPLEADOS
SELECT DISTINCT OFICIO FROM emp;
-- MOSTRAR LOS DIFERENTES OFICIOS Y APELLIDOS DE LOS EMPLEADOS (NO TIENE SENTIDO HACERLO)
SELECT DISTINCT OFICIO, APELLIDO FROM emp;

--  CONSULAS DE SELECCION

SELECT * FROM enfermo;



--                                              EJERCICIOS

-- EJERCICIO 6
-- Mostrar todos los enfermos nacidos antes del 11/01/1970.
SELECT * FROM enfermo;
DESC enfermo; --muestra la informacion de la tabla
SELECT * FROM enfermo WHERE FECHA_NAC < '11/01/1970';
-- EJERCICIO 7
-- Igual que el anterior, para los nacidos antes del 1/1/1970 ordenados por número de inscripción.
SELECT * FROM enfermo WHERE FECHA_NAC < '11/01/1970' ORDER BY INSCRIPCION;
-- EJERCICIO 8
-- Listar todos los datos de la plantilla del hospital del turno de mañana
SELECT * FROM plantilla;
SELECT * FROM plantilla WHERE TURNO = 'M';
-- EJERCICIO 9
-- Idem del turno de noche.
SELECT * FROM plantilla;
SELECT * FROM plantilla WHERE TURNO = 'N';
-- EJERCICIO 10
-- Listar los doctores que su salario anual supere 3.000.000 €.
SELECT * FROM plantilla;
SELECT (SALARIO*12) AS SUELDO_ANUAL FROM plantilla WHERE (SALARIO*12) > 3000000;
SELECT * FROM plantilla WHERE (SALARIO*12) > 3000000;
-- EJERCICIO 11
-- Visualizar los empleados de la plantilla del turno de mañana que tengan un salario entre 2.000.000 y 2.250.000.
SELECT * FROM plantilla WHERE TURNO = 'M';
SELECT * FROM plantilla WHERE TURNO = 'M' AND (SALARIO >= 200000 and SALARIO <= 225000);
-- EJERCICIO 12
-- Visualizar los empleados de la tabla emp que no se dieron de alta entre el 01/01/1986 y el 12/12/1994.
SELECT * FROM emp;
SELECT * FROM emp WHERE (FECHA_ALT <= '01/01/86' OR FECHA_ALT >= '12/12/94') AND OFICIO = 'EMPLEADO'; -- EJERCICIO CORRECTO
SELECT * FROM emp WHERE (FECHA_ALT >= '01/01/86' AND FECHA_ALT <= '12/12/94') AND OFICIO = 'EMPLEADO'; -- MUESTRA LOS QUE SI SE DIERON DE ALTA ENTRE ESAS FECHAS
SELECT * FROM emp WHERE NOT ( FECHA_ALT >= '01/01/86' AND FECHA_ALT <= '12/12/94') AND OFICIO = 'EMPLEADO'; -- EJERCICIO CORRECTO TAMBIEN USANDO EL not
-- EERCICIO 13
-- Mostrar los nombres de los departamentos situados en Madrid o en Barcelona.
SELECT * FROM dept;
SELECT DNOMBRE FROM dept;
SELECT DNOMBRE, LOC FROM dept WHERE LOC = 'BARCELONA' OR LOC = 'MADRID';
SELECT DISTINCT DNOMBRE,LOC FROM dept WHERE LOC IN ('BARCELONA','MADRID');
SELECT DNOMBRE, LOC FROM dept WHERE LOC IN ('BARCELONA','MADRID'); -- EJERCICIO CORRECTO

-- CONSULTAS DE AGRUPACION
-- ESTE TIPO DE CONSULTAS NOS PERMITEN MOSTRAR ALGUN RESUMEN SOBRE UN GRUPO DETERMINADO DE LOS DATOS
-- UTILIZAN FUNCIONES DE AGRUPACION PARA CONSEGUIR EL RESUMEN
-- LAS FUNCIONES DEBEN TENER ALIAS
-- COUNT (*): CUENTA EL NUMERO DE REGISTROS, INCLUYENDO NULOS
-- COUNT (CAMPO): CUENTA EL NUMERO DE REGISTROS SIN NULOS
-- SUM (NUMERO): SUMA EL TOTAL DE UN CAMPO NUMERICO
-- AVG (NUMERO): RECUPERA LA MEDIA DE UN CAMPO NUMERICO
-- MAX (CAMPO): DEVUELVE EL MAXIMO VALOR DE UN CAMPO
-- MIN (CAMPO): DEVUELVE EL MINIMO VALOR DE UN CAMPO

-- MOSTRAR EL NUMERO DE REGISTROS DE LA TABLA DOCTOR
SELECT COUNT(*) AS numero_doctores FROM doctor;
SELECT COUNT(apellido) AS numero_doctores FROM doctor;
-- PODEMOS COMBINAR SIN PROBLEMA VARIAS FUNCIONES
-- QUEREMOS EL NUMERO DE DOCTORES Y EL MAXIMO DE SALARIO
SELECT COUNT (*) AS doctores, MAX (salario) AS maximo FROM doctor;
-- LOS DATOS RESULTANTES DE LAS FUNCIONES PODEMOS AGRUPARLOS POR ALGUN CAMPO O CAMPOS DE LA TABLA
-- CUANDO QUEREMOS AGRUPAR UTILIZAMOS group by DESPUES DEL from
--TRUCO: DEBEMOS AGRUPAR POR CADA CAMPO QUE NO SEA UNA FUNCION

-- MOSTRAR CUANTOS DOCTORES EXISTEN POR CADA ESPECIALIDAD
SELECT * FROM doctor;
SELECT COUNT (*) AS doctores, especialidad FROM DOCTOR GROUP BY especialidad;

-- MOSTRAR NUMERO DE PERSONAS Y MAXIMO SALARIO DE LOS EMPLEADOS POR CADA DEPARTAMENTO Y OFICIO
SELECT COUNT (*) AS personas, MAX (salario) AS maximo_salario, dept_no, oficio FROM emp GROUP BY dept_no, oficio;

-- MOSTRAR EL NUMERO DE PERSONAS DE LA PLANTILLA
SELECT COUNT (*) AS personas FROM plantilla;

-- MOSTRAR EL NUMERO DE PERSONAS DE LA PLANTILLA POR CADA TURNO
SELECT COUNT (*) AS personas, turno FROM plantilla GROUP BY turno;
SELECT turno, COUNT (*) AS personas FROM plantilla GROUP BY turno;

-- FILTRANDO EN CONSULTAS DE AGRUPACION
-- TENEMOS DOS POSIBILIDADES:
-- WHERE: ANTES DEL GROUP BY Y PARA FILTRAR SOBRE LA TABLA
-- HAVING: DESPUES DEL GROUP BY Y PARA FILTRAR SOBRE EL CONJUNTO

-- MOSTRAR CUANTOS EMPLEADOS TENEMOS POR CADA OFICIO
SELECT COUNT (*) AS empleados, oficio FROM emp GROUP BY oficio;

-- MOSTRAR CUANTOS EMPLEADOS TENEMOS POR CADA OFICIO QUE COBREN MAS DE 200000
SELECT COUNT (*) AS empleados, oficio FROM emp WHERE salario > 200000 GROUP BY oficio;

-- MOSTRAR CUANTOS EMPLEADOS TENEMOS POR CADA OFICIO Y QUE SEAN ANALISTAS O VENDEDORES
-- (PODEMOS DECIDIR CON HAVING O WHERE)
SELECT COUNT (*) AS empleados, oficio FROM emp GROUP BY oficio HAVING oficio IN ('ANALISTA', 'VENDEDOR'); -- MAS RAPIDO
SELECT COUNT (*) AS empleados, oficio FROM emp WHERE oficio IN ('ANALISTA', 'VENDEDOR') GROUP BY oficio;

-- CUANDO NO PODEMOS DECIDIR Y ESTAMOS OBLIGADOS A USAR HAVING:
-- SI QUEREMOS FILTRAR POR UNA FUNCION DE AGRUPACION

-- MOSTRAR CUANTOS EMPLEADOS TENEMOS POR CADA OFICIO SOLAMENTE DONDE TENGAMOS 2 O MAS EMPLEADOS DEL MISMO OFICIO
SELECT COUNT (*) AS empleados, oficio FROM emp GROUP BY oficio HAVING COUNT (*) >= 2;


--                                              EJERCICIOS

-- EJERCICIO 2
-- Encontrar el salario más alto, mas bajo y la diferencia entre ambos de todos los empleados con oficio EMPLEADO.
SELECT oficio, MAX (salario) AS maximo_salario, MIN (salario) AS minimo_salario, MAX (salario) - MIN (salario) AS diferencia_salarios FROM emp GROUP BY oficio HAVING oficio = 'EMPLEADO';

-- EJERCICIO 4
-- Visualizar el número de personas que realizan cada oficio en cada departamento ordenado por departamento.
SELECT COUNT (*) AS personas, oficio, dept_no FROM emp GROUP BY dept_no, oficio ORDER BY 3;

-- EJERCICIO 5
-- Buscar aquellos departamentos con cuatro o más personas trabajando.
SELECT * FROM emp;
SELECT COUNT (*) AS personas, dept_no  FROM emp GROUP BY dept_no HAVING COUNT (*) >= 4;

-- EJERCICIO 7
-- Visualizar el número de enfermeros, enfermeras e interinos que hay en la plantilla, ordenados por la función.
SELECT funcion, COUNT (*) AS puestos FROM plantilla GROUP BY funcion HAVING funcion IN ('ENFERMERO', 'ENFERMERA', 'INTERINO') ORDER BY funcion;

-- EJERCICIO 8
-- Visualizar departamentos, oficios y número de personas, para aquellos departamentos que tengan dos o más personas trabajando en el mismo oficio.
SELECT dept_no, oficio, COUNT (*) AS personas FROM emp GROUP BY oficio, dept_no HAVING COUNT (*) >= 2;

-- EJERCICIO 10
-- Calcular el valor medio de las camas que existen para cada nombre de sala. Indicar el nombre de cada sala y el número de cada una de ellas.
SELECT * FROM sala;
SELECT COUNT (nombre), nombre, AVG (NUM_CAMA) AS media_camas from sala GROUP BY nombre; 

-- EJERCICIO 11
-- Calcular el salario medio de la plantilla de la sala 6, según la función que realizan. Indicar la función y el número de empleados.
SELECT * FROM plantilla;
SELECT COUNT (*) AS empleados, sala_cod, AVG (salario), funcion FROM plantilla GROUP BY sala_cod, funcion HAVING sala_cod = 6;

-- EJERCICIO 13
-- Mostrar el número de hombres y el número de mujeres que hay entre los enfermos.
SELECT * FROM enfermo;
SELECT COUNT (*) AS personas, sexo FROM enfermo GROUP BY sexo;

-- EJERCICIO 15
-- Calcular el número de salas que existen en cada hospital.
SELECT * FROM sala;
SELECT COUNT (*) AS numero_salas, hospital_cod FROM sala GROUP BY hospital_cod;

-- EJERCICIO 16
-- Mostrar el número de enfermeras que existan por cada sala
SELECT * FROM plantilla;
SELECT COUNT (*) AS enfermeras_sal, sala_cod AS enfermeras_sala FROM plantilla WHERE funcion = 'ENFERMERA' GROUP BY sala_cod;



-- CONSULTAS DE COMBINACION
-- NOS PERMITEN MOSTRAR DATOS DE VARIAS TABLAS QUE DEBEN ESTAR RELACCIONADAS ENTRE SI MEDIANTE UNA CLAVE
-- 1) NECESITAMOS EL CAMPO O CAMPOS DE RELACCION ENTRE LAS TABLAS (CAMPO = COLUMNA)
-- 2) DEBEMOS PONER EL NOMBRE DE CADA TABLA Y CADA CAMPO EN LA CONSULTA
-- SINTAXIS:
SELECT TABLA1.CAMPO1, TABLA1.CAMPO2,
TABLA2.CAMPO1, TABLA2.CAMPO2 
FROM TABLA1
INNER JOIN TABLA2
ON TABLA1.CAMPORELACION = TABLA2.CAMPORELACION;

-- MOSTRAR EL APELLIDO, EL OFICIO DE EMPLEADOS JUNTO A SU NOMBRE DE DEPARTAMENTO Y LOCALIDAD
SELECT emp.apellido, emp.oficio, dept.dnombre, dept.loc FROM emp INNER JOIN dept ON emp.dept_no = dept.dept_no; --ESTA ESLA EFICIENTE Y CORRECTA

-- TENEMOS OTRA SINTAXIS PARA REALIZAR LOS JOIN
SELECT emp.apellido, emp.oficio, dept.dnombre, dept.loc FROM emp, dept WHERE emp.dept_no = dept.dept_no; -- YA NO SE USA

-- PODEMOS REALIZAR, POR SUPUESTO NUESTROS WHERE
-- QUEREMOS MOSTRAR LOS DATOS SOLO DE MADRID
SELECT emp.apellido, emp.oficio, dept.dnombre, dept.loc FROM emp INNER JOIN dept ON emp.dept_no = dept.dept_no WHERE dept.loc = 'MADRID';

-- NO ES OBLIGATORIO INCLUIR EL NOMBRE DE LA TABLA ANTES DEL CAMPO A MOSTRAR EN EL SELECT, PERO ES PEOR YA QUE LLEVA A PERDIDAS DE INFORMACION
SELECT emp.apellido, oficio, dept.dnombre, loc FROM emp INNER JOIN dept ON emp.dept_no = dept.dept_no;

-- PODEMOS INCLUIR ALIAS A LOS NOMBRES DE LAS TABLAS PARA LLAMARLAS ASI A LO LARGO DE LA CONSULTA, ES UTIL CUANDO TENEMOS TABLAS CON NOMBRES MUY LARGOS
-- CUANDO PONEMOS ALIAS, LA TABLA SE LLAMARA ASI PARA TODA LA CONSULTA
SELECT e.apellido, e.oficio, d.dnombre, d.loc FROM emp e INNER JOIN dept d ON e.dept_no = d.dept_no; -- EN EL FROM E INNER JOIN SE PONEN LOS ALIAS 

-- TENEMOS MULTIPLES TIPOS DE JOIN EN LAS BASES DE DATOS:
-- INNER: COMBINA LOS RESULTADOS DE LAS DOS TABLAS
-- LEFT: COMBINA LAS DOS TABLAS Y LA TABLA IZQUIERDA
-- RIGHT: COMBINA LAS DOS TABLAS Y LA TABLA DERECHA
-- FULL: COMBINA LAS DOS TABLAS Y FUERZA LAS DOS TABLAS
-- CROSS: PRODUCTO CARTESIANO, COMBINAR CADA DATO DE UNA TABLA CON LOS OTROS DATOS DE LA OTRA TABLA

SELECT DISTINCT dept_no from emp;
SELECT * FROM dept;
SELECT e.apellido, e.oficio, d.dnombre, d.loc FROM emp e INNER JOIN dept d ON e.dept_no = d.dept_no ORDER BY d.loc;


-- TENEMOS UN DEPARTAMENO: 40, PRODUCCION, GRANADA SIN EMPLEADOS
-- VAMOS A CREAR UN NUEVO EMPLEADO QUE NO TENGA DEPARTAMENTO

INSERT INTO emp VALUES('1111', 'sin dept', 'EMPLEADO', 7919, TO_DATE('20-10-1986', 'DD-MM-YYYY'), 258500, 50000, 50);
SELECT * FROM emp;

-- TENEMOS UN EMPLEADO SIN DEPARTAMENTO EN EL 50
SELECT emp.apellido, dept.dnombre, dept.loc FROM emp INNER JOIN dept ON emp.dept_no = dept.dept_no;

-- LEFT: COMBINA LAS DOS TABLAS Y LA TABLA IZQUIERDA
-- LA TABLA DE LA IZQUIERDA ES LA DE ANTES DEL JOIN
SELECT emp.apellido, dept.dnombre, dept.loc FROM emp LEFT JOIN dept ON emp.dept_no = dept.dept_no;

-- RIGHT: COMBINA LAS DOS TABLAS Y LA TABLA DERECHA
-- LA TABLA DE LA DERECHA ES LA DE DESPUES DEL JOIN
SELECT emp.apellido, dept.dnombre, dept.loc FROM emp RIGHT JOIN dept ON emp.dept_no = dept.dept_no;

-- FULL: COMBINA LAS DOS TABLAS Y FUERZA LAS DOS TABLAS
SELECT emp.apellido, dept.dnombre, dept.loc FROM emp FULL JOIN dept ON emp.dept_no = dept.dept_no;

-- CROSS: PRODUCTO CARTESIANO, COMBINAR CADA DATO DE UNA TABLA CON LOS OTROS DATOS DE LA OTRA TABLA, NO LLEVA ON
SELECT emp.apellido, dept.dnombre, dept.loc FROM emp CROSS JOIN dept;

-- MOSTRAR LA MEDIA SALARIAL DE LOS DOCTORES POR HOSPITAL
SELECT AVG (salario) as media, hospital_cod FROM doctor GROUP BY hospital_cod;
-- MOSTRAR LA MEDIA SALARIAL DE LOS DOCTORES POR HOSPITAL MOSTRANDO EL NOMBRE DEL HOSPITAL
SELECT AVG (doctor.salario) as media, hospital.nombre FROM doctor INNER JOIN hospital ON doctor.hospital_cod = hospital.hospital_cod GROUP BY hospital.nombre;

-- MOSTRAR EL NUMERO DE EMPLEADOS QUE EXISTEN POR CADA LOCALIDAD
SELECT COUNT (emp.emp_no) AS cantidad_empleados, dept.loc FROM emp RIGHT JOIN dept ON emp.dept_no = dept.dept_no GROUP BY dept.loc;
SELECT * FROM emp;


--                                              EJERCICIOS

-- EJERCICIO 1
-- Seleccionar el apellido, oficio, salario, numero de departamento y su nombre de todos los empleados cuyo salario sea mayor de 300000
SELECT * FROM dept;
SELECT * FROM emp;
SELECT emp.apellido, emp.oficio, emp.salario, dept.dept_no, dept.dnombre FROM emp INNER JOIN dept ON emp.dept_no = dept.dept_no WHERE emp.salario >= '300000';

-- EJERCICIO 2
-- Mostrar todos los nombres de Hospital con sus nombres de salas correspondientes.
SELECT * FROM hospital;
SELECT * FROM sala;
SELECT sala.nombre AS sala_hospital, hospital.nombre AS nombre_hospital FROM sala INNER JOIN hospital ON sala.hospital_cod = hospital.hospital_cod;

-- EJERCICIO 3
-- Calcular cuántos trabajadores de la empresa hay en cada ciudad.
SELECT * FROM dept;
SELECT * FROM emp;
SELECT dept.loc, COUNT (emp.emp_no) AS cantidad_empleados FROM dept LEFT JOIN emp ON emp.dept_no = dept.dept_no GROUP BY dept.loc;

-- EJERCICIO 4
-- Visualizar cuantas personas realizan cada oficio en cada departamento mostrando el nombre del departamento.
SELECT * FROM dept;
SELECT * FROM emp;
SELECT dept.dnombre, COUNT (emp.emp_no) AS personas , emp.oficio FROM dept LEFT JOIN emp ON emp.dept_no = dept.dept_no GROUP BY emp.oficio, dept.dnombre;

-- EJERCICIO 5
-- Contar cuantas salas hay en cada hospital, mostrando el nombre de las salas y el nombre del hospital
SELECT * FROM hospital;
SELECT * FROM sala;
SELECT COUNT (sala.sala_cod) AS numero_salas, sala.nombre AS sala_nombre, hospital.nombre AS hospital_nombre FROM sala INNER JOIN hospital ON sala.hospital_cod = hospital.hospital_cod GROUP BY sala.nombre, hospital.nombre;

-- EJERCICIO 6
-- Queremos saber cuántos trabajadores se dieron de alta entre el año 1997 y 1998 y en qué departamento.
SELECT * FROM dept;
SELECT * FROM emp;
SELECT COUNT (emp.emp_no) AS altas, dept.dnombre FROM dept INNER JOIN emp ON emp.dept_no = dept.dept_no WHERE (emp.fecha_alt >= '01/01/97' AND emp.fecha_alt <= '31/12/98') GROUP BY dept.dnombre;
SELECT COUNT (emp.emp_no) AS altas, dept.dnombre FROM dept INNER JOIN emp ON emp.dept_no = dept.dept_no WHERE fecha_alt BETWEEN '01/01/97' AND '31/12/98' GROUP BY dept.dnombre; -- manera del profesor

-- EJERCICIO 7
-- Buscar aquellas ciudades con cuatro o más personas trabajando.
SELECT * FROM dept;
SELECT * FROM emp;
SELECT dept.loc, COUNT (emp.emp_no) AS personas FROM dept INNER JOIN emp ON emp.dept_no = dept.dept_no GROUP BY dept.loc HAVING COUNT (emp.emp_no) >= '4';

-- EJERCICIO 8
-- Calcular la media salarial por ciudad.Mostrar solamente la media para Madrid y SEVILLA.
SELECT * FROM dept;
SELECT * FROM emp;
SELECT dept.loc, AVG (emp.salario) AS media_salarial FROM dept INNER JOIN emp ON emp.dept_no = dept.dept_no GROUP BY dept.loc  HAVING dept.loc = 'MADRID' OR dept.loc = 'SEVILLA';
SELECT dept.loc, AVG (emp.salario) AS media_salarial FROM dept INNER JOIN emp ON emp.dept_no = dept.dept_no GROUP BY dept.loc  HAVING dept.loc IN ('MADRID', 'SEVILLA'); -- manera del profesor

-- EJERCICIO 9
-- Mostrar los doctores junto con el nombre de hospital en el que ejercen, la dirección y el teléfono del mismo.
SELECT * FROM hospital;
SELECT * FROM doctor;
SELECT doctor.apellido, hospital.nombre, hospital.direccion, hospital.telefono FROM doctor INNER JOIN hospital ON hospital.hospital_cod = doctor.hospital_cod;

-- EJERCICIO 10
-- Mostrar los nombres de los hospitales junto con el mejor salario de los empleados dela plantilla decada hospital.
SELECT * FROM hospital;
SELECT * FROM plantilla;
SELECT hospital.nombre, MAX (plantilla.salario) AS maximo_salario FROM hospital INNER JOIN plantilla ON hospital.hospital_cod = plantilla.hospital_cod GROUP BY hospital.nombre;

-- EJERCICIO 11
-- Visualizar el Apellido, función y turnode los empleados de la plantilla junto con el nombre de la salayel nombre del hospitalcon el teléfono.
-- SELECT TABLA1.CAMPO1, TABLA1.CAMPO2, TABLA2.CAMPO1, TABLA2.CAMPO2, TABLA3.CAMPO1, TABLA3.CAMPO2 FROM TABLA1 INNER JOIN TABLA2 ON TABLA1.RELACION = TABLA2.RELACION INNER JOIN TABLA3 ON TABLA1.RELACION = TABLA3.RELACION;
SELECT * FROM plantilla;
SELECT * FROM sala;
SELECT * FROM hospital;
SELECT plantilla.apellido, plantilla.funcion, plantilla.turno, sala.nombre AS nombre_sala, hospital.nombre AS nombre_hospital, hospital.telefono FROM plantilla INNER JOIN hospital ON plantilla.hospital_cod = hospital.hospital_cod INNER JOIN sala ON hospital.hospital_cod = sala.hospital_cod AND plantilla.sala_cod = sala.sala_cod;

-- EJERCICIO 12
-- Visualizar el máximo salario, mínimo salario de los Directores dependiendo de la ciudad en la que trabajen. Indicar el número total de directores por ciudad
SELECT * FROM dept;
SELECT * FROM emp;
SELECT COUNT (emp.emp_no) as directores, emp.oficio, dept.loc, MAX (emp.salario) AS maximo_salario, MIN (emp.salario) AS minimo_salario FROM dept INNER JOIN emp ON emp.dept_no = dept.dept_no GROUP BY emp.oficio, dept.loc HAVING oficio = 'DIRECTOR';
SELECT COUNT (emp.emp_no) as directores, dept.loc, MAX (emp.salario) AS maximo_salario, MIN (emp.salario) AS minimo_salario FROM dept INNER JOIN emp ON emp.dept_no = dept.dept_no WHERE oficio = 'DIRECTOR' GROUP BY dept.loc; --Manera del profesor

-- EJERCICIO 13
-- Averiguar la combinación de que salas podría haber por cada uno de los hospitales
SELECT * FROM hospital;
SELECT * FROM sala;
SELECT sala.nombre AS nombre_sala, hospital.nombre AS nombre_hospital FROM sala CROSS JOIN hospital;


-- SUBCONSULTAS 
-- SON CONSULTAS QUE NECESITAN DEL RESULTADO DE OTRA CONSULTA PARA PODER SER EJECUTADAS. NO SON AOUTONOMAS, NECESITAN ALGUN VALOR. 
-- NO IMPORTA EL NIVEL DE ANIDAMIENTO DE SUBCONSULTAS, AUNQUE PUEDEN REALENTIZAR LA RESPUESTA.
-- GENERAN BLOQUEOS EN CONSULTAS SELECT, LO QUE TAMBIEN REALENTIZAN LAS RESPUESTAS
-- DEBEMOS INTENTAR EVITARLAS EN LA MEDIDA DE LO POSIBLE CON SELECT

-- QUIERO VISUALIZAR LOS DATOS DEL EMPLEADO QUE MAS COBRA DE LA EMPRESA (EMP)
SELECT MAX (salario) FROM emp;
-- 650000
SELECT * FROM emp WHERE salario = 650000;
-- SE EJECUTAN LAS DOS CONSULTAS A LA VEZ Y SE ANIDA EL RESULTADO DE UNA CONSULTA CON LA IGUALDAD DE LA RESPUESTA DE OTRA CONSULTA
-- LAS SUBCONSULTAS VAN ENTRE PARENTESIS
SELECT * FROM emp WHERE salario = (SELECT MAX (salario) FROM emp);

-- MOSTRAR LOS EMPLEADOS QUE TIENEN EL MISMO OFICIO QUE EL EMPLEADO "GIL"
SELECT * FROM emp;
SELECT * FROM emp WHERE oficio = (SELECT oficio FROM emp WHERE apellido = 'gil');
-- MOSTRAR LOS EMPLEADOS QUE TIENEN EL MISMO OFICIO QUE EL EMPLEADO "GIL" Y QUE COBREN MENOS QUE "JIMENEZ"
SELECT * FROM emp;
SELECT * FROM emp WHERE oficio = (SELECT oficio FROM emp WHERE apellido = 'gil') AND salario < (SELECT salario FROM emp WHERE apellido = 'jimenez');
-- MOSTRAR LOS EMPLEADOS QUE TIENEN EL MISMO OFICIO QUE EL EMPLEADO "GIL" Y EL MISMO OFICIO QUE "JIMENEZ"
-- SI UNA SUBCONSULTA DEVUELVE MAS DE UN VALOR, SE UTILIZA EL OPERADOR IN
SELECT * FROM emp;
SELECT * FROM emp WHERE oficio IN (SELECT oficio FROM emp WHERE apellido = 'gil' OR apellido = 'jimenez');

-- POR SUPUESTO, PODEMOS UTILIZAR SUBCONSULTAS PARA OTRAS TABLAS
-- EVITARLO SI LAS TABLAS TIENEN ALGUNA RELACION DE CAMPOS
-- MOSTRAR EL APELLIDO Y EL OFICIO DE LOS EMPLEADOS DEL DEPARTAMENTO DE MADRID
SELECT apellido, oficio FROM emp WHERE dept_no = (SELECT dept_no FROM dept WHERE LOC = 'MADRID');
SELECT emp.apellido, emp.oficio FROM emp INNER JOIN dept ON emp.dept_no = dept.dept_no WHERE dept.loc = 'MADRID'; -- ESTA SERIA LA MANERA MAS EFICIENTE DE HACERLO


-- CONSULTAS UNION
-- MUESTRAN, EN UN MISMO CURSOR, UN MISMO CONJUNTO DE RESULTADOS
-- ESTAS CONSULTAS SE UTILIZAN COMO CONCEPTO, NO COMO RELACION
-- DEBEMOS DE SEGUIR TRES NORMAS:
-- 1) LA PRIMERA CONSULTA ES LA JEFA
-- 2) TODAS LAS CONSULTAS DEBEN TENER EL MISMO NUMERO DE COLUMNAS
-- 3) TODAS LAS COLUMNAS DEBEN TENER EL MISMO TIPO DE DATO ENTRE SI

-- EN NUESTRA BASE DE DATOS, TENEMOS DATOS DE PERSONAS EN DIFERENTES TABLAS
-- EMP, PLANTILLA Y DOCTOR
SELECT apellido, oficio, salario FROM emp UNION SELECT apellido, funcion, salario FROM plantilla UNION SELECT apellido, especialidad, salario  FROM doctor;
-- POR SUPUESTO PODEMOS ORDENAR SIN PROBLEMA
SELECT apellido, oficio, salario FROM emp UNION SELECT apellido, funcion, salario FROM plantilla UNION SELECT apellido, especialidad, salario  FROM doctor ORDER BY salario;
-- EN LOS UNION ES MEJOR ORDENAR POR NUMERANDO "ORDER BY 3" POR EJEMPLO EN ESTE CASO. YA QUE SI PONEMOS UN ALIAS NO FUNCIONARIA, SOLO CON NUMERANDO.
SELECT apellido, oficio, salario FROM emp UNION SELECT apellido, funcion, salario FROM plantilla UNION SELECT apellido, especialidad, salario  FROM doctor ORDER BY 3;
-- SI NO SE LLAMAN IGUAL LAS COLUMNAS EL ORDER BY CON NOMBRE NO FUNCIONARA, POR ESO USAR SIEMPRE NUMERANDO
-- POR SUPUESTO PODEMOS FILTRAR LOS DATOS DE LA CONSULTA.
-- MOSTRAR LOS DATOS DE LAS PERSONAS QUE COBREN MENOS DE 300000
SELECT apellido, oficio, salario FROM emp WHERE salario < 300000 UNION SELECT apellido, funcion, salario FROM plantilla WHERE salario < 300000 UNION SELECT apellido, especialidad, salario FROM doctor WHERE salario < 300000 ORDER BY 1;
-- CADA FILTRO ES AFECTADO A CADA UNA DE LAS COLUMNAS
-- CADA WHERE ES INDEPENDIENTE, SE HACEN EN CADA SELECT

-- UNION ELIMINA LOS RESULTADOS REPETIDOS
SELECT apellido, oficio FROM emp UNION SELECT apellido, oficio FROM emp;
-- SI QUEREMOS RESULTADOS REPETIDOS DEBEMOS USAR UNION ALL
SELECT apellido, oficio FROM emp UNION ALL SELECT apellido, oficio FROM emp;

-- SELECT TO SELECT
-- ES UNA CONSULTA SOBRE UN CURSOR (SELECT)
-- CUANDO HACEMOS UN SELECT EN REALIDAD ESTAMOS RECUPERANDO DATOS DE UNA TABLA
-- ESTE TIPO DE CONSULTAS NOS PERMITEN RECUPERAR DATOS DE UN SELECT YA REALIZADO.
-- LOS WHERE Y DE MAS SE HACEN SOBRE EL CURSOR.
-- SITAXIS:
SELECT * FROM (SELECT TABLA1.CAMPO1 AS ALIAS, TABLA1.CAMPO2 FROM TABLA1 UNION TABLA2.CAMPO1, TABLA2.CAMPO2 FROM TABLA2) CONSULTA WHERE CONSULTA.ALIAS = 'VALOR';

-- QUEREMOS MOSTRAR LOS DATOS DE TODAS LAS PERSONAS DE MI BBDD (EMP, DOCTOR, PLANTILLA)
-- SOLAMENTE QUEREMOS LOS QUE COBREN MENOS DE 300000
SELECT * FROM (SELECT apellido, oficio, salario AS sueldo FROM emp UNION SELECT apellido, funcion, salario FROM plantilla UNION SELECT apellido, especialidad, salario FROM doctor) datos WHERE datos.sueldo < 300000  ORDER BY 1;

-- CONSULTAS A NIVEL DE FILA
-- SON CONSULTAS CREADAS PARA DAR FORMA A LA SALIDA DE DATOS
-- NO MODIFICAN LOS DATOS DE LA TABLA, LOS MUESTRAN DE OTRA FORMA SEGUN YO LOS NECESITE. VAN CON PREGUNTAS EN LAS CONSULTAS.
-- 1) SINTAXIS EALUANDO UN CAMPO DE IGUALDAD:
SELECT CAMPO1, CAMPO2, CASE CAMPO3 WHEN 'DATO1' THEN 'VALOR1' WHEN 'DATO2' THEN 'VALOR2' ELSE 'VALOR3' END AS ALIAS FROM TABLA; 

SELECT * FROM plantilla;
-- MOSTRAMOS LOS DATOS DE LA PLANTILLA PERO CON SU TURNO QUE SE VEA BIEN
SELECT apellido, funcion, CASE turno WHEN 'T' THEN 'TARDE' WHEN 'M' THEN 'MAÑANA' WHEN 'N' THEN 'NOCHE' END AS turno_alargado FROM plantilla;

-- 2) EVALUAR POR UN OPERADOR (RANGO, MAYOR O MENOR, DISTINTO)
SELECT campo1, campo2, CASE WHEN campo3 <= 800 THEN 'resultado' WHEN campo3 > 800 THEN 'resultado2' ELSE 'resultado3'  END AS formato FROM tabla;

-- MOSTRAR SALARIOS DE LA PLANTILLA
SELECT * FROM plantilla;
SELECT apellido, funcion, salario, CASE WHEN salario >= 250000 THEN 'salario correcto' WHEN salario >= 170000 AND salario < 250000 THEN 'salario medio' ELSE 'becario' END AS rango_salarial FROM plantilla;

SELECT apellido, funcion, salario,
    CASE WHEN salario >= 250000 THEN 'salario correcto'
    WHEN salario >= 170000 AND salario < 250000 THEN 'salario medio'
    ELSE 'becario'
END AS rango_salarial
FROM plantilla;


--                                              EJERCICIOS

-- EJERCICIO 1
-- MOSTRAR LA SUMA SALARIAL DE LOS EMPLEADOS POR SU NOMBRE DE DEPARTAMENTO
SELECT dept.dnombre AS departamento, SUM (emp.salario) AS suma_salarial FROM dept INNER JOIN emp ON dept.dept_no = emp.dept_no GROUP BY dept.dnombre;

-- EJERCICIO 2
-- MOSTRAR LA SUMA SALARIAL DE LOS DOCTORES POR SU HOSPITAL
SELECT hospital.nombre AS hospital, SUM (doctor.salario) AS suma_salarial FROM hospital INNER JOIN doctor ON hospital.hospital_cod = doctor.hospital_cod GROUP BY hospital.nombre;

-- EJERCICIO 3
-- ME GUSTARIA PODER VER TODO JUNTO EN UNA MISMA CONSULTA
SELECT dept.dnombre AS departamento_u_hospital, SUM (emp.salario) AS suma_salarial FROM dept INNER JOIN emp ON dept.dept_no = emp.dept_no GROUP BY dept.dnombre UNION SELECT hospital.nombre AS hospital, SUM (doctor.salario) AS suma_salarial FROM hospital INNER JOIN doctor ON hospital.hospital_cod = doctor.hospital_cod GROUP BY hospital.nombre;



-- CONSULAS DE ACCION
-- SON CONSULTAS PARA MODIFICAR LOS REGISTROS DE LA BBDD
-- EN ORACLE, LAS CONSULAS DE ACCION SON TRANSACCIONALES, ES DECIR, SE ALMACENAN DE FORMA TEMPORAL POR SESION.
-- PARA DESHACER LOS CAMBIOS O HACERLOS PERMANENTES TENEMOS DOS PALABRAS:
-- COMMIT: HACE LOS CAMBIOS PERMANENTES
-- ROLLBACK: DESHACE LOS CAMBIOS REALIZADOS

-- EJEMPLO:
-- 1) INSERTO 2 REGISTROS NUEVOS
-- 2) COMMIT: REGISTRA DE FORMA PERMANENTE EL PUNTO 1
-- 3) INSERTO OTRO REGISTRO NUEVO
-- 4) ROLLBACK: SOLMENTE QUITA EL PUNTO 3

-- TENEMOS 3 TIPOS DE CONSULTAS DE ACCIONES
-- INSERT: INSERTA UN NUEVO REGISTRO EN UNA LA TABLA
-- UPDATE: MODIFICA UNO O MAS REGISTROS DE UNA TABLA
-- DELETE: ELIMINA UNO O MAS REGISTROS DE UNA TABLA
-----------------------


-- INSERT 
-- CADA REGISTRO A INSERTAR ES UNA INSTRUCCION INSERT, SI QUEREMOS INSERTAR 5 REGISTROS SON 5 INSERT
-- TENEMOS DOS TIPOS DE SINTAXIS:
-- 1) INSERTAR TODOS LOS DATOS DE LA TABLA: DEBEMOS INDICAR TODAS LAS COLUMNAS/CAMPOS DE LA TABLA Y EN EL MISMO ORDEN QUE ESTEN EN LA PROPIA TABLA.
-- INSERT INTO tabla VALUES (valor1, valor2, valor3, valor4);
-- EJEMPLOS:

INSERT INTO dept VALUES (50, 'ORACLE', 'BERNABEU');
SELECT * FROM dept;
ROLLBACK;

INSERT INTO dept VALUES (50, 'ORACLE', 'BERNABEU');
COMMIT;
INSERT INTO dept VALUES (51, 'BORRAR', 'BORRAR');
ROLLBACK;
SELECT * FROM dept;

-- 2) INSERTAR SOLAMENTE ALGUNOS DATOS DE LA TABLA: DEBEMOS INDICAR EL NOMBRE DE LAS COLUMNAS QUE DESEAMOS INSERTAR Y LOS VALORES IRAN EN DICHO ORDEN, LA TABLA NO TIENE NADA QUE VER.
-- INSERT INTO tabla (campo3, campo7) VALUES (valor3, valor7);
-- EJEMPLOS:
SELECT * FROM dept;
INSERT INTO dept (dept_no, loc) VALUES (55, 'ALMERIA');

-- LAS SUBCONSULTAS SON SUPER UTILES SI ESTAMOS EN CONSULTAS DE ACCION
-- NECESITO UN DEPARTAMENTO DE SIDRA EN GIJON.
-- GENERAR EL SIGUIENTE NUMERO DISPONIBLE EN LA CONSULTA DE ACCION
SELECT * FROM dept;
SELECT MAX (dept_no) + 1 FROM dept;
INSERT INTO dept VALUES ((SELECT MAX (dept_no) + 1 FROM dept), 'SIDRA', 'GIJON');
INSERT INTO dept VALUES (56, 'SIDRA', 'GIJON');
ROLLBACK;


-- DELETE
-- ELIMINA UNA O MAS FILAS DE UNA TABLA, SI NO EXISTE NADA PARA ELIMINAR NO HACE NADA
-- DELETE FROM tabla;
-- LA SINTAXIS ANTERIOR ELIMINA TODOS LOS REGISTROS DE LA TABLA
-- OPCIONAL, INCLUIR WHERE
-- ELIMINAR EL DEARTAMENTO DE ORACLE:
SELECT * FROM dept;
DELETE FROM dept WHERE dnombre = 'ORACLE';
SELECT * FROM dept;
ROLLBACK;

-- MUY UTIL UTILIZAR SUBCONSULTAS PARA DELETE
-- ELIMINAR TODOS LOS EMPLEADOS DE GRANADA
DELETE FROM emp WHERE dept_no = (SELECT dept_no FROM dept WHERE loc = 'GRANADA');
SELECT * FROM dept;
SELECT * FROM emp;
ROLLBACK;


-- UPDATE
-- MODIFICA UNA O VARIAS FILAS DE UNA TABLA, PUEDE MODIFICAR VARIAS COLUMNAS A LA VEZ
-- UPDATE tabla SET campo1 = valor1, campo2 = valor2;
-- ESTA CONSULTA MODIFICA TODAS LAS FILAS DE LA TABLA, ES CONVENIENTE USAR UN WHERE
-- MODIFICAR EL SALARIO DE LA PLANTILLA DEL TURNO DE NOCHE, TODOS GANARAN 315000
SELECT * FROM plantilla;
UPDATE plantilla SET salario = 315000 WHERE turno = 'N';

-- MODIFICAR LA CIUDAD Y EL NOMBRE DEL DEPARTAMENTO 10. SE LLAMARA CUENTAS Y NOS VAMOS A TOLEDO
UPDATE dept SET loc = 'TOLEDO', dnombre = 'CUENTAS' WHERE dept_no = 10;
SELECT * FROM dept;
ROLLBACK;

-- PODEMOS MANTENER EL VALOR DE UNA COLUMNA Y ASIGNAR "ALGO" CON OPERACIONES MATEMATICAS
-- INCREMENTAR EN 1 EL SALARIO DE TODOS LOS EMPLEADOS
SELECT * FROM emp;
UPDATE emp SET salario = salario + 1;

-- PODEMOS UTILIZAR SUBCONSULTAS EN UPDATE
-- 1) SI LAS SUBCONSULTAS ESTAN EN EL SET, SOLAMENTE DEBEN DEVOLVER UN DATO
SELECT * FROM emp;
-- ARROYO ESTA ENVIDIOSO DE SALA, PONER EL MISMO SALARIO A ARROYO QUE SALA
UPDATE emp SET salario = (SELECT salario FROM emp WHERE apellido = 'sala') WHERE apellido = 'arroyo';

-- LOS CATALANES ESTAN SUBIDOS Y LES BAJAMOS EL SUELDO A LA MITAD.
-- PONER A LA MITAD EL SUELDO DE LOS EMPELADOS DE BARCELONA
SELECT * FROM emp;
SELECT * FROM DEPT;
UPDATE emp SET salario = salario / 2 WHERE dept_no = (SELECT dept_no FROM dept WHERE loc = 'BARCELONA');
ROLLBACK;

--                                              EJERCICIOS

-- EJERCICIO 1
-- Dar de alta con fecha actual al empleado José Escriche Barrera como programador perteneciente al departamento de producción.  Tendrá un salario base de 70000 pts/mes y no cobrará comisión.
SELECT * FROM emp;
INSERT INTO emp (emp_no, apellido, oficio, fecha_alt, salario, comision, dept_no) VALUES (( SELECT MAX (emp_no) + 1 FROM emp), 'escriche', 'PROGRAMADOR', '31/03/25', 70000, 0, (SELECT DEPT_NO FROM DEPT WHERE DNOMBRE='PRODUCCIÓN')); 


-- EJERCICIO 2
-- Se quiere dar de alta un departamento de informática situado en Fuenlabrada (Madrid).
SELECT * FROM DEPT;
INSERT INTO dept VALUES (60, 'INFORMATICA', 'FUENLABRADA');

-- EJERCICIO 3
-- El departamento de ventas, por motivos peseteros, se traslada a Teruel, realizar dicha modificación.
SELECT * FROM DEPT;
UPDATE dept SET loc = 'TERUEL' WHERE loc = 'BARCELONA';

-- EJERCICIO 4
--En el departamento anterior (ventas), se dan de alta dos empleados: Julián Romeral y Luis Alonso.  Su salario base es el menor que cobre un empleado, y cobrarán una comisión del 15% de dicho salario.
SELECT * FROM emp;

INSERT INTO emp (emp_no, oficio, apellido, salario, comision, dept_no)
VALUES (
(SELECT MAX (emp_no) + 1 FROM emp),
'EMPLEADO',
'romeral', 
(SELECT MIN (salario) FROM emp WHERE oficio = 'EMPLEADO'),
(SELECT MIN (salario) * 0.15 FROM emp WHERE oficio = 'EMPLEADO'),
30); 

ROLLBACK;

-- EJERCICIO 5
-- Modificar la comisión de los empleados de la empresa, de forma que todos tengan un incremento del 10% del salario.
SELECT * FROM emp;
UPDATE emp SET comision = salario * 0.1;

-- EJERCICIO 6
-- Incrementar un 5% el salario de los interinos de la plantilla que trabajen en el turno de noche.
SELECT * FROM plantilla;
UPDATE plantilla SET salario = salario + (salario * 0.05) WHERE funcion = 'INTERINO' AND turno = 'N';
ROLLBACK;

-- EJERCICIO 7
-- Incrementar en 5000 Pts. el salario de los empleados del departamento de ventas y del presidente, tomando en cuenta los que se dieron de alta antes que el presidente de la empresa.
SELECT * FROM emp;
SELECT * FROM dept;
UPDATE emp SET salario =  salario + 5000 WHERE fecha_alt <= '17/11/95' AND  dept_no = (SELECT dept_no FROM dept WHERE dnombre = 'VENTAS') OR oficio = 'PRESIDENTE';

-- EJERCICIO 8
-- El empleado Sanchez ha pasado por la derecha a un compañero.  Debe cobrar de comisión 12.000 ptas más que el empleado Arroyo y su sueldo se ha incrementado un 10% respecto a su compañero.
SELECT * FROM emp;
UPDATE emp SET comision = (SELECT comision + 12000 FROM emp WHERE apellido = 'arroyo'), salario = (SELECT salario * 1,10 FROM emp WHERE apellido = 'arroyo') WHERE apellido = 'sanchez';

-- EJERCICIO 9
-- Se tienen que desplazar cien camas del Hospital SAN CARLOS para un Hospital de Venezuela.  Actualizar el número de camas del Hospital SAN CARLOS.
SELECT * FROM hospital;
UPDATE hospital SET num_cama = num_cama - 100 WHERE nombre = 'san carlos';

-- EJERCICIO 10
-- Subir el salario y la comisión en 100000 pesetas y veinticinco mil pesetas respectivamente a los empleados que se dieron de alta en este año.
SELECT * FROM emp;
UPDATE emp SET salario = salario + 100000, comision = comision + 25000 WHERE fecha_alt >= '01/01/2025';

-- EJERCICIO 11
-- Ha llegado un nuevo doctor a la Paz.  Su apellido es House y su especialidad es Diagnostico.   Introducir el siguiente número de doctor disponible.
SELECT * FROM doctor;
INSERT INTO doctor (doctor_no, apellido, especialidad) VALUES ((SELECT MAX (doctor_no) + 1 FROM doctor), 'House','Diagnostico');




-- INSERT ANSI SQL (MENOS RAPIDO)
INSERT INTO dept VALUES ((SELECT MAX (dept_no) + 1 FROM dept), 'into', 'into');
INSERT INTO dept VALUES ((SELECT MAX (dept_no) + 1 FROM dept), 'into2', 'into2');
INSERT INTO dept VALUES ((SELECT MAX (dept_no) + 1 FROM dept), 'into3', 'into3');

SELECT * FROM dept;
SELECT * FROM DUAL;

-- INSERT ALL (MAS RAPIDO)
INSERT ALL 
    INTO dept VALUES ((SELECT MAX (dept_no) + 1 FROM dept), 'all', 'all')
    INTO dept VALUES ((SELECT MAX (dept_no) + 1 FROM dept), 'all2', 'all2')
    INTO dept VALUES ((SELECT MAX (dept_no) + 1 FROM dept), 'all3', 'all3')
SELECT * FROM dual;

-- EN LOS INSERT ALL NO PUEDES AÑADIR UN INCREMENTAR COMO EN EL EJEMPLO ANTERIOR YA QUE TE ASIGNA EL MISMO NUMERO A TODAS LAS FILAS

-- CREAR TABLAS CON CREATE, UTIL PARA HACER COPIAS DE TABLAS

CREATE TABLE departamentos AS SELECT * FROM dept;
DESCRIBE dept;

SELECT * FROM departamentos;
DESCRIBE departamentos;

CREATE TABLE doctoreshospital AS SELECT doctor.doctor_no as iddoctor, doctor.apellido, hospital.nombre, hospital.telefono FROM doctor INNER JOIN hospital ON doctor.hospital_cod = hospital.hospital_cod;
SELECT * FROM DOCTORESHOSPITAL;

-- INSERT INTO SELECT
-- ESTA INSTRUCCION NOS PERMIE COPIAR DATOS DE UNA TABLA ORIGEN A UNA TABLA DESTINO.
-- LA DIFERENCIA CON CREATE SELECT ESTA EN QUE LA TABLA DEBE DE EXISTIR, SIN TABLA DE DESINO NO PODEMOS EJECUTAR ESTA INSRUCCION
-- LA TABLA DE DESTINO TIENE QUE TENER LA MISMA ESTRUCTURA DE LA TABLA DE ORIGEN
-- SINTAXIS

INSERT INTO destino SELECT * FROM origen;

-- EJEMPLO
-- VAMOS A COPIAR LOS DATOS DE LA TABLA DEPT DENTRO DE LA TABLA DEPARTAMENTOS
INSERT INTO departamentos SELECT * FROM dept;
SELECT * FROM departamentos;


-- VARIABLES DE SUSTITUCON

SELECT apellido, oficio, salario, comision FROM emp WHERE emp_no = '&numero';
SELECT apellido, &&dato, salario, comision FROM emp WHERE &dato = '&dato2';
SELECT * FROM emp;
-- LA VARIABLE &DATO AL EJECUTARLA Y ASIGNARLE 'OFICIO' YA QUEDA FIJA COMO 'OFICIO', SI QUEREMOS USAR OTRA VARIABLE DEBEREMOS DE DARLE OTRA QUE NOS INVENTEMOS QUE ESTE LIBRE

-- NATURAL JOIN
-- MUESTRA TODOS LOS DATOS DE LAS DOS COLUMNAS O LOS DATOS QUE INDIQUEMOS SIN TENER QUE USAR EL INNER JOIN - ON.
SELECT apellido, oficio, dnombre, loc, dept_no, apellido FROM emp NATURAL JOIN dept;
SELECT * FROM emp NATURAL JOIN dept, enfermo;

-- USING
SELECT apellido, oficio, dnombre FROM emp INNER JOIN dept USING (dept_no);


-- NECESITO SABER LOS EMPLEADOS QUE TRABAJAN PARA negro (7698)
SELECT * FROM emp WHERE dir = 7698;

-- TENEMOS UN PRESIDENTE QUE ES EL JEFE DE LA EMPRESA: REY (7839)
-- MOSTRAR TODOS LOS EMPLEADOS QUE TRABAJAN PARA REY
SELECT * FROM emp WHERE dir = 7839;

SELECT LEVEL, DIR , EMP_NO, APELLIDO FROM EMP CONNECT BY EMP_NO = PRIOR DIR START WITH APELLIDO = 'jimenez';

SELECT LEVEL, DIR , EMP_NO, APELLIDO FROM EMP  CONNECT BY PRIOR EMP_NO = DIR START WITH APELLIDO='jimenez';

-- MOSTRAR LOS EMPLEADOS SUBORDINADOS A PARTIR DEL DIRECTOR jimenez

SELECT LEVEL AS nivel, dir, oficio, apellido FROM emp CONNECT BY PRIOR EMP_NO = DIR START WITH APELLIDO='jimenez' ORDER BY 1;

-- ARROYO HA METIDO LA MATA, QUIERO VER A TODOS SUS JEFES EN MI DESPACHO, MANDA EL LISTADO, SOY REY

SELECT LEVEL AS nivel, apellido, oficio FROM emp CONNECT BY emp_no = PRIOR dir START WITH apellido = 'arroyo';

-- SYS_CONNECT_BY_PATH (apellido,' ') AS relacion, PARA AÑADIR GRAFICAMENTE EL RESULTADO CON SEPARADORES EN UNA COLUMNA

SELECT LEVEL AS nivel, apellido, oficio, SYS_CONNECT_BY_PATH (apellido,' ') AS relacion FROM emp CONNECT BY emp_no = PRIOR dir START WITH apellido = 'arroyo';


-- INTERSECT (COGE LOS DATOS DE DOS TABLAS O UNA MISMA TABLA, UTIL PARA VER DATOS QUE SE HAN PODIDO MODIFICAR)

SELECT * FROM PLANTILLA WHERE TURNO='T' INTERSECT SELECT* FROM PLANTILLA WHERE FUNCION='ENFERMERA';

-- MINUS (MUESTRA LOS REGISTROS DEL PRIMER SELECT DE UNA TABLA QUITANDO LOS DATOS DEL RESULTADO DEL SEGUNDO SELECT)

SELECT * FROM PLANTILLA WHERE TURNO='T'MINUS SELECT * FROM PLANTILLA WHERE FUNCION='ENFERMERA';


--VAMOS A CREAR UNA TABLA LLAMADA PRUEBA PARA PRACTICAR

CREATE TABLE prueba (
    identificador INTEGER,
    texto10 VARCHAR2(10),
    textochar CHAR(5)
);

DESCRIBE prueba;

INSERT INTO prueba VALUES (1, 'asdfghjklq', 'fwfww');
INSERT INTO prueba VALUES (1, 'A', 'A');
INSERT INTO prueba VALUES (1, 'A', 'ABCDEF'); -- DA ERROR YA QUE EL TERCER CAMPO TIENE MAS DE 5 CARACTERES COMO DETERMINAMOS
SELECT * FROM prueba;

ROLLBACK;

DROP TABLE prueba;

-- LA TABLA PRUEBA CONTIENE UN REGISTRO 
-- AGREGAMOS UNA NUEVA COLUMNA DE TIPO TEXTO LLAMADA NUEVA
ALTER TABLE prueba ADD (nueva VARCHAR2(3));
SELECT * FROM prueba;
-- AGREGAMOS OTRA COLUMNA DE TIPO TEXTO LLAMADA SINNULOS Y NO ADMITIRA NULOS
ALTER TABLE prueba ADD (sinnulos VARCHAR2(3) NOT NULL);
-- DA ERROR PORQUE YA HAY DATOS ESCRITOS EN LA TABLA
-- AL HACER ALTER TABLE SE HACE UN COMIT Y YA NO SE PUEDE HACER ROLLBACK Y NO SE BORRAN LOS DATOS AGREGADOS A LA TABLA
DELETE FROM prueba;
-- SI BORRAMOS LOS DATOS DE LA TALA YA NOS PERMITE AGREGAR LA COLUMNA CON NOT NULL

-- VAMOS A BORRAR LA COLUMNA CREADA, CON DROP COLUMN, NO IMPORTA SI TIENE DATOS, LOS BORRA IGUAL
ALTER TABLE prueba DROP COLUMN sinnulos;
SELECT * FROM prueba;

-- VAMOS A MODIFICAR UNA COLUMNA, CON MODIFY, SOLO SE PUEDE CAMBIAR SI SON LERAS A LETRAS Y NUMEROS A NUMEROS EN CASO DE TENER DATOS, SI NO HAY DATOS SE PUEDE HACER CUALQUIER CAMBIO
ALTER TABLE prueba MODIFY (nueva FLOAT); 
DESCRIBE prueba;

-- CAMBIO DE NOMBRE DE UNA TABLA

RENAME prueba TO prueba1;
SELECT * FROM prueba1;
RENAME prueba1 TO prueba;

-- Elimina todas las filas de la tabla sin borrar la tabla. También resetea los contadores de auto incremento a 0. No borra la tabla como tal, la llamada estructura, por lo que luego puede comenzar a hacer inserciones.
TRUNCATE TABLE prueba;
SELECT * FROM prueba;

-- COMENTARIOS EN TABLA
-- AÑADIR COENTARIO
COMMENT ON TABLE prueba IS 'esto es un comentario';
-- VER COMENTARIO
SELECT * FROM all_tab_comments WHERE table_name = 'PRUEBA';
-- BORRAR COMENARIO
COMMENT ON TABLE prueba IS '';

--DICCIONARIO DE DATOS
-- VER TODAS LAS TABLAS DEL USUARIO
SELECT * FROM user_tables;
-- VER LOS OBJETOS DE LOS QUE ES PROPIETARIO EL USUARIO (los objetos pueden ser tablas, vistas, etc)
SELECT DISTINCT object_type FROM user_objects;
-- OBJETOS EN NUESTRA PROPIEDAD
SELECT * FROM cat;


/*
Restricciones (Impiden insertar o modificar registros):
PRIMARY KEY
UNIQUE
FOREIGN KEY
CHECK
*/

-- DEFAULT
SELECT * FROM prueba;
-- AÑADIMOS UNA NUEVA COLUMNA LLAMADA TEST
ALTER TABLE prueba ADD (test INT);
-- AÑADIMOS UNA NUEVA COLUMNA QUE CONTENDRA VALORES POR DEFECTO, EN ESTE CASO VALOR QUE APARECERA ES -1
ALTER TABLE prueba ADD (defecto INT DEFAULT -1);
-- AGREGAMOS UNA FILA DE DATOS MAS
INSERT INTO prueba (identificador, texto10, textochar) VALUES (2, 'aa', 'aa');
-- AGREGAMOS UNA FILA MAS DE DATOS INCLUYENDO UN DATO EN DONDE ESTA EL VALOR POR DEFECTO
INSERT INTO prueba (identificador, texto10, textochar, defecto) VALUES (3, 'BB', 'BB', 22);
-- AGREGAMOS UNA FILA MAS DE DATOS INCLUYENDO UN DATO EN DONDE ESTA EL VALOR POR DEFECTO PONIENDOLE NULL
INSERT INTO prueba (identificador, texto10, textochar, defecto) VALUES (4, 'CC', 'CC', null);


-- VER TODAS LAS RESTRICCIONES QUE HAY EN UNA TABLA 
SELECT * FROM all_constraints WHERE table_name = 'prueba';

DROP TABLE prueba;

----------------------------------------

-- PRIMARY KEY

-- TABLA EMPLEADOS (DEPT)
SELECT * FROM dept;
-- INCLUIMOS UNA RESTRICCION PRIMARY KEY EN EL CAMPO DEPT_NO DE DEPARTAMENTOS PARA QUE NO PUEDA ADMITIR NULOS
ALTER TABLE dept ADD CONSTRAINT pk_dept PRIMARY KEY (dept_no);
DESCRIBE dept;
-- AUTOMATICAMENTE TODAS LAS RESTRICCIONES DEL USUARIO SE ENCUENTRAN EN EL DICCIONARIO LLAMADO USER_CONSTRAINTS
SELECT * FROM user_constraints WHERE table_name = 'DEPT';
-- INTENTAMOS INSERTAR UN DEPARTAMENTO REPETIDO
INSERT INTO dept VALUES (10, 'repe', 'repe'); -- DA ERROR YA QUE EL VALOR 10 PERTENECE A LA RIMARY KEY Y NO ACEPTA VALORES REPETIDOS
-- ELIMINAMOS LA RESTRICCIO DE PRIMARY KEY DE DEPARTAMENTOS
ALTER TABLE dept DROP CONSTRAINTS pk_dept;
DESCRIBE dept;
-- INTENTAMOS INSERTAR UN DEPARTAMENTO REPETIDO AHORA QUE NO TENEMOS RESTRICCIONES
INSERT INTO dept VALUES (10, 'repe', 'repe');
SELECT * FROM dept;
-- BORRAMOS LOS DOS DEPARTAMENTOS 10 QUE TENEMOS EN LA TABLA Y GUARDAMOS
DELETE FROM dept WHERE dept_no = 10;
COMMIT;


-- TABLA EMPLEADOS (EMP)
SELECT * FROM emp ORDER BY emp_no;
DESCRIBE emp;
-- CREAMOS EN EMPLEADOS UNA PRIMARY KEY PARA EL CAMPO EMP_NO
ALTER TABLE emp ADD CONSTRAINT pk_emp PRIMARY KEY (emp_no);
-- CREAMOS UNA RESTRICCION PARA COMPROBAR QUE EL SALARIO SIEMPRE SEA POSITIVO
-- ES UNA RESTRICCON CHECK (CH_TABLA_CAMPO)
ALTER TABLE emp ADD CONSTRAINT ch_dept_salario CHECK (salario >= 0);
-- AÑADIMOS UNA FILA CON SALARIO NEGATIVO
UPDATE emp SET salario = -1 WHERE emp_no = 7839; -- DA ERROR YA QUE LE HEMOS PUESTO LA RESRICCION CHECK QUE NO PUEDE HABER SALDO MENOR A 0
ROLLBACK;
-- ELIMINAMOS LA RESTRICCION CHECK
ALTER TABLE emp DROP CONSTRAINT ch_dept_salario;
-- PROBAMOS A INCLUIR AHORA UN SALDO NEGATIVO
UPDATE emp SET salario = -1 WHERE emp_no = 7839; -- AHORA SI DEJA AL NO HABER RESTICCION EN LA COLUMNA SALARIO
-- CN DATOS NEGATIVOS EN LA TABLA NO NOS PERMITE PONER LA RESTRICCION
-- LE PONEMOS DE NUEVO UN VALOR POSITIVO PARA EJECUTAR LA RESTRICCION
UPDATE emp SET salario = 1000000 WHERE emp_no = 7839;


-- TABLA ENFERMO (ENFERMO)
SELECT * FROM enfermo;
DESCRIBE enfermo;
-- CREAMOS LA PRIMARY KEY DE LA TABLA, EN ESTE CASO SERA LA COLUMNA INSCRIPCION
ALTER TABLE enfermo ADD CONSTRAINT pk_enfermo PRIMARY KEY (inscripcion);
-- CREAMOS LA RESTRICCION UNIQUE PARA LA COLUMNA NSS
ALTER TABLE enfermo ADD CONSTRAINT u_enfermo_nss UNIQUE (nss);
-- INSERTAMOS UN ENFERMO PARA PROBAR, CON LAS RESTRICCIONES ACTIVAS NO PODEMOS PONER EL MISMO NUMERO DE INSCRIPCION NI EL MISMO EN NSS
INSERT INTO enfermo VALUES (10999, 'nuevo', 'calle nueva', '01/01/2000', 'F', '123');
-- NULOS EN PK? NUNCA
-- NULOS EN UNIQUE? POR SUPUESTO SI LA COLUMNA LO ADMITE

INSERT INTO enfermo VALUES (11995, 'Languia M.', 'Goya 20', '16/05/1956', 'M', '280862482');

ROLLBACK;

-- QUITAMOS LOS NULL PARA REALIZAR LA INSCRIPCION
DELETE FROM enfermo WHERE nss IS null;
SELECT * FROM enfermo;
COMMIT;
-- ELIMINAMOS LAS DOS RESTRICCIONES ANTERIORES
ALTER TABLE enfermo DROP CONSTRAINT pk_enfermo;
ALTER TABLE enfermo DROP CONSTRAINT u_enfermo_nss;
-- CREAMOS UNA PRIMARY KEY DE DOS COLUMNAS O MAS, EN ESTE CASO DE DOS
ALTER TABLE enfermo ADD CONSTRAINT pk_enfermo PRIMARY KEY (inscripcion, nss);
-- INTENTAMOS CREAR UN REGISTRO CON DOS DATOS IGUALES DE INSCRIPCION Y NSS 
INSERT INTO enfermo VALUES (10995, 'Languia M.', 'Goya 20', '16/05/1956', 'M', '280862482'); -- DA ERROR PORQUE LOS DOS PRIMARY KEY SON IGUALES A LOS QUE ESTABAN EN LA TABLA
-- INTENTAMOS CREAR UN REGISTRO CON UN DATO IGUALES NSS Y DIFERENTE DE INSCRIPCION 
INSERT INTO enfermo VALUES (11995, 'Languia M.', 'Goya 20', '16/05/1956', 'M', '280862482'); -- SI DEJA PORQUE EL DATO DE UNA DE LAS PRIMARY KEY ES DIFERENTE


-- FOREIGN KEY

-- HACER UNA CLAVE FOREIGN KEY ENTRE LAS TABLAS EMP Y DEPT
-- CAMPO DE RELACCION 'DEPT_NO'
ALTER TABLE emp ADD CONSTRAINT fk_emp_dept FOREIGN KEY (dept_no) REFERENCES dept (dept_no);
-- INSERTAR UN EMPLEADO EN UN DEPARTAMENTO QUE NO EXISTE
INSERT INTO emp VALUES (1111, 'lili', 'EMPLEADO', 7902, '02/10/2000' 1, 1, 50); -- NO DEJA AL NO EXISTIR EL DEPT_NO 50
SELECT * FROM emp;

-- VAMOS A PROBAR A ELIMINAR EN CASCADA Y SET NULL EN CASCADA
DELETE FROM dept WHERE dept_no = 10;
ALTER TABLE emp DROP CONSTRAINT fk_emp_dept;
SELECT * FROM emp;
ALTER TABLE emp ADD CONSTRAINT fk_emp_dept FOREIGN KEY (dept_no) REFERENCES dept (dept_no) ON DELETE CASCADE;
ROLLBACK;
-- NUNCA USAR DELETE CASCADE
ALTER TABLE emp ADD CONSTRAINT fk_emp_dept FOREIGN KEY (dept_no) REFERENCES dept (dept_no) ON DELETE SET NULL;
-- SET NULL ES VALIDO, PONDRIA EN NULL LOS CAMPOS ELIMINADOS

-- CAMPOS DE AUTOINCREMENTACION

-- CREAMOS UNA SECUENCIA 
SELECT * FROM dept;
CREATE SEQUENCE seq_dept INCREMENT BY 10 START WITH 40;
-- UNA SECUENCIA NO SE PUEDE MODIFICAR, SE PUEDE BORRAR Y CREAR DE NUEVO
SELECT seq_dept.NEXTVAL AS siguiente FROM dual;
-- NO PODEMOS ACCEDER A CURRVAL HASTA QUE NO HEMOS EJECUTADO NEXTVAL
SELECT seq_dept.CURRVAL AS actual FROM dual;
-- SI LO QUEREMOS PARA INSERT DEBEMOS LLAMARLO DE FORMA EXPLICITA
INSERT INTO dept VALUES (seq_dept.nextval, 'NUEVO', 'NUEVO');
-- UNA SECUENCIA NO VA ASOCIADA A NINGUNA TABLA, SE PUEDE USAR PARA OTRAS TABLAS
INSERT INTO hospital VALUES (seq_dept.nextval, 'el carmen', 'calle pez', '12345', 125);
SELECT * FROM hospital;


--------------------- PRACTICA ------------------

-- NECESITO LAS SIGUIENTES CARACTERISTICAS DENTRO DE NUESTRA BASE DE DATOS HOSPITAL
-- 1) PK EN HOSPIAL
-- 2) PK EN DOCTOR
-- 3) NECESITO RELACIONAR DOCTORES CON HOSPITAL
-- 4) LAS PERSONAS DE LA PLANTILLA SOLAMENTE PUEDEN TRABAJAR EN TURNOS DE MAÑANA, TARDE O NOCHE

-- 1)
SELECT * FROM hospital;
ALTER TABLE hospital ADD CONSTRAINT pk_hospital PRIMARY KEY (hospital_cod);

-- 2)
SELECT * FROM doctor;
ALTER TABLE doctor ADD CONSTRAINT pk_doctor PRIMARY KEY (doctor_no);

-- 3)
ALTER TABLE doctor ADD CONSTRAINT fk_doctor_hospital FOREIGN KEY (hospital_cod) REFERENCES hospital (hospital_cod);

-- 4)
SELECT * FROM plantilla;
ALTER TABLE plantilla ADD CONSTRAINT ch_plantilla_turno CHECK (TURNO = 'T' OR TURNO = 'M' OR TURNO ='N');




---------------------------------------------------------------------------------------------------

---------------------------- PRACTICA DE CREACCION DE TABLAS --------------------------------------

-- 1)Crear la tabla COLEGIOS 

CREATE TABLE COLEGIOS ( COD_COLEGIO NUMBER, NOMBRE VARCHAR (20), LOCALIDAD VARCHAR (15), PROVINCIA VARCHAR (15), AÑO_CONSTRUCCION DATE, COSTE_CONSTRUCCION NUMBER, COD_REGION NUMBER, UNICO NUMBER);
SELECT * FROM COLEGIOS;
ALTER TABLE COLEGIOS ADD CONSTRAINT pk_colegios PRIMARY KEY (COD_COLEGIO);
CREATE SEQUENCE seq_colegios INCREMENT BY 1 START WITH 1;
ALTER TABLE COLEGIOS MODIFY NOMBRE NOT NULL;
DESCRIBE COLEGIOS;
ALTER TABLE COLEGIOS ADD CONSTRAINT u_colegios_unico UNIQUE (UNICO);

-- 2)Crear la tabla PROFESORES 
CREATE TABLE PROFESORES (COD_PROFE VARCHAR (20), NOMBRE VARCHAR (20), APELLIDO1 VARCHAR (20), APELLIDO2 VARCHAR (20), DNI VARCHAR (9), EDAD NUMBER, LOCALIDAD VARCHAR (20), PROVINCIA VARCHAR (20), SALARIO NUMBER, COD_COLEGIO NUMBER);
SELECT * FROM PROFESORES;
ALTER TABLE PROFESORES ADD CONSTRAINT pk_profesores PRIMARY KEY (COD_PROFE);
ALTER TABLE PROFESORES MODIFY COD_PROFE NOT NULL;
DESCRIBE PROFESORES;
ALTER TABLE PROFESORES MODIFY NOMBRE NOT NULL;
ALTER TABLE PROFESORES ADD CONSTRAINT DNI UNIQUE (DNI);
ALTER TABLE PROFESORES MODIFY DNI CHAR (9);
ALTER TABLE PROFESORES ADD CONSTRAINT fk_profesores_colegios FOREIGN KEY (COD_COLEGIO) REFERENCES COLEGIOS (COD_COLEGIO);

-- 3)Crear la tabla REGIONES 
CREATE TABLE REGIONES (COD_REGION NUMBER, REGIONES VARCHAR (20));
SELECT * FROM REGIONES;
ALTER TABLE REGIONES ADD CONSTRAINT pk_regiones PRIMARY KEY (COD_REGION);
CREATE SEQUENCE seq_regiones INCREMENT BY 1 START WITH 1;
ALTER TABLE REGIONES MODIFY REGIONES NOT NULL;

-- 4)Crear la tabla ALUMNOS 
CREATE TABLE ALUMNOS (DNI CHAR (9), NOMBRE VARCHAR (20), APELLIDOS VARCHAR (20), FECHA_INGRESO DATE, FECHA_NAC DATE, LOCALIDAD VARCHAR (15), PROVINCIA VARCHAR (30), COD_COLEGIO NUMBER);
SELECT * FROM ALUMNOS;
ALTER TABLE ALUMNOS ADD CONSTRAINT pk_dni PRIMARY KEY (DNI);
ALTER TABLE ALUMNOS MODIFY DNI NOT NULL;
ALTER TABLE ALUMNOS MODIFY NOMBRE NOT NULL;
ALTER TABLE ALUMNOS ADD CONSTRAINT fk_alumnos_colegios FOREIGN KEY (COD_COLEGIO) REFERENCES COLEGIOS (COD_COLEGIO);

-- 5)Crear una nueva relación entre el campo Cod_Region de la tabla REGIONES y Cod_Region de la tabla colegios. 
ALTER TABLE COLEGIOS ADD CONSTRAINT fk_colegios_regiones FOREIGN KEY (COD_REGION) REFERENCES REGIONES (COD_REGION);

-- 6)Añadir el campo Sexo, Fecha de nacimiento y Estado Civil a la tabla Profesores. 
SELECT * FROM PROFESORES;
ALTER TABLE PROFESORES ADD (SEXO VARCHAR (20), FECHA_NAC DATE, ESTADO_CIVIL VARCHAR (20));

-- 7)Eliminar el campo Edad de la tabla Profesores. 
SELECT * FROM PROFESORES;
ALTER TABLE PROFESORES DROP COLUMN EDAD;

-- 8)Añadir el campo Sexo, Dirección y Estado Civil a la tabla Alumnos. 
SELECT * FROM ALUMNOS;
ALTER TABLE ALUMNOS ADD (SEXO VARCHAR (20), DIRECCION VARCHAR (20), ESTADO_CIVIL VARCHAR (20));

-- 9)Borrar la relación existente entre la tabla profesores y Colegios. 
ALTER TABLE PROFESORES DROP CONSTRAINT fk_profesores_colegios;

-- 10)Crear de nuevo la relación borrada en el ejercicio anterior que tenga eliminación en cascada. 
ALTER TABLE PROFESORES ADD CONSTRAINT fk_profesores_colegios FOREIGN KEY (COD_COLEGIO) REFERENCES COLEGIOS (COD_COLEGIO) ON DELETE CASCADE;

-- 11)Agregar un valor por defecto con la fecha actual al campo Fecha_Ingreso de la tabla alumnos. 
ALTER TABLE ALUMNOS MODIFY FECHA_INGRESO DATE DEFAULT '03/04/2025';

-- 12)Queremos rellenar los datos de las tablas creadas, para ello vamos a introducir a tres alumnos en los colegios. Los datos son los siguientes: 
SELECT * FROM ALUMNOS;
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDOS, LOCALIDAD, PROVINCIA) VALUES ('0000000A', 'ANA', 'ORTIZ ORTEGA', 'MADRID', 'MADRID');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDOS, LOCALIDAD, PROVINCIA) VALUES ('0000000B', 'JAVIER', 'CHUKO PALOMO', 'ARENAS DEL SOL', 'ALICANTE');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDOS, LOCALIDAD, PROVINCIA) VALUES ('0000000C', 'MIGUEL', 'TORRES TORNO', 'LLOBREGAT', 'BARCELONA');

SELECT * FROM REGIONES;
INSERT INTO REGIONES VALUES (seq_regiones.nextval, 'MADRID');
INSERT INTO REGIONES VALUES (seq_regiones.nextval, 'VALENCIA');
INSERT INTO REGIONES VALUES (seq_regiones.nextval, 'CATALUÑA');

SELECT * FROM COLEGIOS;
INSERT INTO COLEGIOS VALUES (seq_colegios.nextval, 'COLEGIO1', 'MADRID', 'MADRID', '01/01/1990', 1000000, 1, '1'); 
INSERT INTO COLEGIOS VALUES (seq_colegios.nextval, 'COLEGIO2', 'ARENAS DEL SOL', 'VALENCIA', '01/01/1991', 2000000, 2, '2');
INSERT INTO COLEGIOS VALUES (seq_colegios.nextval, 'COLEGIO1', 'LLOBREGAT', 'CATALUÑA', '01/01/1992', 3000000, 3, '3');

SELECT * FROM PROFESORES;
INSERT INTO PROFESORES (COD_PROFE, NOMBRE, DNI, LOCALIDAD, PROVINCIA, SALARIO, COD_COLEGIO) VALUES ('1', 'JUAN','00000000D', 'MADRID', 'MADRID', '1000', 1);
INSERT INTO PROFESORES (COD_PROFE, NOMBRE, DNI, LOCALIDAD, PROVINCIA, SALARIO, COD_COLEGIO) VALUES ('2', 'ALBERTO' , '00000000E' , 'ARENAS DEL SOL', 'VALENCIA', '2000', 3);
INSERT INTO PROFESORES (COD_PROFE, NOMBRE, DNI, LOCALIDAD, PROVINCIA, SALARIO, COD_COLEGIO) VALUES ('3', 'ANA','00000000F', 'LLOBREGAT', 'CATALUÑA' , '23000', 4);

DELETE FORM REGIONES;


-----------------------------------------------------------------------------------------------
-------------- DICCIONARIO DE DATOS -------------------------------


/* EL DICCIONARIO DE DATOS ESTA COMPUESTO DE 3 PREFIJOS
USER_  -LOS OBJETOS DEL ESQUEMA (= USUARIO)
ALL_   -LOS OBJETOS DEL ESQUEMA/USUARIO Y DE OTROS ESQUEMAS EN LOS QUE EL USUARIO TIENE ALGUN PRIVILEGIO
DBA_   -TODOS LOS OBJETOS DE LA INSTANCIA (SOLO VISIBLE POR LOS DBAs)
*/

SELECT * FROM user_tables;
SELECT * FROM all_tables;
SELECT * FROM dba_tables;

/*   -- MULTITENANT
CDB_   -TODOS LOS OBJETOS DE TODOS LOS CONTENEDORES SI LA SESION ESTA EN EL CONTENEDOR: cdb$root
       -TODOS LOS OBJETOS DEL CONTENEDOR EN EL QUE SE ENCUENTRA LA SESION, SI ES UN PDB (PLUGGABLE DATABASE)
DBA_   -TODOS LOS OBJETOS DEL CONTENEDOR EN EL QUE SE ENCUENTRA LA SESION

CONTENEDOR 1 > cdb$root
CONTENEDOR 2 > pdb$root
CONTENEDOR 3 > PDBs
*/

SHOW CON_ID;
SHOW pdbs; 

SELECT * FROM dictionary;
SELECT * FROM dict;

--EJEMPLO PARA BUSCAR EN DICCIONARIO
SELECT * FROM dict WHERE table_name LIKE '%IND%';

/* TABLAS PRNCIPALES PARA CONSULTA/DESARROLLO
*_OBJECTS        -TODOS LOS OBJETOS 
*_TABLES         -LAS TABLAS
*_TAB_COLUMNS    -COLUMNAS DE LAS TABLAS
*_CONSTRAINTS    -RESTRICCIONES
*_CONS_COLUMNS   -RESTRICCIONES POR COLUMNA
*_VIEWS          -VISTAS
*_INDEXES        -INDICES
*_IND_COLUMNS    -COLUMNAS DE LOS INDICES
*_SYNONYMS       -SINONIMOS
*_SEQUENCES      -SECUENCIAS
*_TAB_COMMENTS   -COMENTARIOS DE TABLAS
*_COL_COMMENTS   -COMENTARIOS DE COLUMNAS
*/

SELECT * FROM dict;
SELECT * FROM user_objects;
SELECT * FROM user_tables;
SELECT * FROM user_tab_columns;
-- ES COMO UN DESCRIBE PERO MEJOR
SELECT * FROM user_tab_columns WHERE table_name = 'PROFESORES';

SELECT * FROM user_constraints;
SELECT * FROM user_constraints WHERE table_name = 'PROFESORES';
SELECT * FROM user_cons_columns;
SELECT * FROM user_cons_columns WHERE table_name = 'PROFESORES';

SELECT * FROM user_views;

-- V$
-- SON VISTAS QUE DAN INFORMACION DEL RENDIMIENTO 

SELECT * FROM v$session;
SELECT * FROM v$instance;
SELECT * FROM v$database;

-- COMENTARIOS

create table t1 (c1 number(3));
comment on table t1 is 'Es una tabla de prueba';
comment on column t1.c1 is 'Es la columna c1 de la tabla de prueba';

select * from user_tab_comments where table_name='T1';
select * from user_col_comments where table_name='T1';

-- EJERCICIOS
-- 1) Consulta la vista del diccionario de datos USER_TABLES para ver información sobre las tablas que posees.
SELECT table_name FROM user_tables;

-- 2) Consulta la vista del diccionario de datos ALL_TABLES para ver información sobre todas las tablas a las que puedes acceder. Excluye las tablas que te pertenecen.
SELECT table_name, owner FROM all_tables WHERE owner <> 'SYSTEM';

-- 3) Para una tabla específica, cree un script que informe los nombres de las columnas, los tipos de datos y su longitud, e indique si se permiten valores nulos. Solicite al usuario que introduzca el nombre de la tabla. Asigne los alias adecuados a las columnas DATA_PRECISION y DATA_SCALE. Guarde este script en un archivo llamado lab_12_03.sql. Por ejemplo, si el usuario ingresa DEPARTAMENTOS, se obtiene el siguiente resultado
SELECT * FROM user_tab_columns;
SELECT COLUMN_NAME, DATA_TYPE, DATA_LENGTH, DATA_PRECISION PRECISION, DATA_SCALE ESCALA, NULLABLE FROM user_tab_columns WHERE table_name = UPPER ('&tab_name');

-- 4) Cree un script que informe el nombre de la columna, el nombre de la restricción, el tipo de restricción, la condición de búsqueda y el estado de una tabla específica. Debe unir las tablas USER_CONSTRAINTS y ​​USER_CONS_COLUMNS para obtener toda esta información. Solicite al usuario que introduzca el nombre de la tabla. Guarde el script en un archivo llamado lab_12_04.sql.
SELECT * FROM user_constraints;
SELECT * FROM user_cons_columns;
SELECT ucc.column_name, uc.constraint_name, uc.constraint_type, uc.search_condition, uc.status FROM user_constraints uc JOIN user_cons_columns ucc ON uc.table_name = ucc.table_name AND uc.constraint_name = ucc.constraint_name AND uc.table_name = UPPER ('&tab_name'); 

-- 5) Agregue un comentario a la tabla DEPARTAMENTOS. Luego, consulte la vista USER_TAB_COMMENTS para verificar que el comentario esté presente.
COMMENT ON TABLE dept IS 'HOLA DEPARTAMENTOS';
SELECT * FROM user_tab_comments WHERE table_name = 'DEPT';

-- 6) Ejecute el script lab_12_06_tab.sql como requisito previo para los ejercicios 6 a 9. Alternativamente, abra el archivo del script para copiar el código y pegarlo en su hoja de cálculo SQL. Luego, ejecute el script. Este script:
-- Borra las tablas DEPT2 y EMP2
-- Crea las tablas DEPT2 y EMP2


------------------------------ SCRIPT lab_12_06_tab.sql -----------------------------------------------
--drops tables so that they cannot be restored
DROP TABLE EMP2 PURGE;
DROP TABLE dept2 PURGE;
--creates tables and adds constraints
CREATE TABLE dept2
       (id NUMBER(7),
        name VARCHAR2(25));
INSERT INTO dept2
      SELECT  department_id, department_name
      FROM    departments;
CREATE TABLE  emp2
  (id           NUMBER(7),
   last_name     VARCHAR2(25),
   first_name    VARCHAR2(25),
   dept_id       NUMBER(7));
ALTER TABLE emp2
      MODIFY (last_name   VARCHAR2(50));
ALTER TABLE    emp2
      ADD CONSTRAINT my_emp_id_pk PRIMARY KEY (id);
ALTER TABLE    dept2
     ADD CONSTRAINT my_dept_id_pk PRIMARY KEY(id);
ALTER TABLE emp2
      ADD CONSTRAINT my_emp_dept_id_fk
      FOREIGN KEY (dept_id) REFERENCES dept2(id);
--------------------------------------------------------------------------------------------------------

-- 7) Confirme que las tablas DEPT2 y EMP2 estén almacenadas en el diccionario de datos
SELECT * FROM user_tables WHERE table_name = 'EMP2';
SELECT * FROM user_tables WHERE table_name = 'DEPT2';
SELECT table_name FROM user_tables WHERE table_name IN ('DEPT2', 'EMP2');

-- 8) Confirme que se agregaron las restricciones consultando la vista USER_CONSTRAINTS. Observe los tipos y nombres de las restricciones.
SELECT constraint_name, constraint_type FROM user_constraints WHERE table_name IN ('DEPT2', 'EMP2');

-- 9) Muestra los nombres y tipos de objetos de la vista del diccionario de datos USER_OBJECTS para las tablas EMP2 y DEPT2
SELECT * FROM user_objects;
SELECT object_name, object_type FROM user_objects WHERE object_name IN ('DEPT2', 'EMP2');
SELECT object_name, object_type FROM user_objects WHERE object_name = 'DEPT2' OR object_name = 'EMP2';


-- ESQUEMAS/USUARIOS
-- COMO SYSDBA
SELECT * FROM dba_users;

-- SECUENCIAS -- SINONIMOS -- INDICES

-- SECUENCIAS
-- YA LO HEMOS DADO MAS ARRIBA, LINEA 980

-- SINONIMOS 
CREATE SYNONYM DEPTA FOR DEPT;
SELECT * FROM DEPTA;

SELECT * FROM user_synonyms; -- LOS SINONIMOS SE PUEDEN USAR TAMBIEN PARA VISTAS, ETC.
SELECT * FROM all_synonyms;
SELECT * FROM all_synonyms WHERE synonym_name LIKE '%DUAL';

DROP SYNONYM DEPTA;

-- INDICES
SELECT * FROM user_indexes;
SELECT * FROM user_ind_columns;

-- ROWID
/* 
TABLESPACE
DATAFILES
SEGMENTS
EXTENTS
BLOCK
*/
SELECT ROWID, employee_id, firsT_name FROM EMPLOYEES;
-- ROWID NO EXISTE EN LA TABLA. SE GENERA EN TIEMPO DE CONSULTA
--ROWID: PRIMEROS 15 CARACTERES --> DATA FILE Y NUMERO DE BLOQUES


------------------------------------SQL ORACLE-----------------------------------------------------
----- FUNCIONES EN ORACLE

SELECT * FROM emp WHERE LOWER (oficio) = 'analista';
-- ESTAMOS PONIENDO VALORES ESTATICOS: 'analista'
-- TAMBIEN PODRIAMOS INCLUIR VALORES DINAMICOS, POR LO QUE TENDRIAMOS QUE CONVERTIR LAS DOS COMPARACIONES
SELECT * FROM emp WHERE UPPER (oficio) = UPPER ('&dato');

SELECT * FROM emp WHERE UPPER (oficio) = 'ANALISTA';

SELECT * FROM emp WHERE INITCAP (oficio) = 'Analista';

-- EN ORACLE TENEMOS LA POSIBILIDAD DE CONCATENAS TEXTOS EN UNA SOLA COLUMNA (UN CAMPO CALCULADO)
-- SE UTILIZA EL SIMBOLO || PARA CONCATENAR/UNIR TEXTOS
-- QUEREMOS MOSTRAR EN UNA SOLA COLUMNA EL APELLIDO Y EL OFICIO DE LOS EMPLEADOS
SELECT apellido || oficio FROM emp;
SELECT apellido || oficio AS descripcion FROM emp;
SELECT apellido || ' ' || oficio AS descripcion FROM emp;
-- LA FUNCION INICAP MUESTRA CADA ALABRA DE UNA FRASE CON LA PRIMERA LETRA EN MAYUSCULAS
SELECT INITCAP (oficio) AS initc FROM emp;
SELECT INITCAP (apellido || ' ' || oficio) AS descripcion FROM emp;

-- CONCATENAR
SELECT CONCAT ('Nuestro empleado es ',apellido) AS concatenado FROM emp;

-- SUBSTR
SELECT SUBSTR ('florero',1,3) AS dato FROM dual;
SELECT SUBSTR (oficio,1,3) AS dato FROM emp;
-- ME GUSTA ROMPER LAS COSAS
SELECT SUBSTR ('florero',2,40) AS dato FROM dual;
-- MOSTRAR LOS EMPLEADOS CUYO APELLIDO EMPIEZA POR s
SELECT * FROM emp WHERE apellido LIKE 's%';
SELECT SUBSTR (apellido, 1, 1) AS una_letra FROM emp;
SELECT * FROM emp WHERE SUBSTR (apellido, 1, 1) = 's'; -- FORMA CORRECTA 

-- LENGTH
SELECT LENGTH ('libro') AS longitud FROM dual;
-- DEVUELVE LA CANTIDAD DE CARACTERES
-- MSOTRAR LOS EMPLEADOS CUYO APELLIDO SEA DE 4 LETRAS
SELECT * FROM emp WHERE apellido LIKE '____';
SELECT * FROM emp WHERE LENGTH (apellido) = 4; -- FORMA CORRECTA 

-- INSTR
-- BUSCA UN TEXTO Y DEVUELVE SU POSICION, DIFERENCIA MAYUS Y MINUS
SELECT INSTR ('BENITO', 'N') AS posicion_letra FROM dual;
SELECT INSTR ('BENITO', 'I') AS posicion_letra FROM dual;
SELECT INSTR ('BENITO', 'P') AS posicion_letra FROM dual;
SELECT INSTR ('ORACLE MOLA', 'L') AS posicion_letra FROM dual;
-- SI DESEAMOS VALIDAR UN EMAIL
SELECT * FROM dual WHERE INSTR ('m@ail', '@') >0;

--LPAD y RPAD
SELECT LPAD (dept_no, 5, '$') FROM emp;
SELECT RPAD (dept_no, 5, '$') FROM emp;

------------------------------ FUNCIONES NUMERICAS ------------------------------------------
-- ROUND
SELECT ROUND (45.923) AS redondeo FROM dual;
SELECT ROUND (45.423) AS redondeo FROM dual;
SELECT ROUND (45.5) AS redondeo FROM dual;
SELECT ROUND (45.923,1) AS redondeo FROM dual;

-- TRUNC
SELECT TRUNC (45.923) AS trunca FROM dual;
SELECT TRUNC (45.423) AS trunca FROM dual;
SELECT TRUNC (45.5) AS trunca FROM dual;
SELECT TRUNC (45.923,1) AS trunca FROM dual;

-- MOD
-- AVERIGUAR SI NUMERO ES PAR
SELECT MOD (99, 2) AS resto FROM dual;
-- SI EL RESULTADO ES 0 ES QUE ES PAR, AL SER DIVISIBLE ENTRE 2, SI EL RESULTADO ES DIFERENTE A 0 ENTONCES NO ES PAR
-- MOSTRAR LOS EMPLEADOS CUYO SALARIO SEA PAR
select * from emp;
SELECT MOD (salario, 2) AS resto FROM emp;
SELECT * FROM emp WHERE MOD (salario, 2) = 0;


------------------------- FUNCIONES DE FECHAS -----------------------------------
-- TENEMOS UNA FUNCION PARA AVERIGUAR LA FECHA DE HOY Y SEGUN DONDE SE ALOJE EL SERVIDOR
-- SYSDATE
SELECT SYSDATE AS fecha_actual FROM dual;
SELECT SYSDATE + 10 AS fecha FROM dual;
SELECT SYSDATE + 30 AS fecha FROM dual;
SELECT SYSDATE - 10 AS fecha FROM dual;

-- MONTHS BETWEEN
-- DEVUELVE LA CANTIDAD DE MESES QUE HAY ENTRE UNA FECHA Y OTRA, LA FECHA UNO TIENE QUE SER MAYOR
-- MOSTRAR CUANTOS MESES LLEVAN LOS EMPLEADOS DADOS DE ALTA EN LA EMPRESA
SELECT apellido, MONTHS_BETWEEN (SYSDATE, fecha_alt) AS meses FROM emp;

-- ADD MONTHS
-- AGREGA X MESES QUE LE DIGAMOS A LA FECHA
-- AGREGAMOS A LA FECHA ACTUAL 5 MESES
SELECT ADD_MONTHS (SYSDATE, 5) AS dentro5 FROM dual;

-- NEXT DAY
-- DEVUELVE LA FECHA DEL DIA SIGUIENTE A LA FECHA
-- MOSTRAR CUANDO ES EL PROXIMO LUNES
SELECT NEXT_DAY (SYSDATE, 'LUNES') AS proximo_lunes FROM dual;
SELECT NEXT_DAY (SYSDATE, 1) AS proximo_lunes FROM dual;
SELECT NEXT_DAY (SYSDATE, 'lunes') AS proximo_lunes FROM dual;

-- LAST DAY
-- DEVUELVE EL ULTIMO DIA DE UN MES
SELECT LAST_DAY (SYSDATE) AS finmes FROM dual;

-- ROUND
-- REDONDEA
-- EMPLEADOS REDONDEADOS LA FECHA AL MES
SELECT apellido, fecha_alt, ROUND (fecha_alt, 'MM') AS roundmes FROM emp;
SELECT apellido, fecha_alt, ROUND (fecha_alt, 'YY') AS roundmes FROM emp;
SELECT apellido, fecha_alt, ROUND (fecha_alt, 'DD') AS roundmes FROM emp;

-- TRUNC 
-- REDONDEA A LA BAJA
SELECT apellido, fecha_alt, TRUNC (fecha_alt, 'MM') AS truncmes FROM emp;
SELECT apellido, fecha_alt, TRUNC (fecha_alt, 'YY') AS truncmes FROM emp;


---------------------------------- FUNCIONES DE CONVERSION ----------------------------------------------

-- TO CHAR
-- DAR FORMATO A LOS CARACTERES, NUMERO A FECHAS
SELECT apellido, fecha_alt, TO_CHAR (fecha_alt, 'dd/mm/yyyy') AS fecha_formato FROM emp;
SELECT apellido, fecha_alt, TO_CHAR (fecha_alt, 'dd-mm-yyyy') AS fecha_formato FROM emp;
SELECT apellido, fecha_alt, TO_CHAR (fecha_alt, 'mm/dd/yyyy') AS fecha_formato FROM emp;
SELECT apellido, fecha_alt, TO_CHAR (fecha_alt, 'ddd') AS dia_del_año FROM emp;

SELECT TO_CHAR (SYSDATE, 'MONTH') AS nombremes FROM dual;
SELECT TO_CHAR (SYSDATE, 'DAY MONTH YEAR') AS nombremes FROM dual;
SELECT TO_CHAR (SYSDATE, 'RM') AS nombremes FROM dual;

-- FORMATO A NUMEROS
SELECT TO_CHAR (7458, '0000L') AS zero FROM dual;
SELECT TO_CHAR (7458, '0000$') AS zero FROM dual;

-- OBENER LA HORA DEL SISTEMA
SELECT TO_CHAR (SYSDATE, 'HH24:MI:SS') AS hora FROM dual;

-- SI DESEAMOS INCLUIR TEXTO ENTRE TO_CHAR Y LOS FORMATOS SE REALIZA CON COMILLAS DOBLES DENTRO DE LAS SIMPLES
SELECT TO_CHAR (SYSDATE, '"Hoy es" DD "de" month') AS formato FROM dual;
-- PONERLO EN FRANCES
SELECT TO_CHAR (SYSDATE, '"Hoy es" DD "de" month "de" YEAR', 'NLS_DATE_LANGUAGE = FRENCH') AS formato FROM dual;


------------------------------------ FUNCIONES DE CONVERSION -------------------------------------------
-- TO_DATE
SELECT '08/04/2025' AS fecha FROM dual;
SELECT TO_DATE ('08/04/2025') AS fecha FROM dual; -- CORRECTO
SELECT TO_DATE ('08/04/2025') +2 AS fecha FROM dual;
-- TO_NUMBER
SELECT '12' + 2 AS resultado FROM dual;
SELECT TO_NUMBER ('12') + 2 AS resultado FROM dual;


------------------------------------- FUNCIONES GENERALES --------------------------------------------
-- NVL
-- SIRVE PARA EVITAR LOS NULOS Y SUSTITUIRLOS, SI ENCUENTRA UN NULO LO SUSTITUYE, SI NO, MUESTRA EL VALOR
SELECT * FROM EMP;
-- MOSTRAR APELLIDO, SALARIO Y COMISION DE TODOS LOS EMPLEADOS
SELECT apellido, salario, comision FROM emp;
-- PODEMOS INDICAR QUE EN LUGAR DE PONER NULL, ESCRIBA OTRO VALOR, EL VALOR DEBE SER CORRESPONDIENTE AL TIPO DE DATO DE LA COLUMNA
SELECT apellido, salario, NVL (comision, -1) AS comision FROM emp;
-- MOSTRAR APELLIDO, SALARIO, COMISION, SALARIO + COMISION DE TODOS LOS EMPLEADOS
SELECT apellido, salario, comision, salario + NVL (comision, 0) AS "salario mensual" FROM emp;

-- DECODE
-- MOSTRAR EL TURNO EN PALABRA ('MAÑANA', 'TARDE' O 'NOCHE') DE LA PLANTILLA
SELECT apellido, turno FROM plantilla;
SELECT apellido, turno, DECODE (turno, 'M', 'mañana', 'T', 'tarde', 'N', 'noche') AS turno FROM plantilla;
-- EL DECODE FUNCIONA A PARES, SI ENCUENTRA UN IMPAR ES EL ELSE
SELECT apellido, turno, DECODE (turno, 'M', 'mañana', 'T', 'tarde','noche') AS turno FROM plantilla;
-- SI DEJAMOS UNO SIN PONER SALE NULL, SI LO PONEMOS IMPAR EL NULL COGE EL VALOR DEL IMPAR

------------------------------------- FUNCIONES ANIDADAS -------------------------------------------
-- QUIERO SABER LA FECHA DEL PROXIMO MIERCOLES QUE JUEGA EL MADRID
SELECT NEXT_DAY (SYSDATE, 'miércoles') AS champions FROM dual;
-- QUIERO VER LA FECHA COMPLETA, QUIERO VER: El miercoles 11 de abril juega el Madrid
SELECT to_char (NEXT_DAY (SYSDATE + 2, 'miércoles'),'"El dia" day DD "de" month"de" YYYY "juega el madrid"') AS champions FROM dual;




