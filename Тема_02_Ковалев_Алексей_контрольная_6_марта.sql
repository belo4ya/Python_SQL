-- 1
select concat_ws(';', STUDENT_ID, ucase(SURNAME), ucase(NAME), STIPEND,
    KURS, ucase(CITY), date_format(BIRTHDAY, '%d/%m/%Y'), UNIV_ID)
    as "RESULT" from student;

-- 2
select concat(concat_ws(
    '; ', concat(substr(ucase(NAME), 1, 1), '.', ucase(SURNAME)),
    concat('место жительства-', ucase(CITY)), 'родился-'
    ),
    date_format(BIRTHDAY, '%d.%m.%y')) as "RESULT" from student;

-- 3
select concat(concat_ws(
    '; ', concat(substr(lcase(NAME), 1, 1), '.', lcase(SURNAME)),
    concat('место жительства-', lcase(CITY)), 'родился: '
    ),
    lcase(date_format(BIRTHDAY, '%d-%m-%y')), '.') as "RESULT" from student;

-- 4
select concat(
    concat(ucase(left(NAME, 1)), substr(lcase(NAME), 2)),
    ' ',
    concat(ucase(left(SURNAME, 1)), substr(lcase(SURNAME), 2)),
    ' родился в ',
    year(BIRTHDAY),
    ' году.'
) as "RESULT" from student;

-- 5
select SURNAME, NAME, STIPEND * 100 as "STIPEND" from student;

-- 6
select concat(
    ucase(NAME),
    ' ',
    ucase(SURNAME),
    ' родился в ',
    year(BIRTHDAY),
    ' году.'
) as "RESULT" from student where KURS in (1, 2, 4);

-- 7
select concat(
    'Код-',
    UNIV_ID,
    '; ',
    ucase(UNIV_NAME),
    '-г.',
    ucase(CITY),
    '; ',
    'Рейтиг=',
    RATING,
    '.'
) as "RESULT" from university;

-- 8
select concat(
    'Код-',
    UNIV_ID,
    '; ',
    ucase(UNIV_NAME),
    '-г.',
    ucase(CITY),
    '; ',
    'Рейтиг=',
    round(RATING, -length(RATING) + 1),
    '.'
) as "RESULT" from university;

-- 9
select count(*) as "SUBJS_20" from exam_marks where SUBJ_ID = 20;

-- 10
select count(distinct SUBJ_ID) as "SUBJS" from exam_marks;

-- 11
select STUDENT_ID, min(MARK) as "MIN_MARK" from exam_marks group by STUDENT_ID;

-- 12
select STUDENT_ID, max(MARK) as "MAX_MARK" from exam_marks group by STUDENT_ID;

-- 13
select * from student where lcase(SURNAME) like 'и%' order by SURNAME limit 1;

-- 14
select SUBJ_NAME, max(SEMESTER) from subject group by SUBJ_ID;

-- 15
select count(STUDENT_ID) from exam_marks group by EXAM_DATE;

-- 16
select KURS, SUBJ_ID, avg(MARK) from exam_marks natural join student group by KURS, SUBJ_ID;

-- 17
select STUDENT_ID, avg(MARK) from exam_marks group by STUDENT_ID;

-- 18
select EXAM_ID, avg(MARK) from exam_marks group by EXAM_ID;

-- 19
select EXAM_ID, count(STUDENT_ID) from exam_marks where MARK > 2 group by EXAM_ID;

-- 20
with t as (
    select SUBJ_ID, SUBJ_NAME, HOUR, SEMESTER, if(SEMESTER=1 or SEMESTER=2, 1,
        if(SEMESTER=3 or SEMESTER=4, 2, if(SEMESTER=5 or SEMESTER=6, 3,
            if(SEMESTER=7 or SEMESTER=8, 4, 0)))) as COURSE from subject
)
select COURSE, count(*) from t group by COURSE;
