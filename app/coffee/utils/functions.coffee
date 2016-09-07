
module.exports =

  ###*
  * Creates a (poorly) random ID meant for use in HTML elements
  * @param {string} ptn - Pattern (eg. 'xx-yx-xxyx-4')
  ###
  randomID: (ptn) ->
    ptn = ptn || 'id-xxxx-4xxx-yxxx'
    ptn.replace /[xy]/g, (c) ->
      r = Math.random() * 16|0
      if c == 'x' then v = r else v = (r&0x3|0x8)
      v.toString 16
