#-----------------------------
# Data for table 'BRANCH'
#-----------------------------
;
DELETE FROM BRANCH;
# O BRANCH COM O CODIGO INTERNO = 1 SERVE PARA REFERENCIAR UMA DISCIPLINA CURRICULAR QUE NAO PERTENCE A NENHUM RAMO, 
# 									NA TABELA 'CURRICULAR_COURSE_SCOPE'
#-------------------------------
;
INSERT INTO BRANCH values (1, '', '', 1);
INSERT INTO BRANCH values (2, 'IA', 'Inteligencia Artificial', 1);
INSERT INTO BRANCH values (3, 'II', 'Informatica Industrial', 1);

#-----------------------------
# Data for table 'CURRICULAR_YEAR'
#-----------------------------
;
DELETE FROM CURRICULAR_YEAR;
INSERT INTO CURRICULAR_YEAR values (1, 1);
INSERT INTO CURRICULAR_YEAR values (2, 2);
INSERT INTO CURRICULAR_YEAR values (3, 3);
INSERT INTO CURRICULAR_YEAR values (4, 4);
INSERT INTO CURRICULAR_YEAR values (5, 5);

#-----------------------------
# Data for table 'CURRICULAR_SEMESTER'
#-----------------------------
;
DELETE FROM CURRICULAR_SEMESTER;
INSERT INTO CURRICULAR_SEMESTER values (1, 1, 1);
INSERT INTO CURRICULAR_SEMESTER values (2, 1, 2);
INSERT INTO CURRICULAR_SEMESTER values (3, 2, 1);
INSERT INTO CURRICULAR_SEMESTER values (4, 2, 2);
INSERT INTO CURRICULAR_SEMESTER values (5, 3, 1);
INSERT INTO CURRICULAR_SEMESTER values (6, 3, 2);
INSERT INTO CURRICULAR_SEMESTER values (7, 4, 1);
INSERT INTO CURRICULAR_SEMESTER values (8, 4, 2);
INSERT INTO CURRICULAR_SEMESTER values (9, 5, 1);
INSERT INTO CURRICULAR_SEMESTER values (10, 5, 2);

#-----------------------------
# Data for table 'ENROLMENT_EQUIVALENCE'
#  KEY_EQUIVALENT_ENROLMENT, KEY_ENROLMENT, EQUIVALENCE_TYPE
#-----------------------------
;
DELETE FROM ENROLMENT_EQUIVALENCE;
--INSERT INTO ENROLMENT_EQUIVALENCE VALUES (1, 14, 15, 1);


--
-- Data for table 'STUDENT_CURRICULAR_PLAN' 
-- (ID_INTERNAL, KEY_STUDENT, KEY_DEGREE_CURRICULAR_PLAN, CURRENT_STATE, START_DATE,  KEY_BRANCH, SPECIALIZATION)
-- CURRENT_STATE: 1=ACTIVE; 2=CONCLUDED; 3=INCOMPLETED
--
DELETE FROM STUDENT_CURRICULAR_PLAN;
INSERT INTO STUDENT_CURRICULAR_PLAN VALUES (1, 1, 2, 2, '2002-10-21',2, 1, 0);
INSERT INTO STUDENT_CURRICULAR_PLAN VALUES (2, 1, 1, 1, '2002-12-21',1, 1, 0);
INSERT INTO STUDENT_CURRICULAR_PLAN VALUES (3, 5, 2, 1, '2002-10-21',1, 1, 0);
INSERT INTO STUDENT_CURRICULAR_PLAN VALUES (4, 6, 2, 1, '2002-10-21',1, 1, 0);
INSERT INTO STUDENT_CURRICULAR_PLAN VALUES (5, 7, 2, 1, '2002-10-21',1, 3, 0);
INSERT INTO STUDENT_CURRICULAR_PLAN VALUES (6, 8, 2, 1, '2002-10-21',1, 2, 0);
INSERT INTO STUDENT_CURRICULAR_PLAN VALUES (7, 9, 2, 1, '2002-10-21',1, 1, 0);
INSERT INTO STUDENT_CURRICULAR_PLAN VALUES (8, 10, 2, 1, '2002-10-21',1, 3, 0);
INSERT INTO STUDENT_CURRICULAR_PLAN VALUES (9, 11, 2, 1, '2002-10-21',1, 2, 0);

#-----------------------------
# Data for table 'ENROLMENT'  (ID_INTERNAL, KEY_STUDENT_CURRICULAR_PLAN, KEY_CURRICULAR_COURSE, KEY_EXECUTION_PERIOD, STATE, 
#									CLASS_NAME, KEY_CURRICULAR_COURSE_FOR_OPTION, EVALUATION_TYPE, UNIVERSITY_CODE)
# STATE: 1 = APPROVED
# 		 2 = REPROVED
# UNIQUE: KEY_STUDENT_CURRICULAR_PLAN, KEY_CURRICULAR_COURSE_SCOPE, KEY_EXECUTION_PERIOD
#-----------------------------
;
DELETE FROM ENROLMENT;
INSERT INTO ENROLMENT VALUES (1, 3, 1, 1, 1, 'Dominio.EnrolmentInOptionalCurricularCourse', 15, 1);
INSERT INTO ENROLMENT VALUES (2, 2, 1, 1, 1, 'Dominio.Enrolment', null, 1);
INSERT INTO ENROLMENT VALUES (3, 1, 12, 2, 2, 'Dominio.EnrolmentInOptionalCurricularCourse', 15, 1);
INSERT INTO ENROLMENT VALUES (4, 1, 13, 2, 2, 'Dominio.Enrolment', null, 1);
INSERT INTO ENROLMENT VALUES (5, 1, 13, 3, 2, 'Dominio.Enrolment', null, 1);
INSERT INTO ENROLMENT VALUES (6, 1, 1, 1, 2, 'Dominio.Enrolment', null, 1);

INSERT INTO ENROLMENT VALUES (14, 3, 24, 1, 1, 'Dominio.Enrolment', null, 1);
INSERT INTO ENROLMENT VALUES (15, 3, 25, 1, 1, 'Dominio.Enrolment', null, 1);

#-----------------------------
#Angela
#-----------------------------
;
INSERT INTO ENROLMENT VALUES (7, 4, 13, 2, 1, 'Dominio.Enrolment', null, 1);
INSERT INTO ENROLMENT VALUES (8, 4, 12, 3, 1, 'Dominio.Enrolment', null, 1);
INSERT INTO ENROLMENT VALUES (9, 4, 1, 1, 3, 'Dominio.Enrolment', null, 1);
INSERT INTO ENROLMENT VALUES (10, 5, 12, 2, 1, 'Dominio.Enrolment', null, 1);
INSERT INTO ENROLMENT VALUES (11, 5, 13, 3, 3, 'Dominio.Enrolment', null, 1);
INSERT INTO ENROLMENT VALUES (12, 5, 1, 3, 3, 'Dominio.EnrolmentInExtraCurricularCourse', null, 1);
INSERT INTO ENROLMENT VALUES (13, 6, 12, 3, 3, 'Dominio.EnrolmentInExtraCurricularCourse', null, 1);
INSERT INTO ENROLMENT VALUES (16, 1, 3, 1, 1, 'Dominio.Enrolment', null, 1);
INSERT INTO ENROLMENT VALUES (17, 3, 3, 1, 1, 'Dominio.Enrolment', null, 1);
INSERT INTO ENROLMENT VALUES (18, 5, 3, 1, 1, 'Dominio.Enrolment', null, 1);
INSERT INTO ENROLMENT VALUES (19, 7, 10, 2, 3, 'Dominio.Enrolment', null, 1);
INSERT INTO ENROLMENT VALUES (20, 7, 10, 1, 3, 'Dominio.Enrolment', null, 1);
#-----------------------------
#Angela
#-----------------------------
#Data for table 'ENROLMENT_EVALUATION'  (int ID_INTERNAL, varchar GRADE, int EVALUATION_TYPE(unique), date EXAM_DATE, date GRADE_AVAILABLE_DATE,int RESPONSIBLE_TEACHER, int STATE, int KEY_ENROLMENT(unique), int KEY_EMPLOYEE, date WHEN_ALTER, varchar OBSERVATION, varchar CHECKSUM)
;
DELETE FROM ENROLMENT_EVALUATION;
INSERT INTO ENROLMENT_EVALUATION VALUES (1, '15', 1, '2003-02-12', '2003-03-20', 1, 1, 10, null, null, null, null);
#INSERT INTO ENROLMENT_EVALUATION VALUES (2, '18', 1, '2003-02-13', '2003-03-20', 1, 1, 7, null, null, null, null);
INSERT INTO ENROLMENT_EVALUATION VALUES (3, '14', 1, '2003-02-12', '2003-03-20', 1, 1, 8, null, null, null, null);
#INSERT INTO ENROLMENT_EVALUATION VALUES (4, '12', 1, '2003-02-12', '2003-03-20', 1, 1, 12, null, null, null, null);
INSERT INTO ENROLMENT_EVALUATION VALUES (4, '15', 1, '2003-02-12', '2003-03-20', 1, 1, 9, null, null, null, null);
INSERT INTO ENROLMENT_EVALUATION VALUES (5, '18', 1, '2003-02-13', '2003-03-20', 1, 1, 20, null, null, null, null);
INSERT INTO ENROLMENT_EVALUATION VALUES (6, '14', 1, '2003-02-12', '2003-03-20', 1, 1, 19, null, null, null, null);
INSERT INTO ENROLMENT_EVALUATION VALUES (7, null, 1, null, null, 0, 2, 16, null, null, null, null);
INSERT INTO ENROLMENT_EVALUATION VALUES (8, null, 1, null, null, 0, 2, 17, null, null, null, null);
INSERT INTO ENROLMENT_EVALUATION VALUES (9, null, 1, null, null, 0, 2, 18, null, null, null, null);


#-----------------------------
# Data for table 'DEPARTMENT'
#-----------------------------
;
DELETE FROM DEPARTMENT;
INSERT INTO DEPARTMENT VALUES (1, 'dep1', 'd1');
INSERT INTO DEPARTMENT VALUES (2, 'dep10', 'd10');

#-----------------------------
# Data for table 'DEPARTMENT_COURSE'
#-----------------------------
;
DELETE FROM DEPARTMENT_COURSE;
INSERT INTO DEPARTMENT_COURSE VALUES (1, 'Engenharia da Programacao', 'ep', 1);
INSERT INTO DEPARTMENT_COURSE VALUES (2, 'Nao sei', 'mvt', 1);

#-----------------------------
# Data for table 'DEGREE'
#-----------------------------
;
DELETE FROM DEGREE;
INSERT INTO DEGREE VALUES (8,'LEIC','Licenciatura de Engenharia Informatica e de Computadores',1);
INSERT INTO DEGREE VALUES (9,'MEEC','Engenharia Electrotecnica e de Computadores',2);
INSERT INTO DEGREE VALUES (10,'MIC','Informatica e Computadores',2);
INSERT INTO DEGREE VALUES (11,'MEM','Engenharia Mecanica',2);
INSERT INTO DEGREE VALUES (12,'CURSO','Curso para apagar',1);

#-----------------------------
# Data for table 'DEGREE_CURRICULAR_PLAN'
#    (ID_INTERNAL, NAME, KEY_DEGREE, STATE, INITIAL_DATE, END_DATE)
#-----------------------------
;
DELETE FROM DEGREE_CURRICULAR_PLAN;
INSERT INTO DEGREE_CURRICULAR_PLAN VALUES (1, 'plano1', 8, 1, '0000-00-00', '0000-00-00', 2, 0, 0, 20, 0);
INSERT INTO DEGREE_CURRICULAR_PLAN VALUES (2, 'plano2', 9, 1, '0000-00-00', '0000-00-00', 2, 0, 0, 20, 0);
INSERT INTO DEGREE_CURRICULAR_PLAN VALUES (3, 'plano3', 10, 1, '0000-00-00', '0000-00-00', 2, 0, 0, 20, 0);
INSERT INTO DEGREE_CURRICULAR_PLAN VALUES (4, 'plano4', 11, 1, '0000-00-00', '0000-00-00', 2, 0, 0, 20, 0);

--
-- Data for table 'DEGREE_CURRICULAR_PLAN'
--    (ID_INTERNAL, KEY_DEGREE_CURRICULAR_PLAN, KEY_EXECUTION_PERIOD, START_DATE, END_DATE) 
--
DELETE FROM ENROLMENT_PERIOD;
INSERT INTO ENROLMENT_PERIOD VALUES (1,1,1,SYSDATE(),SYSDATE()+500000000);

#-----------------------------
# Data for table 'CURRICULAR_COURSE'
-- (ID_INTERNAL, KEY_DEPARTMENT_COURSE, KEY_DEGREE_CURRICULAR_PLAN, CREDITS, THEORETICAL_HOURS, PRATICAL_HOURS, THEO_PRAT_HOURS, LAB_HOURS, 
-- NAME, CODE, TYPE, EXECUTION_SCOPE, MANDATORY, KEY_CURRICULAR_COURSE_ENROLMENT_INFO)
#-----------------------------
;
DELETE FROM CURRICULAR_COURSE;
INSERT INTO CURRICULAR_COURSE VALUES (14,1,1,0,0,0,0,0,'Trabalho Final de Curso I','TFCI', 1, 1, 0, null);
INSERT INTO CURRICULAR_COURSE VALUES (18,1,1,0,0,0,0,0,'Redes de Computadores I','RCI', 1, 1, 0, null);
INSERT INTO CURRICULAR_COURSE VALUES (16,2,1,0,0,0,0,0,'Introducao a Programacao','IP', 1, 1, 0, null);
INSERT INTO CURRICULAR_COURSE VALUES (20,2,1,1,0,0,0,0,'Arquitecturas de Computadores','AC', 1, 1, 0, null);
INSERT INTO CURRICULAR_COURSE VALUES (23,2,1,0,0,0,0,0,'Aprendizagem','APR', 1, 1, 0, null);

INSERT INTO CURRICULAR_COURSE VALUES (1,1,1,4,3,2,0,0,'Analise Matematica I','AMI', 1, 1, 0, null);
INSERT INTO CURRICULAR_COURSE VALUES (2,1,1,4,3,2,0,0,'Analise Matematica II','AMII', 1, 1, 0, null);
INSERT INTO CURRICULAR_COURSE VALUES (3,1,1,4,3,2,0,0,'Analise Matematica III','AMIII', 1, 1, 0, null);

INSERT INTO CURRICULAR_COURSE VALUES (15,1,2,0,0,0,0,0,'Trabalho Final de Curso II','TFCII', 1, 1, 0, null);
INSERT INTO CURRICULAR_COURSE VALUES (17,2,2,0,0,0,0,0,'Programacao com Objectos','PO', 1, 1, 0, null);
INSERT INTO CURRICULAR_COURSE VALUES (19,1,2,0,0,0,0,0,'Engenharia da Programacao','EP', 1, 1, 0, null);
INSERT INTO CURRICULAR_COURSE VALUES (21,2,2,0,0,0,0,0,'Compiladores','COMP', 1, 1, 0, null);
INSERT INTO CURRICULAR_COURSE VALUES (22,1,2,0,0,0,0,0,'Redes de Computadores II','RCII', 1, 1, 0, null);

INSERT INTO CURRICULAR_COURSE VALUES (24, null, 1, 0, 0, 0, 0, 0, 'Cadeira a Equivaler', 'CAE', 1, 1, 0, null);
INSERT INTO CURRICULAR_COURSE VALUES (25, null, 1, 0, 0, 0, 0, 0, 'Cadeira Equivalente', 'CE', 1, 1, 0, null);
INSERT INTO CURRICULAR_COURSE VALUES (26, null, 1, 0, 0, 0, 0, 0, 'Cadeira Que N�o Tem Enrolment 1', 'CNE1', 1, 1, 0, null);
INSERT INTO CURRICULAR_COURSE VALUES (27, null, 1, 0, 0, 0, 0, 0, 'Cadeira Que N�o Tem Enrolment 2', 'CNE2', 1, 1, 0, null);

#-----------------------------
# Data for table 'CURRICULAR_COURSE_SCOPE'
#   (ID_INTERNAL, KEY_CURRICULAR_SEMESTER, KEY_CURRICULAR_COURSE, KEY_BRANCH) 
#-----------------------------
;
DELETE FROM CURRICULAR_COURSE_SCOPE;
INSERT INTO CURRICULAR_COURSE_SCOPE values (1, 3, 14, 2,0,0,0,0, 2, 1, 1, null);
INSERT INTO CURRICULAR_COURSE_SCOPE values (2, 3, 14, 3,0,0,0,0, 2, 1, 1, null);
INSERT INTO CURRICULAR_COURSE_SCOPE values (3, 10, 15, 1,0,0,0,0, 2, 1, 1, null);
INSERT INTO CURRICULAR_COURSE_SCOPE values (4, 1, 16, 1,0,0,0,0, 2, 1, 1, null);
INSERT INTO CURRICULAR_COURSE_SCOPE values (5, 3, 17, 1,0,0,0,0, 2, 1, 1, null);
INSERT INTO CURRICULAR_COURSE_SCOPE values (6, 5, 18, 1,0,0,0,0, 2, 1, 1, null);
INSERT INTO CURRICULAR_COURSE_SCOPE values (7, 7, 19, 1,0,0,0,0, 2, 1, 1, null);
INSERT INTO CURRICULAR_COURSE_SCOPE values (8, 2, 20, 1,0,0,0,0, 2, 1, 1, null);
INSERT INTO CURRICULAR_COURSE_SCOPE values (9, 4, 21, 1,0,0,0,0, 2, 1, 1, null);
INSERT INTO CURRICULAR_COURSE_SCOPE values (10, 6, 22, 1,0,0,0,0, 2, 1, 1, null);
INSERT INTO CURRICULAR_COURSE_SCOPE values (11, 8, 23, 1,0,0,0,0, 2, 1, 1, null);
INSERT INTO CURRICULAR_COURSE_SCOPE values (12, 1, 1, 1,0,0,0,0, 2, 1, 1, null);
INSERT INTO CURRICULAR_COURSE_SCOPE values (13, 2, 2, 1,0,0,0,0, 2, 1, 1, null);
INSERT INTO CURRICULAR_COURSE_SCOPE values (14, 3, 3, 1,0,0,0,0, 2, 1, 1, null);

INSERT INTO CURRICULAR_COURSE_SCOPE values (15, 1, 24, 1, 0, 0, 0, 0, 2, 1, 1, null);
INSERT INTO CURRICULAR_COURSE_SCOPE values (16, 1, 25, 1, 0, 0, 0, 0, 2, 1, 1, null);
INSERT INTO CURRICULAR_COURSE_SCOPE values (17, 1, 26, 1, 0, 0, 0, 0, 2, 1, 1, null);
INSERT INTO CURRICULAR_COURSE_SCOPE values (18, 1, 27, 1, 0, 0, 0, 0, 2, 1, 1, null);

-- -----------------------------
-- Data for table 'STUDENT_KIND'
-- (ID_INTERNAL, STUDENT_TYPE, MIN_COURSES_TO_ENROL, MAX_COURSES_TO_ENROL, MAX_NAC_TO_ENROL) 
-- -----------------------------
delete from STUDENT_KIND;
insert into STUDENT_KIND values (1, 1, 3, 7, 10);
