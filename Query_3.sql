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

select * from students where dob < date(1999-12-31) + (date(2000-12-01) - date(2000-01-01));
/*Проверка условия в предложении select*/
SELECT 
    case `students`.`docum`
    when '1'
    then `students`.`docum`
    when '0'
    then '0 документов'
    else 'Нет документов'
    end as 'Наличие документов', `students`.`name`
FROM
    students
    where 1;

/*Измениение в шифрах направление(например на устаревши*/
SELECT 
    case shifr_napr
    when '09.03.02'
    then '11.11.11'
    when '44.03.05'
    then '77.77.77'
    else shifr_napr
    end as 'Устаревшиве цифры направлений'
    from
    `groups`
    where 1;

/*Упрощённая форма работы с совпадающими значениями - заменяет второй параметр функции nullif() на значение null если он совпадает с содержимыми ячейки*/
SELECT 
    nullif(shifr napr, '09.01.02'), napr
FROM
    `groups`
    where 1;
    
    
/*Сортировка результатов отбора*/


SELECT 
    *
FROM
    students
ORDER BY dob, `name`; 


SELECT 
    *
FROM
    students
ORDER BY `name` DESC; 

SELECT 
    *
FROM
    students
ORDER BY idgroups DESC; 

SELECT 
    *
FROM
    discipl
ORDER BY knamedisc;

/*Упорядочивание агрегатов*/

SELECT 
    `hours`, COUNT(knamedisc)
FROM
    discipl
GROUP BY hours
ORDER BY COUNT(knamedisc);
    
SELECT 
    `hours`, COUNT(knamedisc)
FROM
    discipl
GROUP BY hours
ORDER BY 2 DESC;

SELECT 
    `idgroups`, MAX(dob)
FROM
    students
WHERE
    NOT idgroups IS NULL
GROUP BY idgroups
ORDER BY 2;