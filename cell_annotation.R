anno <- function(){
        library(Seurat)
        library(ggplot2)
        object <- readRDS('/BIO3/KD_Xenium/xenium.obj_assign_detail.Rds')
        levels(object)  #48 Levels -> 22 Levels
        table(Idents(object))

        obj=RenameIdents(object, "PT"="Proximal Tubule", "DTL"="Descending Thin Limb" )

        levels(obj)
        saveRDS(obj, "xenium.obj_assign_detail.reanno.Rds")

        cell_annotations <- data.frame(
          cell_id = names(Idents(obj)),         # cell ID 
          annotation = as.character(Idents(obj)) # annotation
        )
        head(cell_annotations)
        write.csv(cell_annotations, file = "cell_annotations.csv", row.names = FALSE)
}

