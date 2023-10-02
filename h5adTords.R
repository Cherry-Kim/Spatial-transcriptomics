        #devtools::install_github("cellgeni/sceasy")
        library(sceasy)
        library(reticulate)

        #STEP0. Data import
        sceasy::convertFormat("Mouse_embryo_all_stage.h5ad", from="anndata", to="seurat", outFile="Mouse_embryo_all_stage.rds")
        '''
        An object of class Seurat 
        23761 features across 520815 samples within 1 assay 
        Active assay: RNA (23761 features, 0 variable features)
        1 dimensional reduction calculated: spatial
        '''
