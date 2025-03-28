# Задача 2
## Условие

Найти всех сотрудников, подчиняющихся Ивану Иванову с EmployeeID = 1, включая их подчиненных и подчиненных подчиненных. Для каждого сотрудника вывести следующую информацию:

1. EmployeeID: идентификатор сотрудника.
2. Имя сотрудника.
3. Идентификатор менеджера.
4. Название отдела, к которому он принадлежит.
5. Название роли, которую он занимает.
6. Название проектов, к которым он относится (если есть, конкатенированные в одном столбце).
7. Название задач, назначенных этому сотруднику (если есть, конкатенированные в одном столбце).
8. Общее количество задач, назначенных этому сотруднику.
9. Общее количество подчиненных у каждого сотрудника (не включая подчиненных их подчиненных).
10. Если у сотрудника нет назначенных проектов или задач, отобразить NULL.


```
Решение задачи должно представлять из себя один sql-запрос и задействовать ключевое слово RECURSIVE.
```

## Критерии оценивания

Задача решена верно: 5 баллов.

Задача частично решена верно: 3 балла.

Задача решена неверно: 0 баллов.

## Ожидаемый вывод для тестовых данных

| EmployeeID | EmployeeName           | ManagerID | DepartmentName   | RoleName                | ProjectNames | TaskNames                                                                                                         | TotalTasks | TotalSubordinates |
|------------|------------------------|-----------|------------------|-------------------------|--------------|-------------------------------------------------------------------------------------------------------------------|------------|-------------------|
| 20         | Александр Александров  | 3         | Отдел маркетинга | Менеджер                | Проект B     | NULL                                                                                                              | 0          | 0                 |
| 4          | Алексей Алексеев       | 2         | Отдел продаж     | Менеджер                | Проект A     | Задача 14: Создание презентации для клиентов, Задача 1: Подготовка отчета по продажам                             | 2          | 4                 |
| 16         | Анастасия Анастасиева  | 7         | Отдел поддержки  | Специалист по поддержке | Проект D     | NULL                                                                                                              | 0          | 0                 |
| 29         | Анастасия Анастасиевна | 7         | Отдел поддержки  | Специалист по поддержке | Проект D     | NULL                                                                                                              | 0          | 0                 |
| 6          | Андрей Андреев         | 1         | Отдел разработки | Разработчик             | Проект C     | Задача 15: Обновление сайта, Задача 6: Обновление документации                                                    | 2          | 6                 |
| 30         | Валентин Валентинов    | 6         | Отдел разработки | Разработчик             | Проект C     | NULL                                                                                                              | 0          | 0                 |
| 15         | Виктор Викторов        | 4         | Отдел продаж     | Менеджер                | Проект A     | NULL                                                                                                              | 0          | 0                 |
| 21         | Галина Галина          | 7         | Отдел поддержки  | Специалист по поддержке | Проект D     | NULL                                                                                                              | 0          | 0                 |
| 26         | Денис Денисов          | 6         | Отдел разработки | Разработчик             | Проект C     | NULL                                                                                                              | 0          | 0                 |
| 14         | Дмитрий Дмитриев       | 3         | Отдел маркетинга | Маркетолог              | Проект B     | NULL                                                                                                              | 0          | 0                 |
| 25         | Екатерина Екатеринина  | 7         | Отдел поддержки  | Специалист по поддержке | Проект D     | NULL                                                                                                              | 0          | 0                 |
| 7          | Елена Еленова          | 1         | Отдел поддержки  | Специалист по поддержке | Проект D     | Задача 12: Настройка системы поддержки                                                                            | 1          | 5                 |
| 1          | Иван Иванов            | NULL      | Отдел продаж     | Генеральный директор    | Проект A     | NULL                                                                                                              | 0          | 4                 |
| 28         | Игорь Игорев           | 2         | Отдел продаж     | Менеджер                | Проект A     | NULL                                                                                                              | 0          | 0                 |
| 11         | Ирина Иринина          | 6         | Отдел разработки | Разработчик             | Проект C     | Задача 8: Тестирование нового продукта                                                                            | 1          | 0                 |
| 13         | Кристина Кристинина    | 4         | Отдел продаж     | Менеджер                | Проект A     | NULL                                                                                                              | 0          | 0                 |
| 18         | Людмила Людмилова      | 3         | Отдел маркетинга | Маркетолог              | Проект B     | NULL                                                                                                              | 0          | 0                 |
| 17         | Максим Максимов        | 6         | Отдел разработки | Разработчик             | Проект C     | NULL                                                                                                              | 0          | 0                 |
| 23         | Марина Маринина        | 3         | Отдел маркетинга | Маркетолог              | Проект B     | NULL                                                                                                              | 0          | 0                 |
| 5          | Мария Мариева          | 3         | Отдел маркетинга | Менеджер                | Проект B     | Задача 5: Создание рекламной кампании                                                                             | 1          | 0                 |
| 19         | Наталья Натальева      | 4         | Отдел продаж     | Менеджер                | Проект A     | NULL                                                                                                              | 0          | 0                 |
| 10         | Николай Николаев       | 6         | Отдел разработки | Разработчик             | Проект C     | Задача 11: Интеграция с новым API, Задача 3: Разработка нового функционала                                        | 2          | 0                 |
| 8          | Олег Олегов            | 2         | Отдел продаж     | Менеджер                | Проект A     | Задача 7: Проведение тренинга для сотрудников                                                                     | 1          | 0                 |
| 27         | Ольга Ольгина          | 3         | Отдел маркетинга | Маркетолог              | Проект B     | NULL                                                                                                              | 0          | 0                 |
| 22         | Павел Павлов           | 6         | Отдел разработки | Разработчик             | Проект C     | NULL                                                                                                              | 0          | 0                 |
| 2          | Петр Петров            | 1         | Отдел продаж     | Директор                | Проект A     | NULL                                                                                                              | 0          | 3                 |
| 3          | Светлана Светлова      | 1         | Отдел маркетинга | Директор                | Проект B     | NULL                                                                                                              | 0          | 7                 |
| 12         | Сергей Сергеев         | 7         | Отдел поддержки  | Специалист по поддержке | Проект D     | Задача 4: Поддержка клиентов, Задача 9: Ответы на запросы клиентов                                                | 2          | 0                 |
| 24         | Станислав Станиславов  | 4         | Отдел продаж     | Менеджер                | Проект A     | NULL                                                                                                              | 0          | 0                 |
| 9          | Татьяна Татеева        | 3         | Отдел маркетинга | Маркетолог              | Проект B     | Задача 10: Подготовка маркетинговых материалов, Задача 13: Проведение анализа конкурентов, Задача 2: Анализ рынка | 3          | 0                 |