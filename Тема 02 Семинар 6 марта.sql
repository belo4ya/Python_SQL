--Семинар 5 марта; Подгруппы 3, 4
--Семинар 6 марта 2021 года; Подгруппа 2

SELECT 'ФАМИЛИЯ', surname, 'ИМЯ', name, 100
	FROM student;

SELECT surname,name,stipend, -(stipend*kurs)/2 as Calc
	FROM student
	WHERE kurs=4 AND stipend>0;

SELECT surname || '_' || name as FIO, stipend
	FROM student
	WHERE kurs=4 AND stipend>0;

SELECT upper('student') || '_' || lower('SiDOROV') as Func;

SELECT ltrim('    student',' ') as Left_Trim;

SELECT rtrim('   студент Макаров   ',' ') as Right_Trim;

select substr(subject.subj_name, 1, 4) as Subj
	FROM subject;

select subject.subj_name, instr(subject.subj_name,'о') as Letter_Number
	FROM subject;