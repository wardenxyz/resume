#let font = (
  main: "microsoft yahei",
  mono: "microsoft yahei",
  cjk: "Arial",
)

#let icon(path) = box(
  baseline: 0.125em,
  height: 1.0em,
  width: 1.25em,
  align(center + horizon, image(path)),
)

#let faAngleRight = icon("icons/fa-angle-right.svg")

#let resume(
  size: 10pt,
  themeColor: rgb("#000000"),
  top: 1.5cm,
  bottom: 2cm,
  left: 2cm,
  right: 2cm,
  photograph: "",
  photographWidth: 0em,
  gutterWidth: 0em,
  headerCenter: false,
  header,
  body,
) = {
  set page(
    paper: "a4",
    margin: (
      top: top,
      bottom: bottom,
      left: left,
      right: right,
    ),
  )

  set text(font: (font.cjk, font.main), size: size, lang: "zh", tracking: 0.05em)

  show heading: set text(themeColor, 1.1em)

  show heading.where(level: 2): it => stack(
    v(0.3em),
    it,
    v(0.6em),
    line(length: 100%, stroke: 0.05em + themeColor),
    v(0.1em),
  )

  show heading.where(level: 1): it => stack(
    v(1.5em),
    it,
    v(0.6em),
    line(length: 100%, stroke: 0.05em + themeColor),
    v(0.1em),
  )

  show list: it => stack(
    spacing: 0.8em,
    ..it.children.map(item => {
      grid(
        columns: (1.5em, 1fr),
        gutter: 0em,
        box({
          h(0.1em)
          faAngleRight
        }),
        pad(top: 0.05em, item.body),
      )
    }),
  )

  show link: set text(fill: themeColor)

  set par(justify: true)

  if headerCenter {
    assert(photograph == "", message: "无法将名称与照片居中")
    align(alignment.center, header)
  } else {
    grid(
      columns: (10fr, 1fr, photographWidth),
      gutter: (gutterWidth, 0em),
      [#header],
      if (photograph != "") {
        image(photograph, width: photographWidth)
      },
    )
  }

  body
}

#let sidebar(side, content, withLine: true, sideWidth: 10%) = layout(size => {
  let sideSize = measure(width: size.width, height: size.height, side)
  let contentSize = measure(width: size.width, height: size.height, content)
  let height = calc.max(sideSize.height, contentSize.height) + 0.5em
  grid(
    columns: (sideWidth, 0%, 1fr),
    gutter: 0.75em,
    {
      set align(right)
      v(0.25em)
      side
      v(0.25em)
    },
    if (withLine) { line(end: (0em, height), stroke: 0.05em) },
    {
      v(0.25em)
      content
      v(0.25em)
    },
  )
})

#let info(
  color: black,
  ..infos,
) = {
  set text(font: (font.cjk, font.mono), size: 10.2pt, tracking: 0.1pt)
  set par(leading: 1em)
  infos
    .pos()
    .map(dir => {
      box({
        if "icon" in dir {
          if (type(dir.icon) == "string") {
            icon(dir.icon)
          } else {
            dir.icon
          }
        }
        h(0.1em)
        if "link" in dir {
          link(dir.link, dir.content)
        } else {
          dir.content
        }
      })
    })
    .join(h(5em) + h(-1em))
  v(0.1em)
}

#let date(body) = text(
  fill: rgb(0, 0, 0),
  size: 0.9em,
  body,
)

#let tech(body) = block({
  set text(weight: "extralight")
  body
})

#let item(
  title,
  desc,
  endnote,
) = {
  v(0.25em)
  grid(
    columns: (38%, 1fr, auto),
    gutter: 0em,
    title, desc, endnote,
  )
}

