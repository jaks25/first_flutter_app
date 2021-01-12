import 'package:flutter/material.dart';
List<Map> symptomsName =[
  {
    "code": 		  "B",
    "name":       "Biegunka"
  },
  {
    "code": 		  "C",
    "name":       "śwąd"
  },
  {
    "code": 		  "D",
    "name":       "Obrzęk ucha"
  },
];

List<Map> symptomTests = [
  {
    "symptom": 		  "B",
    "id":			      1,
    "description": 	"Biegunka",
    "task":			    "",
    "optionA":      "",
    "optionB":		  "",
    "optionANode":	"",
    "optionBNode":	"",
    "step": 		    "",
    "parent": 		  1
  },
  {
    "symptom": 		  "B",
    "id":			      2,
    "description": 	"Biegunka",
    "task":			    "",
    "question":     "W jakim wieku jest pacjent?",
    "optionA":      ">12 msc",
    "optionB":		  "<12 msc",
    "optionANode":	"3",
    "optionBNode":	"",
    "result": 		  "",
    "parent": 		  1
  },
  {
    "symptom": 		  "B",
    "id":			      3,
    "description": 	"Biegunka",
    "task":			    "",
    "question":		  "Czy pacjent był odrobaczany?",
    "optionA":		  "Tak",
    "optionB":		  "Nie",
    "optionANode":	"4",
    "optionBNode":	"",
    "result": 		  "",
    "parent": 		  2,
  },
  {
    "symptom": 		  "B",
    "id":			      4,
    "description": 	"Biegunka",
    "task":			    "",
    "question":	    "Czy wykonano badanie kału?",
    "optionA":	    "Tak",
    "optionB":	    "Nie",
    "optionANode":	"5",
    "optionBNode":	"6",
    "result": 		  "",
    "parent": 		  3,
  },
  {
    "symptom": 		  "B",
    "id":			      5,
    "description": 	"Biegunka",
    "task":			    "Wykonaj lub zleć badania kału.",
    "question":		  "",
    "optionA":		  "",
    "optionB":		  "",
    "optionANode":	"",
    "optionBNode":	"",
    "result": 		  "",
    "parent": 		  4,
  },

  {
    "symptom": 		  "B",
    "id":			      6,
    "description": 	"Biegunka",
    "task":			    "",
    "question":		  "Czy pacjent był szczepiony przeciwko chorobom zakaźnym?",
    "optionA":		  "Tak",
    "optionB":		  "Nie",
    "optionANode":	"",
    "optionBNode":	"7",
    "result": 		  "",
    "parent": 		  4,
  },
  {
    "symptom": 		  "B",
    "id":			      7,
    "description": 	"Biegunka",
    "task":			    "Wykonaj test przeciwko parwowirozie.",
    "question":		  "",
    "optionA":		  "",
    "optionB":		  "",
    "optionANode":	"",
    "optionBNode":	"",
    "result": 		  "",
    "parent": 		  6,
  }
];