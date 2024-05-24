/*Декартово произведение таблиц*/
SELECT 
    *
FROM
    students,
    `groups`;
    
/*Соединение таблиц по общему значению*/
SELECT 
    `name`, napr, prof
FROM
    students,
    `groups`
WHERE
    students.idgroups = `groups`.idgroups;
    
/*Альтернативная форма создания таблиц c использованием общих полей(USING())*/
SELECT 
    `name`, napr, prof
FROM
    students
        JOIN
    `groups` USING (idgroups);
    
SELECT 
    `name`, napr, prof
FROM
    students
        LEFT JOIN
    `groups` USING (idgroups);
    
SELECT 
    `name`, gr
FROM
    students
        RIGHT JOIN
    `groups` USING (idgroups)
ORDER BY `name`;


SELECT 
    `name`, napr, prof
FROM
    students
        JOIN
    `groups` ON (students.idgroups = `groups`.idgroups)
WHERE
    napr LIKE 'И%';