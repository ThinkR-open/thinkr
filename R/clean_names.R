

clean_names<-function(eldata){
  old <- names(eldata)
  names(eldata)<-make.unique(names(eldata))
  names(eldata)<-make.names(names(eldata))
  names(eldata)<-gsub("\\.\\.",".",names(eldata))
  names(eldata)<-gsub("\\.\\.",".",names(eldata))
  names(eldata)<-gsub("^X.","",names(eldata))
  names(eldata)<-gsub("\\.","_",names(eldata))
  for (i in 1:5){
    #c'te honte TODO
  names(eldata)<-    gsub("__","_",names(eldata))
  }
  names(eldata)<-gsub("_$","",names(eldata))
  names(eldata)<-tolower(names(eldata))
  names(eldata)<-make.names(names(eldata))
  names(eldata)<-make.unique(names(eldata))
  

  
  
  print(data.frame(old=old,new=names(eldata)))
  invisible(eldata)
  
}
