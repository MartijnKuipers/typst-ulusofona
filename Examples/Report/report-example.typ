#import "../../template/report.typ": *

#show: ulreport.with(
  title: "Relatório de Laboratório 3",
  subtitle: "Medição de Tempos de Resposta",
  date: "Maio 2025",
  authors: ((name:"Goro Akechi", number: "p8094", course: "LIG"), (name: "Flavio Barisi", number: "p8095", course: "LIG")),
  course-unit: "Sistemas Operativos",
  group: "3",
  professors: ("Daniel Silveira",),
  //department: "Departamento de Engenharia Informática e Sistemas de Informação",
  glossary-yaml-file: "Examples/Report/sample-glossary.yaml",  // Path is relative to the repo root (see readme) — set to none if you don't want a glossary
  glossary-unused: true,      // Show every glossary entry, not just the ones used below
)

// Chapters
#include("chapters/showcase.typ")


// Aftermatter

#my-bibliography( bibliography("sample.yaml"))

#show: appendices.with("Anexos")

#chapter("Anexo com Dados Brutos")

== Tabela de Medições

#lorem(50)
