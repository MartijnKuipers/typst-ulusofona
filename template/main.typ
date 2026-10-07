// Example TFC (Trabalho Final de Curso) report, pre-filled with the
// official DEISI guidance text. Replace the guidance in each chapter
// (chapters/capitulo_0*.typ) with your own content, and delete the
// sections that do not apply. Other examples (generic thesis, lab
// report) are in examples/.
#import "@preview/mkuipers-ulusofona:0.3.2": *

#show: ulthesis.with(
  title: "Título do Trabalho",
  type: "Trabalho Final de Curso",
  subtype: "Relatório Intercalar 1º Semestre",
  date: "Janeiro 2026",
  authors: (
    (name: "Nome do Aluno", number: "p0000", course: "LEI"),
    (name: "Nome do Aluno", number: "p0000", course: "LEI"),
  ),
  supervisors: ("Nome do Orientador", "Nome do Co-orientador"),
  external: "Nome da Entidade Externa",  // Remove if there is no external entity
  lang: "pt",
  toc-depth: 2,
  glossary-data: yaml("glossary.yaml"),
  glossary-unused: true,  // Show every glossary entry; remove to list only the ones used
  acknowledgements: [
    Agradecimentos.
  ],
  abstract-pt: [
    O resumo tem no máximo uma página. Pode ter como base a descrição da
    proposta de TFC disponível na plataforma.

    *Palavras-chave:* palavra 1, palavra 2, palavra 3
  ],
  abstract-en: [
    Abstract in English.

    *Keywords:* keyword 1, keyword 2, keyword 3
  ],
)

// Chapters
#include("chapters/capitulo_01.typ")
#include("chapters/capitulo_02.typ")
#include("chapters/capitulo_03.typ")
#include("chapters/capitulo_04.typ")
#include("chapters/capitulo_05.typ")
#include("chapters/capitulo_06.typ")
#include("chapters/capitulo_07.typ")
#include("chapters/capitulo_08.typ")

// Aftermatter
#my-bibliography(bibliography("bibliography.yaml"))

#show: appendices.with("Anexo")

#chapter("Guião de Testes")

Incluir aqui o guião detalhado de testes, com descrição de cenários e resultados.
