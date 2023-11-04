# ProjetXML

python3 treexsd.py nodes.csv links.csv > FICHIERXML.xml

Pour le projet:
   python -> FICHIERXML.xml -> tranformation.xsl -> trnbgauche.xsl -> transformation5.xsl -> transformationsvg.xsl -> fichier.svg

    java -jar saxon-he-10.3.jar -s:FICHIERXML -xsl:transformation.xsl (-o: fichier.xml)


Utilisatation de l'element number avec any

    transformation.xsl -> 


transformation.xsl : fait des noeuds dans des noeuds
trnbgauche.xsl : ajoute les numerotation de feuilles et renome l'element en leaf


transformation4 + trnbgauche = transformation5 
Projet XML 2023