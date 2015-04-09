// Generated by LiveScript 1.3.1
var Base, Element, Contour, Fill, Shape;
Base = require('./Base');
Element = require('./Element');
Contour = require('./Contour');
Fill = require('./Fill');
module.exports = Shape = (function(superclass){
  var prototype = extend$((import$(Shape, superclass).displayName = 'Shape', Shape), superclass).prototype, constructor = Shape;
  function Shape(xml){
    var drawing, group, rect, oval, ms, fills;
    if (!(this instanceof constructor)) {
      return (function(func, args, ctor) {
        ctor.prototype = func.prototype;
        var child = new ctor, result = func.apply(child, args), t;
        return (t = typeof result)  == "object" || t == "function" ? result || child : child;
  })(constructor, arguments, function(){});
    }
    drawing = xml.attr('isDrawingObject') === 'true';
    group = xml.name === 'DOMGroup';
    rect = xml.name === 'DOMRectangleObject';
    oval = xml.name === 'DOMOvalObject';
    if (group) {
      ms = xml.$('members/*').children;
      this.members = ms.map(Element.mapper);
    }
    fills = rect || oval
      ? xml.$('fill/*').children.map(Fill)
      : xml.$('fills/FillStyle/*').children.map(Fill);
    if (fills.length) {
      fills = [new Fill].concat(fills);
      this.contours = fills.map(function(it){
        var x$;
        x$ = new Contour;
        x$.fill = it;
        return x$;
      });
    }
    this.isDrawingObject = function(){
      return drawing;
    };
    this.isGroup = function(){
      return group;
    };
    this.isRectangleObject = function(){
      return rect;
    };
    this.isOvalObject = function(){
      return oval;
    };
  }
  return Shape;
}(Base));
function extend$(sub, sup){
  function fun(){} fun.prototype = (sub.superclass = sup).prototype;
  (sub.prototype = new fun).constructor = sub;
  if (typeof sup.extended == 'function') sup.extended(sub);
  return sub;
}
function import$(obj, src){
  var own = {}.hasOwnProperty;
  for (var key in src) if (own.call(src, key)) obj[key] = src[key];
  return obj;
}