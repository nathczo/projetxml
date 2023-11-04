#! /usr/bin/env python3

import sys
import csv

#MAIN
def main() :
	if(len(sys.argv)!=3):
		print("python3 <file1> <file2>")
		return;
	print('<?xml version="1.0" encoding="utf-8"?>')
	print("<tree","xsi:noNamespaceSchemaLocation='tree.xsd' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance'>")
	print("\t<nodes>")
	readcsvfile(sys.argv[1],"node")
	print("\t</nodes>")
	print("\t<links>")
	readcsvfile(sys.argv[2],"link")
	print("\t</links>")
	print("</tree>")

def readcsvfile(namefile,namebalise):
	with open(namefile,"r",newline='') as csvfile:
		reader = csv.reader(csvfile,delimiter=',')
		init = False
		names = []
		for line in reader:
			if(not init) : 
				names=list(line)
				init=True
			else : print("\t\t<"+namebalise,attribut_list(names,line),'/>')

def attribut_list(names,line):
	res = ""
	for a,b in zip(names,line) :
		if a=="node_id" or a=="source_node_id" or a=="target_node_id" :
			res+= str(a)+'="id'+str(b)+'" '
		else : res+= str(a)+'="'+str(b)+'" '
	return res
main()
