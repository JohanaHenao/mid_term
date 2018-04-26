-- Cree un espacio de tabla llamado "mid_term" con un archivo de datos,
-- el archivo de datos debe tener su first_name y el tamaño del archivo de datos es de 20Mb.
CREATE TABLESPACE mid_term
    DATAFILE 'C:\oraclexe\app\oracle\oradata\XE\johana.dbf' SIZE 20M;

-- Cree un perfil llamado "exam" con 2 intentos fallidos de inicio de sesión y 5 minutos de tiempo de inactividad.
CREATE PROFILE exam LIMIT
    FAILED_LOGIN_ATTEMPTS 2       
    IDLE_TIME             5;
    
-- Cree un usuario llamado "ejercicios" con espacio ilimitado en el tablespace, asociado al perfil del examen
CREATE USER ejercicios
    IDENTIFIED BY exam
    DEFAULT TABLESPACE mid_term
    QUOTA UNLIMITED ON mid_term;
    
-- Con el usuario "ejercicios" crea las funciones propuestas a continuación:

-- 1. (2.0) Escribirá una función simple que toma 3 entradas a, b, c y retorna a concatenada con a * b concatenada con 
-- 'andres' si b> = c de lo contrario "martinez". Sepáralos con /. El nombre de la función debe ser function_1

--Por ejemplo:

-- function_1(1,2,3) --returns "1/2/martinez"
-- function_1(3,2,1) --returns "3/6/andres"

CREATE OR REPLACE FUNCTION function_1(a IN number, b IN number, c IN number)
RETURN VARCHAR2 AS Resul VARCHAR2(20);
            Mult number := a*b;
BEGIN 
    IF b >= c THEN 
        Resul := (a || '/' || Mult || '/andres');   
    ELSE
     Resul := (a || '/' || Mult || '/martinez' ); 
    END if;
    RETURN Resul;
END;
    
SELECT function_1(1,2,3) AS FUNC FROM DUAL;
SELECT function_1(3,2,1) AS FUNC FROM DUAL;

    
