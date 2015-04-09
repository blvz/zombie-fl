name: 'zombie-fl'
version: '0.1.0-alpha.2'
description: 'Headless Flash environment.'
files: <[ index.js lib ]>

homepage: \https://github.com/blvz/zombie-fl
keywords: <[ headless flash fla jsfl adobe ]>
repository:
  url:  'git://github.com/blvz/zombie-fl.git'
  type: \git

author:  'Rafael Belvederese <rafael@blvz.im>'
license: 'MIT'

scripts:
  prepublish: 'make package.json'
  test:       'make test'

engines:
  node: '0.12'

dependencies:
  yauzl:        '^2.2.1'
  xamel:        '^0.3.1'
  # TODO: waiting for PRs to be merged
  'chroma-js':  'blvz/chroma.js#hex-updates'
  'prelude-ls': '^1.1.1'

dev-dependencies:
  chai:       '^2.1.2'
  mocha:      '^2.2.1'
  LiveScript: '^1.3.1'
