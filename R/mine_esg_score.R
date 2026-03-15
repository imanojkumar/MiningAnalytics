#' Mine ESG Score
#'
#' Calculate ESG performance score
#'
#' @param environmental environmental score
#' @param social social score
#' @param governance governance score
#'
#' @return ESG score
#' @export

mine_esg_score <- function(environmental,
                           social,
                           governance){
  
  score <- (environmental * 0.4) +
    (social * 0.3) +
    (governance * 0.3)
  
  return(score)
  
}
