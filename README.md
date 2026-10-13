# Quarto clean theme

A minimalist and elegant presentation theme for Quarto Reveal.js, inspired by Kyle's
[LaTex template](https://raw.githack.com/kylebutts/templates/master/latex-slides/slides.pdf).

Click the screenshot below to be taken to a
[live demo](https://grantmcdermott.com/quarto-revealjs-clean-demo/template.html).

[![](clean-title.png "live demo")](https://grantmcdermott.com/quarto-revealjs-clean-demo/template.html)

## Use

Depending on your use case, here are some [Quarto CLI](https://quarto.org/)
commands to get started.

If you would like to add the **clean** theme to an existing directory:

```bash
quarto install extension grantmcdermott/quarto-revealjs-clean
```

Alternatively, you can use a
[Quarto template](https://quarto.org/docs/extensions/starter-templates.html)
that bundles the **clean** theme plus a .qmd starter document. This is a better
option if you are starting a new project from scratch, since it will automatically
create a new directory with all of the necessary scaffolding in one go. We provide
two template options.

- Bare bones template

```bash
quarto use template grantmcdermott/quarto-revealjs-clean
```

- Full demo template

```bash
quarto use template grantmcdermott/quarto-revealjs-clean-demo
```

## Title slide logo

Add a large logo to the top-right corner of the title slide with `title-logo`.
This complements Reveal.js's built-in `logo` option (small, bottom-left, all
slides), which is hidden on the title slide when `title-logo` is set.

```yaml
format:
  clean-revealjs:
    title-logo: my-logo.svg
```

The logo is scaled to fit a 250×110px box by default. To change this, set
the `--title-logo-width` and `--title-logo-height` CSS variables, e.g.

```yaml
format:
  clean-revealjs:
    title-logo: my-logo.svg
    include-in-header:
      text: "<style>:root { --title-logo-width: 180px; --title-logo-height: 72px; }</style>"
```

## PDF (Typst) version

The Quarto Reveal.js backend will render HTML slides. This is great for
interactive content and dynamic responsiveness (e.g., automatically fitting
whatever display device is being used). However, you may prefer to render your
slides directly to PDF instead. If so, please take a look at Kazuharu
Yanagimoto's very nice port of the **clean** theme, which leverages the Typst
backend: https://github.com/kazuyanagimoto/quarto-clean-typst