-- une base de donnees "villesdefrance" avec 2 tables "villes_france_free" et "departement" 

-- Obtenir la liste des 10 villes les plus peuplées en 2012
SELECT ville_nom, ville_population_2012 FROM villes_france_free ORDER BY ville_population_2012 DESC LIMIT 10;

-- Obtenir la liste des 50 villes ayant la plus faible superficie 
SELECT ville_nom, ville_surface FROM villes_france_free ORDER BY ville_surface ASC LIMIT 50;

-- Obtenir la liste des départements d’outres-mer, c’est-à-dire ceux dont le numéro de département commencent par “97”
SELECT departement_code FROM departement WHERE departement_code LIKE '97%';

-- Obtenir le nom des 10 villes les plus peuplées en 2012, ainsi que le nom du département associé
SELECT ville_nom, ville_population_2012, departement_nom FROM villes_france_free, departement WHERE ville_departement = departement_code ORDER BY ville_population_2012 DESC LIMIT 10


-- Obtenir la liste du nom de chaque département, associé à son code et du nombre de commune au sein de ces département, en triant afin d’obtenir en priorité les départements qui possèdent le plus de communes
SELECT departement_nom, departement_code, COUNT(ville_departement) AS ville_departement FROM departement, villes_france_free WHERE departement_code = ville_departement GROUP BY departement_code ORDER BY ville_departement DESC LIMIT 10;

-- Obtenir la liste des 10 plus grands départements, en terme de superficie en utilisant les superficies des villes dans ces départements
SELECT departement_nom, departement_code, SUM(ville_surface) AS ville_surface FROM departement, villes_france_free WHERE departement_code = ville_departement GROUP BY departement_code ORDER BY ville_surface DESC LIMIT   10;