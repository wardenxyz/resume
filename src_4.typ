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
  introduction,
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

  show heading: set text(themeColor, 1.1em) //标题字号

  show heading.where(level: 2): it => stack(
    v(0.3em),
    it,
    v(0.6em),
    line(length: 100%, stroke: 0.05em + themeColor),
    v(0.1em),
  )

  show heading.where(level: 1): it => stack(
    v(0.3em),
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
    introduction
  } else {
    grid(
      columns: (auto, 1fr, photographWidth),
      gutter: (gutterWidth, 0em),
      [#header
        #introduction],
      if (photograph != "") {
        image(photograph, width: photographWidth)
      },
    )
  }

  body
}

#let sidebar(side, content, withLine: true, sideWidth: 12%) = layout(size => {
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
  ..infos
) = {
    set text(font: (font.cjk,font.mono), fill: color, size: 10.2pt, tracking: 0.3pt)
    set par(leading: 1.2em) // 行间距

    // 生成所有信息项的 box 列表
    let items = infos.pos().map(dir => {
      box({
        if "icon" in dir {
          if (type(dir.icon) == str) {
            icon(dir.icon)
          } else {
            dir.icon
          }
        }
        h(0.2em) // 图标和文字的间距
        if "link" in dir {
          link(dir.link, dir.content)
        } else {
          dir.content
        }
      })
    })

    // 使用 grid 排列成两列，自动换行
    grid(
      columns: (auto, auto), // 两列，宽度自动
      column-gutter: 2em,    // 列间距
      row-gutter: 0.9em,     // 行间距
      ..items                // 将 items 列表展开到 grid 中
    )
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
