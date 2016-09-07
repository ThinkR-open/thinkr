#' @export


test <- "_ERT_________lkjg___COUCOU_"
gsub("_+","_",test)
test
clean_names<-function(eldata){
  old <- names(eldata)
  names(eldata)<-make.unique(names(eldata))
  names(eldata)<-make.names(names(eldata))
  names(eldata)<-gsub("\\.\\.",".",names(eldata))
  names(eldata)<-gsub("\\.\\.",".",names(eldata))
  names(eldata)<-gsub("^X.","",names(eldata))
  names(eldata)<-gsub("\\.","_",names(eldata))
  names(eldata)<-    gsub("_+","_",names(eldata))
  names(eldata)<-gsub("_$","",names(eldata))
  names(eldata)<-tolower(names(eldata))
  names(eldata)<-make.names(names(eldata))
  names(eldata)<-make.unique(names(eldata))




  print(data.frame(old=old,new=names(eldata)))
  invisible(eldata)

}
