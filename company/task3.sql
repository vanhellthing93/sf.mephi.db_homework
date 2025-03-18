WITH RECURSIVE
    Managers AS(
    SELECT
        e.EmployeeID,
        e.Name,
        e.ManagerID,
        e.DepartmentID,
        e.RoleID
    FROM
        Employees e
    INNER JOIN Roles r ON
        e.RoleID = r.RoleID
    WHERE
        r.RoleName = 'Менеджер'
    UNION ALL
SELECT
    e.EmployeeID,
    e.Name,
    e.ManagerID,
    e.DepartmentID,
    e.RoleID
FROM
    Employees e
INNER JOIN Managers m ON
    e.ManagerID = m.EmployeeID
)
SELECT
    m.EmployeeID,
    m.Name AS EmployeeName,
    m.ManagerID,
    d.DepartmentName,
    r.RoleName,
    COALESCE(
        GROUP_CONCAT(
            DISTINCT p.ProjectName
        ORDER BY
            p.ProjectName SEPARATOR ', '
        )
    ) AS ProjectsNames,
    COALESCE(
        GROUP_CONCAT(
            DISTINCT t.TaskName
        ORDER BY
            t.TaskName SEPARATOR ', '
        )
    ) AS TasksNames,
    COUNT(DISTINCT sub.EmployeeID) AS TotalSubordinates
FROM
    Managers m
LEFT JOIN Departments d ON
    m.DepartmentID = d.DepartmentID
LEFT JOIN Roles r ON
    m.RoleID = r.RoleID
LEFT JOIN Projects p ON
    m.DepartmentID = p.DepartmentID
LEFT JOIN Tasks t ON
    m.EmployeeID = t.AssignedTo
LEFT JOIN Employees sub ON
    m.EmployeeID = sub.ManagerID
GROUP BY
    m.EmployeeID,
    m.Name,
    m.ManagerID,
    d.DepartmentName,
    r.RoleName
HAVING
    TotalSubordinates > 0;