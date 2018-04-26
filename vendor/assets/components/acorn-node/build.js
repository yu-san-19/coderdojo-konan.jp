var fs = require('fs')
var path = require('path')
var mkdirp = require('mkdirp')
var buble = require('buble')

var HEADER = '/* Generated by `npm run build`, do not edit! */\n\n'

function compile (name, output) { // eslint-disable-line no-unused-vars
  console.log(name, '→', output)
  mkdirp.sync(path.dirname(path.join(__dirname, output)))
  var source = fs.readFileSync(require.resolve(name), 'utf8')
  var result = buble.transform(source, {
    transforms: {
      dangerousForOf: true
    }
  })
  fs.writeFileSync(path.join(__dirname, output), HEADER + result.code, 'utf8')
}

console.log('Nothing to do right now!')