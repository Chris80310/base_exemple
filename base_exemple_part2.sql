/************************************************************************************************************************************* */
/*************************************************** EXERCICE SQL : LA BASE EXEMPLE (part.2) *******************************************************/
/*********************************************************************************************************************************** */

-- 1. Rechercher le prénom des employés et le numéro de la région de leur
-- département.

SELECT employe.prenom, noregion FROM employe JOIN dept ON nodep = nodept;

-- 2. Rechercher le numéro du département, le nom du département, le
-- nom des employés classés par numéro de département (renommer les
-- tables utilisées)

SELECT nodep AS "num_département", dept.nom AS "section", employe.nom AS "employés" FROM employe JOIN dept ON nodep = nodept ORDER BY nodep;

-- 3. Rechercher le nom des employés du département Distribution.

SELECT employe.nom FROM employe JOIN dept ON nodep = nodept WHERE dept.nom = "distribution";

-- 4. Rechercher le nom et le salaire des employés qui gagnent plus que
-- leur patron, et le nom et le salaire de leur patron.

SELECT distinct t1.nom AS employé, t1.nosup AS rang, t1.salaire 
FROM employe AS t1 
LEFT OUTER JOIN employe AS t2 ON t2.nodep = t1.nodep
GROUP BY t1.nosup asc;

-- 5.Rechercher le nom et le titre des employés qui ont le même titre que
-- Amartakaldire.

SELECT * FROM employe WHERE titre IN (SELECT titre FROM employe WHERE nom = "amartakaldire");

-- 6. Rechercher le nom, le salaire et le numéro de département des
-- employés qui gagnent plus qu'un seul employé du département 31,
-- classés par numéro de département et salaire.

SELECT nom, salaire, nodep FROM employe
WHERE salaire > (SELECT MIN(salaire) FROM employe WHERE nodep = 31)
order BY salaire desc, nodep;

-- 7. Rechercher le nom, le salaire et le numéro de département des
-- employés qui gagnent plus que tous les employés du département 31,
-- classés par numéro de département et salaire.

SELECT nom, salaire, nodep FROM employe
WHERE salaire > ANY (SELECT salaire FROM employe WHERE nodep = 31)
order BY salaire desc, nodep;

-- 8. Rechercher le nom et le titre des employés du service 31 qui ont un
-- titre que l'on trouve dans le département 32.

