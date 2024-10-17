 library(Seurat)
        library(ggplot2)
        object <- readRDS('xenium.obj_assign_detail.Rds')
        Idents(object) <- object$sample
        unique(Idents(object))
        
        object@images$fov <- NULL
        object@images$fov.2 <- NULL
        object@images$fov.3 <- NULL
        object@images$fov.4 <- NULL

        object_sub1 <- subset(object, idents = "16407")
        object_sub2 <- subset(object, idents = "16406")
        object_sub3 <- subset(object, idents = "16409")

        features <- c("CD27","CD40","PAX5")  #Aged B cell
        features <- c("CXCL13","CCL19","CXCL12","CCR7","CXCR5")  #TLT
        FeaturePlot(object_sub1, features =features, ncol =1,keep.scale="all")
        FeaturePlot(object_sub2, features =features, ncol =1,keep.scale="all")
        FeaturePlot(object_sub3, features =features, ncol =1,keep.scale="all")


features = c("ACTA2","MRC1","CD68","CX3CR1")

        p <- ImageDimPlot(xenium.obj, fov = "fov", molecules = features, nmols = 20000)+ theme( legend.text = element_text(size = 20),  legend.title = element_text(size = 18) )
        p + scale_fill_manual(values = c("gray"))

        ImageFeaturePlot(xenium.obj, features = features, max.cutoff = c(25, 35, 12, 10), size = 0.75, cols = c("white", "red"))

        ImageDimPlot(xenium.obj, fov = "zoom", axes = TRUE, border.color = "white", border.size = 0.1, cols = "polychrome", coord.fixed = FALSE, molecules = features, nmols = 20000) + theme( legend.text = element_text(size = 20),  legend.title = element_blank(), axis.text = element_text(size = 15))
