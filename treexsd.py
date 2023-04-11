import sys
import csv


def main() :
	if(len(sys.argv)<=2):
		print("python3 <file1> <file2>")
		return;
	names = dict()
	links = dict()
	with open(sys.argv[1],"r",newline='') as csvnodes:
		reader = csv.reader(csvnodes,delimiter=',')
		reader.__next__()
		for line in reader:
			readline_node(line,names,links)
	with open(sys.argv[2],"r",newline='') as csvlinks:
		reader = csv.reader(csvlinks,delimiter=',')
		reader.__next__()
		for line in reader:
			readline_link(line,links)
	affiche_xml(names,links)

def readline_node(line,names,links):
	id = int(line[0])
	names[id] = line[1]
	links[id] = []

def readline_link(line,edges):
	idsrc = int(line[0])
	iddest = int(line[1])
	edges[idsrc].append(iddest)
	'''
	if (idsrc in edges) and (iddest in edges):
		edges[idsrc].append(iddest)
	else:
		print("ERREUR")
	'''
	
def affiche_xml(names,links):
	print('<?xml version="1.0" encoding="utf-8"?>')
	print("<tree>")
	for id,name in names.items():
		print('\t<node id="'+str(id)+'" name="'+name+'">')
		for child in links[id]:
			print("\t\t<child idref=\""+str(child)+"\"/>")
		print("\t</node>")
	print("</tree>")
main()
