
# Tidy Data for More Streamlined Analyses --------------------------------

## Load/Install Packages -------------------------------------------------

# Install the following packages if not already installed:
# install.packages("here")
# install.packages("openxlsx")
# install.packages("tidyverse")

# Load the tidyverse package
library(tidyverse)

# Tidy Data with openxlsx and the tidyverse ------------------------------

# Add a worksheet to the penguins.xlsx workbook
openxlsx::addWorksheet(penguins_openxlsx_wb, sheetName = "Sheet3")

# Use the tidyverse to summarize the penguins.xlsx data frame
# in a way similar to a pivot table
penguins_openxlsx_tidy <- penguins_openxlsx_edit %>% 
  group_by(species, island) %>%                          # Group data by species and island
  summarize(flipper_length_mm = mean(flipper_length_mm), # Find the mean flipper length and
            body_mass_g = mean(body_mass_g))             # body mass for each species by island

# Write this new data frame to the worksheet we added to the Excel workbook
openxlsx::writeDataTable(penguins_openxlsx_wb, sheet = "Sheet3", 
                         x = penguins_openxlsx_tidy,
                         tableStyle = "TableStyleLight9")

# Open a temporary version of the Excel workbook with openxlsx
openxlsx::openXL(penguins_openxlsx_wb)

# Additional Methods -----------------------------------------------------

## Tidy Data with xlsx or XLConnect --------------------------------------
# More information about xlsx and XLConnect and their capabilities
# can be found in 01_read.R

## Use More of the Tidyverse's Capabilities ------------------------------
# Documentation and sample code from all of the packages in the tidyverse
# can be found here: https://www.tidyverse.org/
