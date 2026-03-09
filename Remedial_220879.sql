use hospital_220879;

show tables;
/* ver que tienen las tablas*/
DESCRIBE tbb_md_pacientes;

DESCRIBE tbb_hr_personal_medico;

DESCRIBE tbb_ms_citas_medicas;

/* funcion y procedimientos  de generacion de pacientes*/
DELIMITER $$



CREATE PROCEDURE generar_pacientes(IN cantidad INT)
BEGIN
    DECLARE i INT DEFAULT 0;

    WHILE i < cantidad DO

        INSERT INTO tbb_md_pacientes
        (nombre, apellido, fecha_nacimiento, genero, grupo_sanguineo, telefono, sintomas)

        VALUES(

        ELT(FLOOR(1 + RAND()*10),
        'Juan','Carlos','Luis','Pedro','Jose',
        'Maria','Ana','Laura','Carmen','Rosa'),

        ELT(FLOOR(1 + RAND()*10),
        'Garcia','Martinez','Lopez','Hernandez','Perez',
        'Gonzalez','Ramirez','Torres','Flores','Vargas'),

        DATE_ADD('1960-01-01', INTERVAL FLOOR(RAND()*20000) DAY),

        ELT(FLOOR(1 + RAND()*2),'Masculino','Femenino'),

        ELT(FLOOR(1 + RAND()*8),
        'A+','A-','B+','B-','AB+','AB-','O+','O-'),

        CONCAT('55', FLOOR(10000000 + RAND()*89999999)),

        ELT(FLOOR(1 + RAND()*6),
        'Dolor de cabeza',
        'Fiebre',
        'Dolor abdominal',
        'Tos persistente',
        'Mareos',
        'Malestar general')

        );

        SET i = i + 1;

    END WHILE;

END$$

DELIMITER ;
/* modificacin de tablas pacientes*/
ALTER TABLE tbb_md_pacientes
ADD nombre VARCHAR(100),
ADD apellido VARCHAR(100),
ADD fecha_nacimiento DATE,
ADD genero ENUM('Masculino','Femenino'),
ADD grupo_sanguineo ENUM('A+','A-','B+','B-','AB+','AB-','O+','O-'),
ADD telefono VARCHAR(15),
ADD sintomas VARCHAR(255);


/* procedimiento para generar 1000 pacientes*/
CALL generar_pacientes(1000);

SELECT * FROM tbb_md_pacientes;

/*insertar datos de doctores*/
DELIMITER $$

DROP PROCEDURE IF EXISTS generar_medicos $$

CREATE PROCEDURE generar_medicos(IN cantidad INT)
BEGIN
    DECLARE i INT DEFAULT 0;

    WHILE i < cantidad DO

        INSERT INTO tbb_hr_personal_medico
        (nombre, apellido, personal_id, turno, area_id, celula_profecional, especialidad)

        VALUES(

        ELT(FLOOR(1 + RAND()*10),
        'Juan','Carlos','Luis','Pedro','Jose',
        'Miguel','Fernando','Ricardo','Jorge','Roberto'),

        ELT(FLOOR(1 + RAND()*10),
        'Garcia','Martinez','Lopez','Hernandez',
        'Perez','Gonzalez','Ramirez','Torres',
        'Flores','Vargas'),

        FLOOR(1 + RAND()*200),

        ELT(FLOOR(1 + RAND()*4),
        'MATUTINO','VESPERTINO','NOCTURNO','MIXTO'),

        FLOOR(1 + RAND()*10),

        CONCAT('MED', FLOOR(100000 + RAND()*900000)),

        ELT(FLOOR(1 + RAND()*8),
        'Cardiologia',
        'Pediatria',
        'Neurologia',
        'Traumatologia',
        'Dermatologia',
        'Oncologia',
        'Psiquiatria',
        'Medicina General')

        );

        SET i = i + 1;

    END WHILE;

END $$

DELIMITER ;

CALL generar_medicos(50);


SELECT * FROM tbb_hr_personal_medico;

ALTER TABLE tbb_hr_personal_medico
ADD nombre VARCHAR(100),
ADD apellido VARCHAR(100);

TRUNCATE TABLE tbb_hr_personal_medico;

/*insercion de datos de citas medicas 3000*/


DELIMITER $$

CREATE PROCEDURE generar_citas_medicas(IN cantidad INT)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE v_id_paciente INT;
    DECLARE v_id_medico INT;

    WHILE i < cantidad DO

        -- Elegir un paciente y un médico al azar
        SET v_id_paciente = (SELECT id FROM tbb_md_pacientes ORDER BY RAND() LIMIT 1);
        SET v_id_medico   = (SELECT id FROM tbb_hr_personal_medico ORDER BY RAND() LIMIT 1);

        -- Insertar cita médica con datos semi-reales
        INSERT INTO tbb_ms_citas_medicas
        (
            id_paciente,
            id_personal_medico,
            id_area,
            fecha,
            hora,
            motivo,
            tipo_cita,
            estado_cita,
            observaciones,
            fecha_registro,
            estatus
        )
        VALUES
        (
            v_id_paciente,
            v_id_medico,
            FLOOR(1 + RAND()*10), -- área aleatoria
            DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND()*365) DAY), -- fecha aleatoria
            SEC_TO_TIME(FLOOR(28800 + RAND()*36000)), -- hora aleatoria entre 08:00 y 18:00
            ELT(FLOOR(1 + RAND()*6),
                'Dolor abdominal',
                'Chequeo general',
                'Dolor de cabeza',
                'Control de presión arterial',
                'Revisión de estudios',
                'Fiebre y malestar'
            ),
            ELT(FLOOR(1 + RAND()*5),
                'Consulta general',
                'Urgencias',
                'Control',
                'Seguimiento',
                'Primera vez'
            ),
            ELT(FLOOR(1 + RAND()*5),
                'Pendiente',
                'En curso',
                'Completada',
                'Cancelada',
                'No asistió'
            ),
            ELT(FLOOR(1 + RAND()*5),
                'Paciente llegó puntual.',
                'Paciente presentó retraso.',
                'Requiere estudios adicionales.',
                'Requiere cita de seguimiento.',
                'Observaciones generales.'
            ),
            NOW(), -- fecha_registro
            1 -- estatus
        );

        SET i = i + 1;
    END WHILE;

END $$

DELIMITER ;



CALL generar_citas_medicas(3000);



SELECT * FROM tbb_ms_citas_medicas;

SELECT 
    c.id,
    CONCAT(p.nombre,' ',p.apellido) AS paciente,
    CONCAT(m.nombre,' ',m.apellido) AS medico,
    c.fecha,
    c.hora,
    c.motivo,
    c.tipo_cita,
    c.estado_cita,
    c.observaciones
FROM tbb_ms_citas_medicas c
JOIN tbb_md_pacientes p ON c.id_paciente = p.id
JOIN tbb_hr_personal_medico m ON c.id_personal_medico = m.id
LIMIT 3000;

