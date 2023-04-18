


/************************************************************************************************************************************* */
/*************************************************** EXERCICE SQL : LA BASE EXEMPLE (part.2) ******************************************/
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

SELECT emp.nom, emp.salaire, patron.nom, patron.salaire 
FROM employe AS emp
JOIN employe AS patron on emp.nosup = patron.noemp
where emp.salaire > patron.salaire; 

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

select nom, titre from employe where nodep = 31 and titre in (select titre from employe where nodep = 32);

-- 9. Rechercher le nom et le titre des employés du service 31 qui ont un
-- titre que l'on ne trouve pas dans le département 32.

select nom, titre from employe where nodep = 31 and titre not in (select titre from employe where nodep = 32);

-- 10. Rechercher le nom, le titre et le salaire des employés qui ont le même
-- titre et le même salaire que Fairant.

select nom, titre, salaire from employe where titre in (select titre from employe where nom = "fairent") 
and (select salaire from employe where nom = "fairent");

-- 11. Rechercher le numéro de département, le nom du département, le
-- nom des employés, en affichant aussi les départements dans lesquels
-- il n'y a personne, classés par numéro de département.

select nodep as département, dept.nom as section, employe.nom as employe from employe left join dept on nodept = noemp
order by nodep asc;

/***************** Les groupes ******************/

-- 1. Calculer le nombre d'employés de chaque titre.

select count(*) as nbr_employés, titre from employe group by titre;

-- 2. Calculer la moyenne des salaires et leur somme, par région.

SELECT nodep, avg(salaire) AS moyenne_salaire, sum(salaire) AS somme_salaire from employe GROUP BY nodep;

/******************* Clause having **************/

-- 3. Afficher les numéros des départements ayant au moins 3 employés.

select nodep, count(*) as nbr_empl from employe group by nodemp having count(*) >= 3;

-- 4. Afficher les lettres qui sont l'initiale d'au moins trois employés.

select nom, count(*) from employe where SUBSTR(nom,1,1) GROUP BY nom having COUNT(*) >= 3;

-- 5. Rechercher le salaire maximum et le salaire minimum parmi tous les salariés et l'écart entre les deux.

select min(salaire), max(salaire), (max(salaire) - min(salaire)) AS diff from employe;

-- 6. Rechercher le nombre de titres différents

select COUNT(DISTINCT titre) AS nbr_titres FROM employe;

-- 7. Pour chaque titre, compter le nombre d'employés possédant ce titre.

select titre, COUNT(titre) AS nbr_employes FROM employe GROUP by titre;

-- 8. Pour chaque nom de département, afficher le nom du département et le nombre d'employés.

SELECT nodep, COUNT(noemp) AS nbr_employes, titre FROM employe GROUP by nodep;

-- 9. Rechercher les titres et la moyenne des salaires par titre dont la moyenne est supérieure à la moyenne des salaires des Représentants.

SELECT titre, avg(salaire) as moy_sal 
FROM employe 
GROUP BY titre
having AVG(salaire) > 
(SELECT avg(salaire) from employe WHERE titre = "représentant");

-- 10.Rechercher le nombre de salaires renseignés et le nombre de taux de commission renseignés.

select count(salaire), count(tauxcom) FROM employe WHERE salaire is not NULL AND tauxcom IS not null;

