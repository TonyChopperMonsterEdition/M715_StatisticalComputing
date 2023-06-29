
for(x in seq_along(caseNumbers)){
  var=get(caseNumbers[x])
  
  assign(caseNumbers[x],add_column(var, Year=2013+x, .before="Casenumbers"))
}
