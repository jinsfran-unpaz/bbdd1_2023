USE Empleados;
/* Realizar las consultas asignadas. En las consultas g, h e i incluir solamente las sentencias SQL, en el resto de las consultas, incluir las sentencias SQL y una captura del resultado obtenido.
Como parámetros para realizar los filtros en las consultas, cada uno tendrá asignado un id_emp, que se conformará utilizando su número de DNI tomando el primer dígito y los cuatro últimos. 
Por ejemplo, si mi número de DNI es 12.345.678, el id_emp asignado es 15678.
Del mismo modo, se asignará un id_dept, tomando el último dígito del DNI. Considerando el ejemplo anterior, el id_dept asignado sería d008. Como los id_dept van del 1 al 9, aquellos cuyo DNI termine en cero, deberán usar d009.
Las consultas deberán contener los parámetros asignados, pero deben ser realizadas de tal modo que si se modifica el id_emp o el id_dept, las mismas funcionen correctamente. Asimismo, deberían funcionar en caso de que se realicen cambios en los datos existentes en la base.
Con respecto a la información, hay que considerar que los datos presentan rangos de fechas. 
Los datos actuales son los que tienen como fecha_hasta el valor “9999-01-01”. 
Si un empleado no tiene como fecha mayor “9999-01-01” en fecha_hasta, eso implica que ya no forma parte de la compañía, 
y en fecha_hasta figura la fecha en que se desvinculó de la empresa.*/

--a)	Devolver los datos (id, fecha de nacimiento, nombre y apellido concatenados, género y fecha de alta) del empleado asignado si alguna vez trabajó en el departamento asignado.
--b)	Devolver los datos (id, fecha de nacimiento, nombre y apellido concatenados, género y fecha de alta) del empleado asignado si no trabaja actualmente en el departamento asignado.
--c)	Devolver los datos (id, nombre y apellido concatenados) del responsable actual del departamento asignado.
--d)	Devolver los datos del empleado asignado, incluyendo el nombre del departamento en el que trabaja actualmente (realizar la consulta considerando la posibilidad de que el empleado ya no trabaje en la compañía, y en ese caso se debería mostrar el último departamento al que estuvo asignado).
--e)	Agregar a la consulta anterior, el apellido del responsable del departamento.
--f)	Considerando el menor y el mayor sueldo, ¿qué porcentaje de aumento recibió el empleado asignado? El formato de la respuesta deberá contar con dos decimales y el símbolo de porcentaje, por ejemplo 20.50%
--g)	Obtener la lista de empleados (emp_id, fecha_nacimiento, nombre, apellido y género) que trabajan actualmente en el departamento asignado, cuyo sueldo actual es mayor a 120.000. El puesto que ocupa debe ser Ingeniero (el nombre del puesto debe contener “Engineer”) o tener categoría Senior (el nombre del puesto contiene “Senior”).
--h)	Agregar un nuevo departamento, con el código d010 y el nombre “Inteligencia Artificial”. 
--i)	Con vigencia desde el 01/01/2023, asigne los empleados obtenidos en la consulta g al nuevo departamento d010 y otórgueles un 15% de aumento de sueldo. Realice todos los comandos DML necesarios para que estos cambios queden reflejados correctamente en la base de datos.
--j)	Liste la cantidad de empleados de empleados y sueldo promedio de cada departamento, considerado solamente a los empleados que trabajan actualmente.
