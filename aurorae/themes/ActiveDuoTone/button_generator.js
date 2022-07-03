const fs = require('node:fs')
const nunjucks = require('nunjucks')

const globalVars = {
  width: 30,
  height: 24,
  strokeWidth: 3,
}

const buttons = [
  {
    name: 'close',
    vars: {
      path: 'm -6,-6 12,12 m -12,0 12,-12',
    },
  },
  {
    name: 'minimize',
    vars: {
      path: 'm -5,4 h 10',
    },
  },
  {
    name: 'maximize',
    vars: {
      path: 'm -5,-5 v 10 h 10 v -10 z',
    },
  },
  {
    name: 'restore',
    vars: {
      path: 'm -5,-5 v 10 h 10 v -10 z',
    },
  },
  {
    name: 'alldesktops',
    vars: {
      path: 'm 0,-6 -6,6 6,6 6,-6 z',
    },
  },
  {
    name: 'keepabove',
    vars: {
      path: 'm 0,-5 -7,7 h 14 z',
    },
  },
  {
    name: 'keepbelow',
    vars: {
      path: 'm 0,5 7,-7 h -14 z',
    },
  },
  {
    name: 'shade',
    vars: {
      path: 'm -5,-4 h 10',
    },
  },
  {
    name: 'help',
    vars: {
      path: 'm -4,-1 4,-4 4,4 -4,4 v 3',
    },
  },
]

nunjucks.configure({ autoescape: true })

for (const button of buttons) {
  var res = nunjucks.render('button_template.njk', { ...globalVars, ...button.vars })
  fs.writeFileSync(`${button.name}.svg`, res)
}
