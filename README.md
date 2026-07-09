# Universidade Lusófona Typst Template

This is a Typst template for academic documents at **Universidade Lusófona**, adapted from the excellent *orange-book* template and customized for Lusófona's formatting standards. It ships two document types that share almost all of their code:

- **`ulthesis`** (`template/thesis.typ`) — theses and dissertations.
- **`ulreport`** (`template/report.typ`) — lab/course reports.

Developed by:  Martijn Kuipers (martijn.kuipers@ulusofona.pt)

---

## What This Template Provides

- Thesis and lab-report styles for Universidade Lusófona
- Automatic generation of:
  - Cover page
  - Table of contents
  - List of figures, tables, glossary
  - Appendices and bibliography
- Built-in support for:
  - Figure/table formatting and captions
  - Theorem environments (`theorem`, `definition`, `example`, etc.)

## Shared architecture

Both document types are thin wrappers around a shared engine, `uldocument(...)`, defined in `template/core.typ`. That file holds everything document-type-agnostic: page layout, header/footer, heading styles, the cover-page scaffold, theorem environments, outline/glossary machinery, etc. `thesis.typ` and `report.typ` each just call `uldocument` with different label defaults (e.g. "Orientador" vs. "Professor de UC") and a different front-matter layout (which sections appear, and whether the glossary prints up front or at the back).

**In practice: edit `core.typ` for anything that should apply to both thesis and report (layout, styling, page numbering, theorem boxes); edit `thesis.typ` or `report.typ` only for document-type-specific wording or front-matter ordering.**


## Usage: `ulthesis(...)` Options

The `ulthesis(...)` function wraps your entire document. All main content should go inside its `body` parameter.

```typst
#ulthesis(
  title: "My Thesis Title",
  subtitle: "Optional Subtitle",
  type: "Dissertação de Mestrado",
  subtype: "Engenharia Informática",
  date: "2025",
  authors: [(
    name: "João Silva",
    number: "20201234",
    course: "Engenharia Informática"
  )],
  supervisors: [
    "Prof. Doutor Nome do Orientador",
    "Prof. Doutor Nome do Co-orientador"
  ],
  external: "Empresa XYZ", // Optional
  acknowledgements: [Acknowledgement text here],
  abstract: [Abstract in English],
  abstract_pt: [Resumo em Português],
  image-index: image("example.png"),
  glossary-yaml-file: "glossary.yaml",
  list-of-figures: true,
  list-of-tables: true,
  list-of-acronyms: true,
  lowercase-references: false,
  lang: "pt"
  ]
)
```

| Parameter              | Description                                                    |
| ---------------------- | -------------------------------------------------------------- |
| `title`                | Main title of the thesis                                       |
| `subtitle`             | Optional subtitle                                              |
| `type`                 | Thesis type, e.g. "Dissertação de Mestrado"                    |
| `subtype`              | Field of study or course name                                  |
| `date`                 | Date to be displayed on the cover page                                                           |
| `authors`              | List of authors: name, number, course                          |
| `supervisors`          | List of supervisors and co-supervisors                          |
| `external`             | Optional external entity (e.g., company)                       |
| `department`           | The department, default: "Departamento de Engenharia Informática e Sistemas de Informação" |
| `acknowledgements`     | Acknowledgements content                                       |
| `abstract`             | Abstract (English)                                             |
| `abstract_pt`          | Resumo (Portuguese)                                            |
| `glossary-yaml-file`   | Path to YAML glossary file, relative to the **project root** (the folder containing `template/`) — not relative to `main.typ` or wherever `ulthesis(...)` is called from. See the note below. |
| `list-of-figures`      | Show list of figures (default: true)                           |
| `list-of-tables`       | Show list of tables (default: true)                            |
| `list-of-acronyms`     | Show glossary/acronyms section                                 |
| `lang`                 | Document language: `"pt"` or `"en"`                            |

---

## Usage: `ulreport(...)` Options

The `ulreport(...)` function is for lab/course reports. It reuses the same cover-page layout, page numbering, theorem environments, and outline machinery as `ulthesis`, but:

- Adds `course-unit` (Unidade Curricular) and `group` fields on the cover page.
- Replaces "Orientador/Co-orientador" with "Professor de UC" (via the `professors` parameter, in place of `supervisors`).
- Drops acknowledgements, abstracts, and the lists of figures/tables from the front matter (there's simply no parameter for them — pass the content you want directly in `body` if you need something similar).
- Moves the glossary to the very end of the document (after the bibliography and appendices), instead of the front matter.

```typst
#import "template/report.typ": *

#show: ulreport.with(
  title: "Relatório de Laboratório 3",
  subtitle: "Optional Subtitle",
  date: "2025",
  authors: ((name: "João Silva", number: "20201234", course: "Engenharia Informática"),),
  course-unit: "Sistemas Operativos",
  group: "3",
  professors: ("Prof. Doutor Nome do Professor",),
  glossary-yaml-file: "glossary.yaml",
  lang: "pt",
)
```

| Parameter              | Description                                                    |
| ---------------------- | -------------------------------------------------------------- |
| `title`                | Main title of the report                                       |
| `subtitle`             | Optional subtitle                                              |
| `type`                 | Report type, default: "Relatório de Laboratório"                |
| `date`                 | Date to be displayed on the cover page                          |
| `authors`              | List of authors: name, number, course                          |
| `course-unit`          | Unidade Curricular name, shown on the cover page                |
| `group`                | Group name/number, shown on the cover page                      |
| `professors`           | List of course-unit professors (labeled "Professor de UC")      |
| `external`             | Optional external entity (e.g., company)                       |
| `department`           | The department, default: "Departamento de Engenharia Informática e Sistemas de Informação" |
| `glossary-yaml-file`   | Path to YAML glossary file, relative to the **project root** (see note below); printed at the end of the document |
| `list-of-acronyms`     | Show glossary/acronyms section                                 |
| `lang`                 | Document language: `"pt"` or `"en"` (default: `"pt"`)          |

> **Note on `glossary-yaml-file`:** unlike `bibliography(...)` (a plain Typst path resolved relative to the file that calls it), this path is read internally by `core.typ`, so it's always relative to the project root, regardless of where your `main.typ`/entry file lives. If your project root and your entry file's folder are the same (the usual "Recommended Workspace Setup" below), just use a bare filename like `"glossary.yaml"`. The bundled examples pass `"Examples/Thesis/sample-glossary.yaml"` / `"Examples/Report/sample-glossary.yaml"` for exactly this reason — their entry files sit two folders below the project root.

See `Examples/Report/report-example.typ` for a full working example.

---

## Examples

Two ready-to-compile projects live under `Examples/`, each its own self-contained folder:

| Folder                | Entry point | Document type | Demonstrates |
| ---------------------- | ----------- | -------------- | ------------ |
| `Examples/Thesis/`      | `thesis-example.typ`   | `ulthesis`      | Full thesis structure: cover, acknowledgements, abstracts (PT/EN), lists of figures/tables, front-matter glossary, theorem environments, appendices. |
| `Examples/Report/`      | `report-example.typ`   | `ulreport`      | Lab-report structure: cover with Unidade Curricular/Grupo/Professor de UC, no acknowledgements/abstracts/lists, back-matter glossary. Its one chapter (`chapters/showcase.typ`) demonstrates formulas, images, tables, and a block diagram. |

Each example folder has its own `chapters/` subfolder, but both reuse the single shared `template/` at the repository root — that's the point of the shared-core architecture above: edit `template/core.typ` once and both examples (and your own document) pick up the change.

`chapters/showcase.typ` is the reference for adding common content types to any document built on this template:

- **Formulas** — numbered equations via `$ ... $` blocks with a label (`<eq-foo>`), cross-referenced with `@eq-foo`. Equation numbering (chapter.number) is handled automatically by the template.
- **Images** — `#figure(image("path", width: ...), caption: [...]) <label>`.
- **Tables** — `#figure(table(columns: (...), ...), caption: [...]) <label>`.
- **Block diagrams** — built with the [`fletcher`](https://typst.app/universe/package/fletcher) package (`#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge`). Typst fetches `fletcher` (and its dependency `cetz`) automatically from the Typst Universe the first time you compile — this needs an internet connection once; after that it's cached locally (or always available on typst.app). If you'd rather not depend on an external package, replace the `diagram(...)` call with plain boxes and lines (`box(stroke: 1pt, inset: 8pt)[...]`, `line(...)`).

### Compiling the bundled examples — the `--root` flag

Because each example's entry file lives two folders below the repository root (`Examples/<Name>/<name>-example.typ`) but still imports the shared `template/` folder at the root (`../../template/...`), Typst needs to be told that the **repository root**, not the `Examples/<Name>/` folder, is the project root — otherwise it refuses to read a file above where the entry file sits ("cannot read file outside of project root"). From the repository root, run:

```sh
typst compile --root . Examples/Thesis/thesis-example.typ
typst compile --root . Examples/Report/report-example.typ
```

This only matters for the *bundled examples*, because of how they're nested for organization. If you start your own project using the "Recommended Workspace Setup" below (`main.typ` sitting directly next to your own copy of `template/`), you don't need `--root` at all — the project root defaults correctly.

See [Getting Started](#getting-started-with-typst-in-visual-studio-code) below for the equivalent one-time setup in VS Code and typst.app.

---

## Recomended Workspace Setup

For your own document, copy `template/` next to a `main.typ` of your own (based on one of the `Examples/`) — with this layout you don't need `--root`, since `main.typ` and `template/` are siblings:

```
my-thesis/
├── main.typ          ← entry point
├── template/         ← this Lusófona template folder
├── glossary.yaml     ← optional acronyms
├── refs.yaml         ← bibliography in YAML or use bib-format
└── chapters/
    ├── intro.typ
    └── methodology.typ
```
---

## Getting Started with Typst in Visual Studio Code

Typst is a modern alternative to LaTeX — designed to be simpler, faster, and easier to use, especially for writing technical and academic documents. You don't need to install Typst separately: the VS Code extension bundles its own compiler.

1. **Install VS Code**, if you don't have it already: https://code.visualstudio.com/
2. **Install the Tinymist extension** — open the Extensions panel (`Cmd/Ctrl+Shift+X`), search for "Tinymist Typst", and install it (or install directly from the marketplace: https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist). It gives you syntax highlighting, autocomplete, on-the-fly error checking, and a live preview.
3. **Open the repository root folder in VS Code** (`File > Open Folder…`) — i.e. the folder containing `template/` and `Examples/`, not a subfolder. This matters: see the `--root` note below.
4. **Pick which file to compile.** Open e.g. `Examples/Thesis/thesis-example.typ` and run `Typst Pin Main to This File` from the command palette (`Cmd/Ctrl+Shift+P`) — Tinymist compiles whichever file is pinned as "main", which is what lets it resolve `../../template/...` correctly.
5. If you still see a "cannot read file outside of project root" error, open Settings, search for **"Tinymist Root Path"**, and set it to the absolute path of the repository root folder, then reload the window. (Working on your own project laid out per "Recommended Workspace Setup" below doesn't need this — it only matters for the bundled `Examples/`, which are nested two folders deep.)
6. **Preview** with the "Preview" button in the top-right corner of the editor (or `Typst: Preview` from the command palette) for a live-updating PDF alongside your source.
7. **Export a PDF** with `Typst: Export PDF` from the command palette, or from a terminal at the repository root: `typst compile --root . Examples/Thesis/thesis-example.typ` (see the `--root` note above — required because the entry file sits two folders below `template/`). If you also have the [Typst CLI](https://github.com/typst/typst#installation) installed separately, that's the same command.
8. The first time you compile a file that imports an external package (this template's diagram examples use `@preview/fletcher`), Typst downloads and caches it automatically — you'll need an internet connection for that first compile only.

### Using this template on typst.app (no install)

You can also work entirely in the browser at https://typst.app, with no local install at all:

1. Sign in and create a **new project**.
2. Upload the **whole repository** (not just one `Examples/` subfolder) using the project's file panel (drag-and-drop or "Upload"), keeping the same folder structure (`template/…`, `Examples/…`, etc.) — this way the project's root is the repository root, and `Examples/Thesis/thesis-example.typ`'s `../../template/...` imports resolve correctly. Alternatively, start a fresh project laid out per "Recommended Workspace Setup" below (`main.typ` directly beside your own `template/` copy), which avoids the nested-path issue entirely.
3. Set the file you want to build (e.g. `Examples/Thesis/thesis-example.typ`) as the project's **main file** in the project settings — typst.app compiles whichever file is marked as the entry point, while the project root stays the top-level folder you uploaded.
4. Edit and preview directly in the browser; use the "Export" menu to download a PDF.
5. External packages like `fletcher` (used in the block-diagram examples) are fetched automatically by typst.app — no extra setup needed.

## Useful links

1. [Typst Main Documentation](https://typst.app/docs)  
   Comprehensive guide covering all core concepts, formatting, and features.

2. [Typst Language Reference](https://typst.app/docs/reference/)  
   Detailed reference for functions, types, syntax, and built-ins.

3. [Typst Examples Gallery](https://typst.app/examples)  
   Real-world examples like reports, CVs, and posters to learn from.

4. [Typst Package Registry](https://packages.typst.org/)  
   Find and use community-created Typst packages via `#import "@..."`.

5. [Typst GitHub Repository](https://github.com/typst/typst)  
   Source code, issue tracking, and development updates.

6. [Typst Discord Server](https://discord.gg/typst)  
   Official community chat — ask questions, share ideas, and get help.

7. [Typst Playground](https://typst.app)  
   Try Typst directly in the browser without installing anything.
