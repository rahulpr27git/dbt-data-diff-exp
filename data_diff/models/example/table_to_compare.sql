{{ config(
materialized='table'
 ) }}
select id, first_name, last_name, email, gender from employee
