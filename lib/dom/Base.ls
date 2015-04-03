module.exports = class DOMObject
  to-string: -> "[object #{@constructor.name}]"
