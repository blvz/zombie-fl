name: 'zombie-fl'
version: '0.0.1'
description: 'Headless Flash environment.'
files: <[ index.js ]>

homepage: \https://github.com/blvz/zombie-fl
keywords: <[ headless flash fla jsfl adobe ]>
repository:
  url:  'git://github.com/blvz/zombie-fl.git'
  type: \git

author:  'Rafael Belvederese <rafael@blvz.im>'
license: 'MIT'

scripts:
  prepublish: 'make metadata'
  test:       'make test'

engines:
  node: '0.12'

dependencies:
  yauzl:        '^2.2.1'
  xml2js:       '^0.4.6'
  'prelude-ls': '^1.1.1'

dev-dependencies:
  chai:       '^2.1.2'
  mocha:      '^2.2.1'
  LiveScript: '^1.3.1'
