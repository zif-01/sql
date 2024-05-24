select `groups`.`gr` as 'Номер группы', `groups`.`shifr_napr` as 'Шифр направления', `groups`.`napr` as 'Наименование направления'
from `groups`;
/*Использование вычисление в формулировке запроса*/
select knamedisc as 'Дисциплина', 'читается', hours as 'Часов', hours/36 as 'Зачётных единиц' from `discipl`;


SELECT 
    `name` as 'ФИО студента', round((curdate() - `dob`)/365/24) as 'возраст'
FROM
    students;

SELECT 
    *
FROM
    students
WHERE
    dob > '1999-12-31'
        AND dob < '1999-12-31' + INTERVAL '1' YEAR;
        
	
SELECT 
    *
FROM
    students
WHERE
    dob > '1999-12-31'
        AND dob < '1999-12-31' + INTERVAL '10' MONTH;
        
/*Выражение в предложении select, меняющее дату в результате отбора*/
select dob + interval '1' month from students
where dob > '1999-12-31';

select * from students where dob < date(1999-12-31) + (date(2000-12-01) - date(2001-01-01)
