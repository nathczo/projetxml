# PROJET XML - (2022-2023)
COZZO Nathan / Mehmet YALCIN


## Commandes
* `./tree.py nodes.csv links.csv > fichier.xml` pour lancer le script python avec les fichier links.csv et nodes.csv en parametre
* `java -jar saxon-he-10.3.jar -s:fichier.xml -xsl:transformation.xsl -o:out.xml`

Pour la representation graphique, on peut changer la taille du document : 
	- rectangulaire ajouter à la fin de la commande ?width=expr et ?height=expr
	- circulaire ajouter à la fin ?documentSize=expr  


Il faut faire les transformations 1 par 1. On avait pensé à un makefile pour automatiser.
La suite des transformations à faire est expliqué dans le rapport


