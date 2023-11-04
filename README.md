# ProjetXML

Première commande pour transformer les fichiers csv en XML : 
    
    python3 treexsd.py nodes.csv links.csv > FICHIERXML.xml

Suite des transformation à faire:

    python -> FICHIERXML.xml -> tranformation.xsl -> trnbgauche.xsl -> transformation5.xsl -> transformationsvg.xsl -> fichier.svg

Pour lancer une transformation faire : (ne pas oublier la sortie)

    java -jar saxon-he-10.3.jar -s:FICHIERXML -xsl:transformation.xsl (-o: fichier.xml)


transformation.xsl : fait des noeuds dans des noeuds
trnbgauche.xsl : ajoute les numerotation de feuilles et renome l'element en leaf


transformation4 + trnbgauche = transformation5 
Projet XML 2023