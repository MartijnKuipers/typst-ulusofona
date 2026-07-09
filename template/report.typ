/*
 * Universidade Lusófona Template — lab report (ulreport)
 *
 * Thin wrapper around the shared engine in core.typ. Fixes the report-
 * specific vocabulary (Unidade Curricular, Professor de UC, Grupo) and
 * front matter (no acknowledgements/abstracts/lists of figures & tables,
 * glossary moved to the back of the document). See core.typ for shared
 * layout/styling and thesis.typ for the thesis counterpart (ulthesis).
 *
 * Adapted by: Martijn Kuipers (martijn.kuipers@ulusofona.pt)
 */

#import "core.typ": *

#let ulreport(
  title: "",
  type: "Relatório de Laboratório",
  subtitle: "",
  date: "",
  authors: (),
  course-unit: "",
  group: "",
  professors: (),
  external: "",
  external-label: "Entidade Externa",
  department: "Departamento de Engenharia Informática e Sistemas de Informação",
  paper-size: "a4",
  logo: none,
  cover: image("cover_image.jpg"),
  image-index: none,
  body,
  main-color: black,
  lang: "pt",
  list-of-acronyms: true,
  glossary-yaml-file: none,
  glossary-unused: false,
  supplement-chapter: "Capítulo",
  supplement-part: "Parte",
  toc-depth: 2,
  font-size: 10pt,
  part-style: 0,
  lowercase-references: false) = uldocument(
    title: title,
    type: type,
    subtype: "",
    subtitle: subtitle,
    date: date,
    authors: authors,
    supervisors: professors,
    supervisor-label: "Professor de UC",
    cosupervisor-label: "Professor de UC",
    course-unit: course-unit,
    group: group,
    external: external,
    external-label: external-label,
    department: department,
    paper-size: paper-size,
    logo: logo,
    cover: cover,
    image-index: image-index,
    main-color: main-color,
    lang: lang,
    list-of-figures: false,
    list-of-tables: false,
    list-of-acronyms: list-of-acronyms,
    glossary-yaml-file: glossary-yaml-file,
    glossary-unused: glossary-unused,
    glossary-position: "back",
    acknowledgements: none,
    abstract_en: none,
    abstract_pt: none,
    copyright-phrase: "este relatório",
    supplement-chapter: supplement-chapter,
    supplement-part: supplement-part,
    toc-depth: toc-depth,
    font-size: font-size,
    part-style: part-style,
    lowercase-references: lowercase-references,
    body,
  )
