SELECT
'INSERT INTO regioes (id_regiao, nome) VALUES ('||REGION_ID||','||''''||REGION_NAME||''''||');'
FROM REGIONS;

-- comando para gerar as informacoes da tabela regioes ja prontas para serem inseridas no postgres


SELECT
'INSERT INTO paises (id_pais, nome, id_regiao) VALUES ('||''''||COUNTRY_ID||''''||','||''''||COUNTRY_NAME||''''||','||REGION_ID||');'
FROM COUNTRIES;

-- comando para gerar as informacoes da tabela paises ja prontas para serem inseridas no postgres


SELECT
'INSERT INTO localizacoes (id_localizacao, endereco, cep, cidade, uf, id_pais) VALUES ('||LOCATION_ID||','||''''||STREET_ADDRESS||''''||','||''''||POSTAL_CODE||''''||','||''''||CITY||''''||','||''''||STATE_PROVINCE||''''||','||''''||COUNTRY_ID||''''||');'
FROM LOCATIONS;

-- comando para gerar as informacoes da tabela localizacoes ja prontas para serem inseridas no postgres

SELECT
'INSERT INTO departamentos (id_departamento, nome, id_localizacao, id_gerente) VALUES ('||DEPARTMENT_ID||','||''''||DEPARTMENT_NAME||''''||','||''''||LOCATION_ID||''''||','||'NULL'||');'
FROM DEPARTMENTS;

-- comando para gerar as informacoes da tabela departamentos ja prontas para serem inseridas no postgres

SELECT
'INSERT INTO cargos (id_empregado, , salario_minimo, salario_maximo) VALUES ('||''''||JOB_ID||''''||','||''''||JOB_TITLE||''''||','||MIN_SALARY||','||MAX_SALARY||');'
FROM JOBS;

-- comando para gerar as informacoes da tabela cargos ja prontas para serem inseridas no postgres

SELECT
'INSERT INTO empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(' || employee_id || ', ''' || first_name || ' ' ||
last_name || ''', ''' || email || ''', ''' ||
phone_number || ''', ''' ||
TO_CHAR(hire_date, 'YYYY-MM-DD') || ', ''' ||
job_id || ''', ' || salary || ', ' ||
NVL(TO_CHAR(commission_pct), 'null') || ', ' ||
NVL(TO_CHAR(manager_id), 'null') || ', ' ||
NVL(TO_CHAR(department_id), 'null') || ');'
FROM employees;

-- comando para gerar as informacoes da tabela empregados ja prontas para serem inseridas no postgres

SELECT
'INSERT INTO historico_cargos (id_empregado, data_inicial, data_final, id_cargo, id_departamento) VALUES ('||EMPLOYEE_ID||','||''''||TO_CHAR(START_DATE, 'YYYY-MM-DD')||''''||','||''''||TO_CHAR(END_DATE, 'YYYY-MM-DD')||''''||','||''''||JOB_ID||''''||','||DEPARTMENT_ID||');'
FROM JOB_HISTORY;

-- comando para gerar as informacoes da tabela historico_cargos ja prontas para serem inseridas no postgres

SELECT
'UPDATE departamentos SET id_gerente='||MANAGER_ID||' WHERE id_departamento='||DEPARTMENT_ID||';'
FROM DEPARTMENTS WHERE MANAGER_ID IS NOT NULL;

-- comando para gerar as informacoes da tabela departamento ja prontas para serem atualizadas no postgres

