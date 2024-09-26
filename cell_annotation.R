cell_anno <- function(){
        library(Seurat)
        library(ggplot2)
        obj <- readRDS('xenium.obj_assign_detail.reanno.Rds')
        levels(obj)  #26 Levels

        cell_annotations <- data.frame(
          cell_id = names(Idents(obj)),         # cell ID 
          annotation = as.character(Idents(obj)) # annotation
        )
        head(cell_annotations)
        write.csv(cell_annotations, file = "cell_annotations.csv", row.names = FALSE)
