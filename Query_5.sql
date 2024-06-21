/*Вложенные запросы*/

/*Применение простейшего подзапроса*/

SELECT 
  * 
FROM 
  students 
WHERE 
  idgroups = (
    select 
      idgroups 
    from 
      `groups` 
    where 
      napr = 'Педагогическое образование (с двумя профилями подготовки)' 
      and prof = 'Математика и Информатика'
  );
  
  /*Агрегатные функции в подзапросах*/
  SELECT 
    *
FROM
    discipl
WHERE
    hours > (SELECT 
            AVG(hours)
        FROM
            discipl
        WHERE
            knamedisc LIKE '%Б%');
		
  /*Оператор IN в подзапросах*/
SELECT 
    *
FROM
    `groups`
WHERE
    idgroups IN (SELECT 
            idgroups
        FROM
            `groups`
        WHERE
            napr = 'Педагогическое образование (с двумя профилями подготовки)');
            
SELECT 
    *
FROM
    discipl
WHERE
    hours IN (SELECT 
            hours
        FROM
            discipl
        WHERE
            knamedisc LIKE '%Б%');
            
/*Связанные (коррелированные) подзапросы*/
SELECT 
    *
FROM
    `groups` `outer`
WHERE
    'Суббота' IN (SELECT 
            den_ned
        FROM
            sched `inner`
        WHERE
            `inner`.idgroups = `outer`.idgroups);
            
/*Пример связанного подзапроса с агрегатной функцией*/
SELECT 
    gr as 'Группа'
FROM
    `groups` main
WHERE
    1 < (SELECT 
            COUNT(*)
        FROM
            sched
        WHERE
            iddiscpl = main.idgroups);
            
/*Связывание таблицы с собой */

SELECT 
    *
FROM
    discipl main
WHERE
    hours > (SELECT 
            AVG(hours)
        FROM
            discipl
        WHERE
            knamedisc = main.knamedisc)
            
SELECT 
    *
FROM
    discipl main
WHERE
    hours > (SELECT 
            (AVG(hours) * 1.5)
        FROM
            discipl
        WHERE
            knamedisc = main.knamedisc)
            
/*Использование условий группировки в связанных запросах */

SELECT 
    kaf, knamedisc, SUM(hours)
FROM
    discipl a
GROUP BY kaf, knamedisc
HAVING SUM(hours) > (SELECT
    36 + MIN(hours)
    FROM discipl
    WHERE a.kaf = kaf);