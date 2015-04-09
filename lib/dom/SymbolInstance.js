// Generated by LiveScript 1.3.1
var Base, SymbolInstance;
Base = require('./Base');
module.exports = SymbolInstance = (function(superclass){
  var prototype = extend$((import$(SymbolInstance, superclass).displayName = 'SymbolInstance', SymbolInstance), superclass).prototype, constructor = SymbolInstance;
  function SymbolInstance(xml){
    if (!(this instanceof constructor)) {
      return (function(func, args, ctor) {
        ctor.prototype = func.prototype;
        var child = new ctor, result = func.apply(child, args), t;
        return (t = typeof result)  == "object" || t == "function" ? result || child : child;
  })(constructor, arguments, function(){});
    }
  }
  return SymbolInstance;
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