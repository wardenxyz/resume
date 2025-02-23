#import "src_2.typ": *

#let faEnvelope = icon("icons/fa-envelope.svg")
#let faPhone = icon("icons/fa-phone.svg")
#let wechat = icon("icons/WeChat.svg")
#let fadot = icon("icons/dot.svg")

#let themeColor = rgb(0, 0, 0)

#show: resume.with(
  size: 10pt,
  themeColor: themeColor,
  // 控制纸张的边距
  top: 1.5cm,
  bottom: 2cm,
  left: 2cm,
  right: 2cm,
  // 控制头像的大小
  photograph: "profile.jpg",
  photographWidth: 10em,
  gutterWidth: 2em,
)[

  = 蔡某某 #text(font: "Microsoft YaHei", size: 10pt)[#h(4cm) #fadot 求职意向：工程师]

  #info(
    color: themeColor,
    (
      icon: faPhone,
      content: "电话：123-4567-8901",
    ),
    (
      icon: wechat,
      content: "微信号：zhangxiaolong",
    ),
    (
      icon: faEnvelope,
      content: "邮箱：example@mail.com",
      link: "mailto:example@mail.com",
    ),
    (
      icon: fadot,
      content: "出生年月：20xx 年 xx 月",
    ),
  )
][
  == 专业技能

  #sidebar(withLine: false, sideWidth: 6%)[
    *熟悉*

    *证书*
  ][
    Office、AutoCAD、Photoshop、Python 等

    四级、六级、计算机二级、普通话二乙、机动车驾驶证
  ]

]

== 教育背景

#item(
  [ *家里蹲大学* 本科],
  [ 家里蹲专业 ],
  date[ 20xx 年 06 月 – 20xx 年 06 月 ],
)
*主修课程*：家里蹲专业课程等

*奖学金*：20xx 年度家里蹲大学一等奖学金

== 项目经历

#item(
  [ *项目名称* ],
  [ 个人项目 ],
  date[ 20xx 年 xx 月 – 20xx 年 xx 月 ],
)

项目描述

== 校园经历

#item(
  [ - *学生会*],
  [xx部长],
  date[ 20xx 年 xx 月 – 20xx 年 xx 月 ],
)

学生会的经历、奖项等

#item(
  [ - *学生会*],
  [ 学生会主席 ],
  date[ 20xx 年 xx 月 – 20xx 年 xx 月 ],
)

学生会的经历、奖项等

== 实习经历
#item(
  [ - *家里蹲公司*],
  [ 实习生 ], //或其它职位
  date[ 20xx 年 xx 月 – 20xx 年 xx 月 ],
)

在家里蹲公司的实习经历

#item(
  [ - *家里蹲二号公司*],
  [ 实习生 ], //或其它职位
  date[ 20xx 年 xx 月 – 20xx 年 xx 月 ],
)

实习经历

== 自我评价

- 常年跑步，身体健康

- 有团队合作精神，善于沟通
