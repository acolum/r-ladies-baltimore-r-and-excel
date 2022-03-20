
# How to Edit R Data as in Excel -----------------------------------------

## Load/Install Packages -------------------------------------------------

# Install the following packages if not already installed:
# install.packages("DataEditR")
# install.packages("here")
# install.packages("openxlsx")
# install.packages("tidyverse")

# Load the tidyverse package
library(tidyverse)

# Edit Data with openxlsx and the tidyverse ------------------------------

# Add a worksheet to the penguins.xlsx workbook
openxlsx::addWorksheet(penguins_openxlsx_wb, sheetName = "Sheet2")

# Use the tidyverse to manipulate the penguins.xlsx data frame
penguins_openxlsx_edit <- penguins_openxlsx %>% 
  select(-X1) %>%                               # Remove column X1
  drop_na()                                     # Drop rows containing missing values

# Write this new data frame to the worksheet we added to the Excel workbook
openxlsx::writeData(penguins_openxlsx_wb, sheet = "Sheet2", 
                    x = penguins_openxlsx_edit)

# Open a temporary version of the Excel workbook with openxlsx
openxlsx::openXL(penguins_openxlsx_wb)

# Additional Methods -----------------------------------------------------

## Use xlsx or XLConnect to Edit Data ------------------------------------
# More information about xlsx and XLConnect and their capabilities
# can be found in 01_read.R

## Use the DataEditR Package to Edit Data --------------------------------
# DataEditR makes it easier to manually enter and edit data in the
# RStudio graphical user interface.
# Link to documentation: https://cran.r-project.org/web/packages/DataEditR/index.html

penguins_DataEditR <- DataEditR::data_edit(penguins_openxlsx)
