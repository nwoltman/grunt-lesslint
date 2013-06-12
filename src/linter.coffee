getLessLineNumber = (cssLine='') ->
  if match = /^\s*\/\* line (\d+), .* \*\/\s*$/.exec(cssLine)
    parseInt(match[1]) - 1
  else
    -1

getPropertyName = (line='') ->
  line = line.trim()
  colon = line.indexOf(':')
  if colon > 0
    line.substring(0, colon)
  else
    null

findLessLineNumber = (css='', lineNumber=0) ->
  cssLines = css.split('\n')
  lineNumber = Math.max(0, Math.min(lineNumber, cssLines.length - 1))

  commentLine = lineNumber
  lessLineNumber = -1
  while commentLine >= 0
    lessLineNumber = getLessLineNumber(cssLines[commentLine])
    return lessLineNumber if lessLineNumber >= 0
  -1

module.exports = {getPropertyName, findLessLineNumber}