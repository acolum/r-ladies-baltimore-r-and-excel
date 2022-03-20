
# Visualize Data in R Analogously to Excel -------------------------------

## Load/Install Packages -------------------------------------------------

# Install the following packages if not already installed:
# install.packages("here")
# install.packages("openxlsx")
# install.packages("tidyverse")

# Load the tidyverse package
library(tidyverse)

# Visualize Data with openxlsx and the tidyverse -------------------------

# Add a worksheet to the penguins.xlsx workbook
openxlsx::addWorksheet(penguins_openxlsx_wb, sheetName = "Sheet4")

# Use the tidyverse to visualize the penguins.xlsx data frame
# sample ggplot2 code from: https://allisonhorst.github.io/palmerpenguins/articles/intro.html
penguins_plot <- ggplot(penguins_openxlsx_edit, aes(x = island, fill = species)) +
  geom_bar(alpha = 0.8) +
  scale_fill_manual(values = c("darkorange","purple","cyan4"),
                    guide = "none") +
  theme_minimal() +
  facet_wrap(~species, ncol = 1) +
  coord_flip()
print(penguins_plot)

# Write this new visualization to the worksheet we added to the Excel workbook
openxlsx::insertPlot(penguins_openxlsx_wb, sheet = "Sheet4")

# Open a temporary version of the Excel workbook with openxlsx
openxlsx::openXL(penguins_openxlsx_wb)

# Additional Methods -----------------------------------------------------

## Visualize Data with xlsx or XLConnect ---------------------------------
# More information about xlsx and XLConnect and their capabilities
# can be found in 01_read.R

## Use One of R's Many Powerful Graphics Packages ------------------------
# Sample code from ggplot2, lattice, and other packages can be found in
# the R graph gallery.
# Link: https://www.r-graph-gallery.com/
