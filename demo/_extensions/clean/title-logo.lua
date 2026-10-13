-- title-logo.lua
-- Optional big logo at the top-right of the reveal.js title slide.
--
-- Activated by the `title-logo` document/format metadata key:
--
--   format:
--     clean-revealjs:
--       title-logo: logo.svg
--
-- If the key is absent, the filter does nothing (no error, no markup). This
-- complements reveal.js's built-in `logo:` option (small, bottom-left, all
-- slides).

function Meta(meta)
  if not quarto.doc.is_format("revealjs") then return nil end

  local logo = meta["title-logo"]
  if logo == nil then return nil end

  local src = pandoc.utils.stringify(logo)
  if src == "" then return nil end

  -- Anchor the logo to the reveal "stage" (.slides) so the logo sits in the
  -- slide's top-right corner and scales with the deck. It only appears on the
  -- title slide, when the title slide is the active one (:has + .present).
  local css = table.concat({
    "<style>",
    ".reveal .slides:has(> section#title-slide.present)::after {",
    "  content: \"\";",
    "  position: absolute;",
    "  top: 20px;",
    "  right: 20px;",
    "  width: var(--title-logo-width, 250px);",
    "  height: var(--title-logo-height, 110px);",
    "  background-image: url('" .. src .. "');",
    "  background-repeat: no-repeat;",
    "  background-position: top right;",
    "  background-size: contain;",
    "  pointer-events: none;",
    "}",
    -- Hide the built-in bottom-left logo while the title slide is active, so the
    -- big top-right title-logo stands alone there (it returns on other slides).
    ".reveal:has(section#title-slide.present) .slide-logo {",
    "  display: none !important;",
    "}",
    "</style>",
  }, "\n")

  quarto.doc.include_text("in-header", css)
  return nil
end
