
# How to Share Public Excel Data and Results -----------------------------

## Load/Install Packages -------------------------------------------------

# Install the following packages if not already installed:
# install.packages("here")
# install.packages("openxlsx")
# install.packages("tidyverse")
# install.packages("writexl")
# install.packages("XLConnect")
# install.packages("xlsx")

# Load the tidyverse package
library(tidyverse)

# Export an Excel File from R with openxlsx ------------------------------

openxlsx::saveWorkbook(penguins_openxlsx_wb, file = here::here("data",
                                                               "penguins_openxlsx.xlsx"))

# Note: you can set the file name to be the same as the original file name
# and overwrite = TRUE to save over your original Excel workbook

# Additional Methods -----------------------------------------------------

## Export an Excel File from R with XLConnect ----------------------------
# More information about XLConnect and its capabilities can be found in 01_read.R

XLConnect::writeWorksheetToFile(file = here::here("data",
                                                  "penguins_XLConnect.xlsx"),
                                data = penguins_XLConnect,
                                sheet = 1)

## Export an Excel File from R with xlsx ---------------------------------
# More information about xlsx and its capabilities can be found in 01_read.R

xlsx::write.xlsx(penguins_xlsx, file = here::here("data",
                                                  "penguins_xlsx.xlsx"))

# Note: if you have a larger data set, you may get better performance when
# using the write.xlsx2() function.

## Export an Excel File from R with writexl ------------------------------
# writexl has the following capabilities:
# - write a data frame(s) to an .xlsx file (with single or multiple sheets)
# - create special column types (formulas and URLs) to write to a spreadsheet
# Link to documentation: https://cran.r-project.org/web/packages/writexl/index.html

# Add formulas and URLs to the data frame
penguins_writexl <- penguins_openxlsx %>% 
  mutate(url = writexl::xl_hyperlink("https://allisonhorst.github.io/palmerpenguins/articles/intro.html"),
         years_since_observation = writexl::xl_formula('=(YEAR(TODAY()) - INDIRECT("I" & ROW()))'))

# Export the data frame to an Excel file
writexl::write_xlsx(penguins_writexl, path = here::here("data",
                                                        "penguins_writexl.xlsx"))
