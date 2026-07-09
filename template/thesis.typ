/*
 * Universidade Lusófona Template — thesis (ulthesis)
 *
 * Thin wrapper around the shared engine in core.typ. Fixes the thesis-
 * specific vocabulary (Orientador/Co-orientador, "dissertação") and front
 * matter (acknowledgements, abstracts, lists of figures/tables, glossary
 * up front). See core.typ for shared layout/styling and report.typ for the
 * lab-report counterpart (ulreport).
 *
 * Adapted by: Martijn Kuipers (martijn.kuipers@ulusofona.pt)
 */

#import "core.typ": *

#let ulthesis(
  title: "",
  type: "",
  subtype: "",
  subtitle: "",
  date: "",
  authors: (),
  supervisors: (),
  external: "",
  department: "Departamento de Engenharia Informática e Sistemas de Informação",
  paper-size: "a4",
  logo: none,
  cover: image("cover_image.jpg"),
  image-index: none,
  body,
  main-color: black,
  lang: "en",
  list-of-figures: true,
  list-of-tables: true,
  list-of-acronyms: true,
  glossary-yaml-file: none,
  glossary-unused: false,
  acknowledgements: none,
  abstract_en: none,
  abstract_pt: none,
  supplement-chapter: "Chapter",
  supplement-part: "Part",
  toc-depth: 2,
  font-size: 10pt,
  part-style: 0,
  lowercase-references: false) = uldocument(
    title: title,
    type: type,
    subtype: subtype,
    subtitle: subtitle,
    date: date,
    authors: authors,
    supervisors: supervisors,
    supervisor-label: "Orientador",
    cosupervisor-label: "Co-orientador",
    external: external,
    external-label: "Entidade Externa",
    department: department,
    paper-size: paper-size,
    logo: logo,
    cover: cover,
    image-index: image-index,
    main-color: main-color,
    lang: lang,
    list-of-figures: list-of-figures,
    list-of-tables: list-of-tables,
    list-of-acronyms: list-of-acronyms,
    glossary-yaml-file: glossary-yaml-file,
    glossary-unused: glossary-unused,
    glossary-position: "front",
    acknowledgements: acknowledgements,
    abstract_en: abstract_en,
    abstract_pt: abstract_pt,
    copyright-phrase: "esta dissertação",
    supplement-chapter: supplement-chapter,
    supplement-part: supplement-part,
    toc-depth: toc-depth,
    font-size: font-size,
    part-style: part-style,
    lowercase-references: lowercase-references,
    body,
  )
