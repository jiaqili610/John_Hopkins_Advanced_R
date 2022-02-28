vector_sum_rec <- function(v){
  if(length(v)==1){
    v
  } else {
    v[1]+vector_sum_rec(v[-1])
  }
    
  
}




