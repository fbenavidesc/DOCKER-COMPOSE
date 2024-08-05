--tabla profesores
CREATE OR REPLACE EDITIONABLE TRIGGER "SSC_CORE"."TRG_INSERT_PROFESORES" 
AFTER INSERT ON SSC_CORE.PROFESORES
FOR EACH ROW
BEGIN

  INSERT INTO SSC_CORE.PROFESORES@SRV2_PLINK
  (ID_PROFESOR, ID_EMPLEADO, ESPECIALIDAD)
  VALUES
  (:NEW.ID_PROFESOR, :NEW.ID_EMPLEADO, :NEW.ESPECIALIDAD);
END;
/
ALTER TRIGGER "SSC_CORE"."TRG_INSERT_PROFESORES" ENABLE;

  CREATE OR REPLACE EDITIONABLE TRIGGER "SSC_CORE"."TRG_UPDATE_PROFESORES" 
AFTER UPDATE ON SSC_CORE.PROFESORES
FOR EACH ROW
BEGIN
  BEGIN

    UPDATE SSC_CORE.PROFESORES@SRV2_PLINK
    SET ID_EMPLEADO = :NEW.ID_EMPLEADO,
        ESPECIALIDAD = :NEW.ESPECIALIDAD
    WHERE ID_PROFESOR = :NEW.ID_PROFESOR;
  EXCEPTION
    WHEN OTHERS THEN

      NULL; 
  END;
END;
/


--tabla carreras
 CREATE OR REPLACE EDITIONABLE TRIGGER "SSC_CORE"."TRG_INSERT_CARRERAS" 
AFTER INSERT ON SSC_CORE.CARRERAS
FOR EACH ROW
BEGIN
  INSERT INTO SSC_CORE.CARRERAS@SRV2_PLINK
  (ID_CARRERA, NOMBRE_CARRERA, DESCRIPCION)
  VALUES
  (:NEW.ID_CARRERA, :NEW.NOMBRE_CARRERA, :NEW.DESCRIPCION);
END;
/
ALTER TRIGGER "SSC_CORE"."TRG_INSERT_CARRERAS" ENABLE;

  CREATE OR REPLACE EDITIONABLE TRIGGER "SSC_CORE"."TRG_UPDATE_CARRERAS" 
AFTER UPDATE ON SSC_CORE.CARRERAS
FOR EACH ROW
BEGIN
  BEGIN
    UPDATE SSC_CORE.CARRERAS@SRV2_PLINK
    SET NOMBRE_CARRERA = :NEW.NOMBRE_CARRERA,
        DESCRIPCION = :NEW.DESCRIPCION
    WHERE ID_CARRERA = :NEW.ID_CARRERA;
  EXCEPTION
    WHEN OTHERS THEN
      NULL;
  END;
END;
/

--tabla cursos
 CREATE OR REPLACE EDITIONABLE TRIGGER "SSC_CORE"."TRG_INSERT_CURSOS" 
AFTER INSERT ON SSC_CORE.CURSOS
FOR EACH ROW
BEGIN
  INSERT INTO SSC_CORE.CURSOS@SRV2_PLINK
  (ID_CURSO, NOMBRE, CREDITOS, ID_CARRERA)
  VALUES
  (:NEW.ID_CURSO, :NEW.NOMBRE, :NEW.CREDITOS, :NEW.ID_CARRERA);
END;
/
ALTER TRIGGER "SSC_CORE"."TRG_INSERT_CURSOS" ENABLE;

  CREATE OR REPLACE EDITIONABLE TRIGGER "SSC_CORE"."TRG_UPDATE_CURSOS" 
AFTER UPDATE ON SSC_CORE.CURSOS
FOR EACH ROW
BEGIN
  BEGIN
    UPDATE SSC_CORE.CURSOS@SRV2_PLINK
    SET NOMBRE = :NEW.NOMBRE,
        CREDITOS = :NEW.CREDITOS,
        ID_CARRERA = :NEW.ID_CARRERA
    WHERE ID_CURSO = :NEW.ID_CURSO;
  EXCEPTION
    WHEN OTHERS THEN
      NULL;
  END;
END;
/



--DETALLE MATRICULA
CREATE OR REPLACE EDITIONABLE TRIGGER "SSC_CORE"."TRG_INSERT_DETALLE_MATRICULA" 
AFTER INSERT ON SSC_CORE.DETALLE_MATRICULA
FOR EACH ROW
BEGIN
  INSERT INTO SSC_CORE.DETALLE_MATRICULA@SRV2_PLINK
  (ID_DET_MATRICULA, ID_MATRICULA, ID_CURSO, ID_PROFESOR)
  VALUES
  (:NEW.ID_DET_MATRICULA, :NEW.ID_MATRICULA, :NEW.ID_CURSO, :NEW.ID_PROFESOR);
END;
/
ALTER TRIGGER "SSC_CORE"."TRG_INSERT_DETALLE_MATRICULA" ENABLE;

  CREATE OR REPLACE EDITIONABLE TRIGGER "SSC_CORE"."TRG_UPDATE_DETALLE_MATRICULA" 
AFTER UPDATE ON SSC_CORE.DETALLE_MATRICULA
FOR EACH ROW
BEGIN
  BEGIN
    UPDATE SSC_CORE.DETALLE_MATRICULA@SRV2_PLINK
    SET ID_MATRICULA = :NEW.ID_MATRICULA,
        ID_CURSO = :NEW.ID_CURSO,
        ID_PROFESOR = :NEW.ID_PROFESOR
    WHERE ID_DET_MATRICULA = :NEW.ID_DET_MATRICULA;
  EXCEPTION
    WHEN OTHERS THEN
      NULL;
  END;
END;
/

--estudiante:
CREATE OR REPLACE EDITIONABLE TRIGGER "SSC_CORE"."TRG_INSERT_ESTUDIANTES" 
AFTER INSERT ON SSC_CORE.ESTUDIANTES
FOR EACH ROW
BEGIN
  INSERT INTO SSC_CORE.ESTUDIANTES@SRV2_PLINK
  (ID_ESTUDIANTE, ID_PERSONA, FEC_INGRESO, ESTADO)
  VALUES
  (:NEW.ID_ESTUDIANTE, :NEW.ID_PERSONA, :NEW.FEC_INGRESO, :NEW.ESTADO);
END;
/
ALTER TRIGGER "SSC_CORE"."TRG_INSERT_ESTUDIANTES" ENABLE;

  CREATE OR REPLACE EDITIONABLE TRIGGER "SSC_CORE"."TRG_UPDATE_ESTUDIANTES" 
AFTER UPDATE ON SSC_CORE.ESTUDIANTES
FOR EACH ROW
BEGIN
  BEGIN
    UPDATE SSC_CORE.ESTUDIANTES@SRV2_PLINK
    SET ID_PERSONA = :NEW.ID_PERSONA,
        FEC_INGRESO = :NEW.FEC_INGRESO,
        ESTADO = :NEW.ESTADO
    WHERE ID_ESTUDIANTE = :NEW.ID_ESTUDIANTE;
  EXCEPTION
    WHEN OTHERS THEN
      NULL;
  END;
END;
/

--matricula
 CREATE OR REPLACE EDITIONABLE TRIGGER "SSC_CORE"."TRG_INSERT_MATRICULA" 
AFTER INSERT ON SSC_CORE.MATRICULA
FOR EACH ROW
BEGIN
  INSERT INTO SSC_CORE.MATRICULA@SRV2_PLINK
  (ID_MATRICULA, FECHA_MATRICULA, ID_CARRERA, ID_ESTUDIANTE, ID_SEDE)
  VALUES
  (:NEW.ID_MATRICULA, :NEW.FECHA_MATRICULA, :NEW.ID_CARRERA, :NEW.ID_ESTUDIANTE, :NEW.ID_SEDE);
END;
/
ALTER TRIGGER "SSC_CORE"."TRG_INSERT_MATRICULA" ENABLE;

  CREATE OR REPLACE EDITIONABLE TRIGGER "SSC_CORE"."TRG_UPDATE_MATRICULA" 
AFTER UPDATE ON SSC_CORE.MATRICULA
FOR EACH ROW
BEGIN
  BEGIN
    UPDATE SSC_CORE.MATRICULA@SRV2_PLINK
    SET FECHA_MATRICULA = :NEW.FECHA_MATRICULA,
        ID_CARRERA = :NEW.ID_CARRERA,
        ID_ESTUDIANTE = :NEW.ID_ESTUDIANTE,
        ID_SEDE = :NEW.ID_SEDE
    WHERE ID_MATRICULA = :NEW.ID_MATRICULA;
  EXCEPTION
    WHEN OTHERS THEN
      NULL;
  END;
END;
/

--REGISTRO NOTAS
CREATE OR REPLACE EDITIONABLE TRIGGER "SSC_CORE"."TRG_UPDATE_REGISTRO_NOTAS" 
AFTER UPDATE ON SSC_CORE.REGISTRO_NOTAS
FOR EACH ROW
BEGIN
  BEGIN

    UPDATE SSC_CORE.REGISTRO_NOTAS@SRV2_PLINK
    SET ID_DET_MATRICULA = :NEW.ID_DET_MATRICULA,
        NOTA = :NEW.NOTA,
        COMENTARIOS = :NEW.COMENTARIOS
    WHERE ID_REGISTRO = :NEW.ID_REGISTRO;
  EXCEPTION
    WHEN OTHERS THEN

      NULL; 
  END;
END;
/
ALTER TRIGGER "SSC_CORE"."TRG_UPDATE_REGISTRO_NOTAS" ENABLE;

  CREATE OR REPLACE EDITIONABLE TRIGGER "SSC_CORE"."TRG_INSERT_REGISTRO_NOTAS" 
AFTER INSERT ON SSC_CORE.REGISTRO_NOTAS
FOR EACH ROW
BEGIN

  INSERT INTO SSC_CORE.REGISTRO_NOTAS@SRV2_PLINK
  (ID_REGISTRO, ID_DET_MATRICULA, NOTA, COMENTARIOS)
  VALUES
  (:NEW.ID_REGISTRO, :NEW.ID_DET_MATRICULA, :NEW.NOTA, :NEW.COMENTARIOS);
END;
/
