WITH RECURSIVE
    Subordinates AS(
    SELECT
        e.EmployeeID,
        e.Name,
        e.ManagerID,
        e.DepartmentID,
        e.RoleID
    FROM
        Employees e
    WHERE
        e.EmployeeID = 1
    UNION ALL
SELECT
    e.EmployeeID,
    e.Name,
    e.ManagerID,
    e.DepartmentID,
    e.RoleID
FROM
    Employees e
INNER JOIN Subordinates s ON
    e.ManagerID = s.EmployeeID
)
SELECT
    s.EmployeeID,
    s.Name AS EmployeeName,
    s.ManagerID,
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
    ) AS TaskNames,
    COUNT(DISTINCT t.TaskID) AS TotalTasks,
    COUNT(DISTINCT sub.EmployeeID) AS TotalSubordinates
FROM
    Subordinates s
LEFT JOIN Departments d ON
    s.DepartmentID = d.DepartmentID
LEFT JOIN Roles r ON
    s.RoleID = r.RoleID
LEFT JOIN Projects p ON
    p.DepartmentID = s.DepartmentID
LEFT JOIN Tasks t ON
    s.EmployeeID = t.AssignedTo
LEFT JOIN Employees sub ON
    s.EmployeeID = sub.ManagerID
GROUP BY
    s.EmployeeID,
    s.Name,
    s.ManagerID,
    d.DepartmentName,
    r.RoleName
ORDER BY
    s.Name;