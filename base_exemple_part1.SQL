/************************************************************************************************************************************* */
/*************************************************** EXERCICE SQL : LA BASE EXEMPLE *******************************************************/
/*********************************************************************************************************************************** */

<!-- 1. Afficher toutes les informations concernant les employés. -->

select * from employe;

<!-- 2. Afficher toutes les informations concernant les départements. -->

select * from dept;

<!-- 3. Afficher le nom, la date d'embauche, le numéro du supérieur, le numéro de département et le salaire de tous les employés. -->

select nom, dateemb, nosup, nodep, salaire from employe;

<!-- 4. Afficher le titre de tous les employés. -->

select titre from employe;

<!-- 5. Afficher les différentes valeurs des titres des employés. -->

select distinct titre from employe;

<!-- 6. Afficher le nom, le numéro d'employé et le numéro du département des employés dont le titre est «Secrétaire». -->

select nom, noemp, nodep from employe where titre = "secrétaire";

<!-- 7. Afficher le nom et le numéro de département dont le numéro de département est supérieur à 40. -->

select nom, nodept from dept where nodept > 40;

<!-- 8. Afficher le nom et le prénom des employés dont le nom est alphabétiquement antérieur au prénom. -->

select nom, prenom from employe group by nom asc;

-- 9. Afficher le nom, le salaire et le numéro du département des employés
-- dont le titre est « Représentant », le numéro de département est 35 et
-- le salaire est supérieur à 20000. 

select nom, salaire, nodep from employe where titre = "représentant" and nodep = 35 and salaire > 20000;

<!-- Afficher le nom, le titre et le salaire des employés dont le titre est Représentant» ou dont le titre est «Président». -->

select nom, titre, salaire from employe where titre = "représentant" or titre = "président";

-- Afficher le nom, le titre, le numéro de département, le salaire des
-- employés du département 34, dont le titre est « Représentant » ou
-- « Secrétaire » 

SELECT nom, titre, salaire,nodep FROM employe WHERE nodep = 34  AND ( titre ="représentant" OR titre="secrétaire");

<!-- Afficher le nom, et le salaire des employés dont le salaire est compris entre 20000 et 30000. -->

select nom, salaire from employe where salaire >= 20000 and salaire <= 30000;

<!-- Afficher le nom des employés commençant par la lettre «H». -->

select nom from employe where substr(nom,1,1) = "H";

<!-- Afficher le nom des employés se terminant par la lettre «n». -->

select nom from employe where right(nom,1) = "n";

<!-- Afficher le nom des employés contenant la lettre «u» en 3ème position. -->

select nom from employe where substr(nom,3,1) = "u";

<!-- Afficher le salaire et le nom des employés du service 41 classés par salaire décroissant. -->

select salaire from employe where nodep = 41 group by salaire DESC;

<!-- Afficher le titre, le salaire et le nom des employés classés par titre croissant et par salaire décroissant. -->

select titre, salaire, nom from employe group by titre ASC, salaire DESC;

<!-- Afficher le taux de commission, le salaire et le nom des employés classés par taux de commission croissante. -->

select tauxcom, salaire, nom from employe group by tauxcom asc;

<!-- Afficher le nom, le salaire, le taux de commission et le titre des employés dont le taux de commission n'est pas renseigné. -->

select nom, salaire, tauxcom, titre from employe where tauxcom is null;

<!-- Afficher le nom, le salaire, le taux de commission et le titre des employés dont le taux de commission est renseigné. -->

select nom, salaire, tauxcom, titre from employe where tauxcom is not null; 

<!-- Afficher le nom, le salaire, le taux de commission, le titre des employés dont le taux de commission est inférieur à 15. -->

select nom, salaire, tauxcom, titre from employe where tauxcom < 15;

<!-- Afficher le nom, le salaire, le taux de commission, le titre des employés dont le taux de commission est supérieur à 15. -->

select nom, salaire, tauxcom, titre from employe where tauxcom > 15;

<!-- Afficher le nom, le salaire, le taux de commission et la commission des employés dont le taux de commission n'est pas nul.
(la commission est calculée en multipliant le salaire par le taux de commission) -->

select nom, salaire, titre, tauxcom, (salaire * tauxcom) as com from employe where tauxcom is not NULL GROUP BY nom; 

<!-- afficher le nom, le salaire, le taux de commission, la commission des employés dont le taux de commission n'est pas nul, classé par taux de commission croissant -->

select nom, salaire, titre, tauxcom, (salaire * tauxcom) as com from employe where tauxcom is not NULL GROUP BY tauxcom asc; 

<!-- Afficher le nom et le prénom (concaténés) des employés. Renommer les colonnes -->

select CONCAT (nom," ",prenom) from employe;

<!-- Afficher les 5 premières lettres du nom des employés. -->

select substring(nom, 1, 5) from employe;

<!-- 30. Afficher le nom et le rang de la lettre « r » dans le nom des employés. -->

select locate("r", nom) from employe;

<!-- 31. Afficher le nom, le nom en majuscule et le nom en minuscule de l'employé dont le nom est Vrante -->

select nom, UPPER(nom), Lower(nom) from employe where nom = "vrante";

<!-- Afficher le nom et le nombre de caractères du nom des employés. -->

select nom, length(nom) from employe;









