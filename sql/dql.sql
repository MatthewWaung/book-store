
/*
1.查询列表可以是:表中的字段、常量值、表达式、函数
2.查询结果是一个虚拟的表格
*/
USE bookstore;
#1.查询表中的单个字段
select first_name
from employees;
#2.查询表中的多个字段
select first_name, last_name, email
from employees;
#3.查询表中所有字段
#方式一：
SELECT *
FROM employees;
#方式二：
SELECT employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id, hiredate
FROM employees;
#4.常量查询
SELECT 100;
SELECT 'Mathematics';
#5.查询表达式
SELECT 100*99;
#6.查询函数
SELECT VERSION();
#7.起别名
/*
1.便于理解
2.如果查询的字段有重名的情况，使用别名可以区分开来
*/
#方法一：使用AS
SELECT 100%98 AS 取模结果;
#ShuwenHE
#first_name Shuwen
#last_name He
SELECT first_name AS 名, last_name AS 姓
FROM employees;
#方法二：使用空格
SELECT first_name  名, last_name  姓
FROM employees;
#查询salary
SELECT salary AS "out put"
FROM employees;
#8.去重
SELECT DISTINCT department_id
FROM employees;
#9.加号作用
SELECT 1+2;
SELECT '1'+2;
SELECT 'shuwen'+1;
SELECT NULL+1;
#10.使用concat实现连接
SELECT CONCAT(first_name,last_name) AS 姓名
from employees;

#11.条件运算符---查询工资>80000的员工信息
SELECT *
FROM employees
WHERE salary > 80000;

#查询部门编号不等于90号的员工名和部门编号
SELECT CONCAT(first_name,last_name) AS 姓名, department_id AS 部门
FROM employees
WHERE department_id <> 1;

#12.逻辑运算符
#查询工资在60000到80000之间的员工名、工资以及奖金
SELECT CONCAT(first_name,last_name) AS 姓名, salary, commission_pct
FROM employees
WHERE salary > 60000 and salary < 80000;

#查询部门编号不是在2到4之间，或者工资高于80000的员工信息
#---<2----4>----
SELECT *
FROM employees
WHERE department_id <2 OR department_id > 4 OR salary > 80000;
SELECT *
FROM employees
WHERE NOT(department_id > 2 AND department_id < 4) OR salary > 80000;

#13.模糊查询
#查询员工姓名中包含字母r的员工信息
SELECT *
FROM employees
WHERE first_name LIKE '%r%';
#查询员工姓名中第三个字母为c第5个字母为a的员工姓名和工资
SELECT CONCAT(first_name,last_name) AS 姓名, salary AS 工资
FROM employees
WHERE first_name LIKE '__c_a%';
#查询员工姓名中带下划线的员工信息
SELECT *
FROM employees
WHERE first_name LIKE '_\_%';
SELECT *
FROM employees
WHERE first_name LIKE '_$_%' ESCAPE '$';

#BETWEEN AND
#查询员工编号在2到4的员工信息
#1. AND
SELECT *
FROM employees
WHERE department_id >=2 AND department_id <=4;
#2.BETWEEN AND
SELECT *
FROM employees
WHERE department_id BETWEEN 2 AND 4;

#模糊查询In关键词
#查询员工job_id是AD_PRES或IT_PROG的员工姓名和job_id
SELECT CONCAT(first_name,last_name), job_id
FROM employees
WHERE job_id = 'AD_PRES' OR job_id='IT_PROG';
SELECT CONCAT(first_name,last_name), job_id
FROM employees
WHERE job_id IN('AD_PRES','IT_PROG');

#is not null模糊查询
#查询有奖金的员工姓名和奖金率
SELECT CONCAT(first_name,last_name), commission_pct
FROM employees
WHERE commission_pct is not NULL;

#安全等于<=>
#查询没有奖金的员工名和奖金率
SELECT first_name, commission_pct
FROM employees
WHERE commission_pct <=> NULL;

#查询没有奖金的员工名和奖金率
SELECT first_name, salary, commission_pct
FROM employees
WHERE salary <=> 50000;

#查询员工编号为1的员工名和年薪
SELECT CONCAT(first_name,last_name) AS 姓名, salary*12*(1+commission_pct) AS 年薪
FROM employees
WHERE employee_id = 1;

#查询没有奖金且工资小于40000的员工名和薪资
SELECT first_name, salary
FROM employees
WHERE commission_pct
is NULL AND salary < 40000;

#IFNULL函数
SELECT IFNULL(commission_pct,0)
FROM employees;

#ISNULL
SELECT ISNULL(commission_pct), commission_pct
FROM employees;

