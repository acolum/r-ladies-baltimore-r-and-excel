
# How to Read Excel Data into R -------------------------------------------

## Load/Install Packages --------------------------------------------------

# Install the following packages if not already installed:
# install.packages("here")
# install.packages("openxlsx")
# install.packages("readxl")
# install.packages("XLConnect")
# install.packages("xlsx")

# Import an Excel File into R with openxlsx -------------------------------
# openxlsx provides a high-level interface to read, edit, style, and
# write Excel worksheets.
# Link to documentation: https://cran.r-project.org/web/packages/openxlsx/index.html

# Read an Excel file in as a data frame with openxlsx
penguins_openxlsx <- openxlsx::readWorkbook(here::here("data",
                                                       "penguins.xlsx"))

# Read an Excel file in as a workbook with openxlsx
penguins_openxlsx_wb <- openxlsx::loadWorkbook(here::here("data",
                                                          "penguins.xlsx"))

# View the Imported Excel File --------------------------------------------

# View the first 6 rows of the Excel file (penguins_xlsx) in the Console
head(penguins_openxlsx)

# View the entire Excel file
View(penguins_openxlsx)

# Additional Methods ------------------------------------------------------

## Import an Excel File into R with readxl --------------------------------
# readxl has the following capabilities:
# - specify the cell range/rectangle to read into Excel
# - determine the file format (.xls or .xlsx) based on file extension and signature
# - list all of the sheets in an Excel spreadsheet
# - read .xls and .xlsx files into R with a list of specifications
# Link to documentation: https://cran.r-project.org/web/packages/readxl/index.html

# Import the entire file
penguins_readxl <- readxl::read_excel(here::here("data","penguins.xlsx"))

# Import a specific sheet
penguins_readxl_sheet <- readxl::read_excel(here::here("data","penguins.xlsx"),
                                            sheet = "Sheet1")

## Import an Excel File into R with XLConnect -----------------------------
# XLConnect provides a comprehensive suite of tools to read, write,
# and format Excel files.
# Link to documentation: https://cran.r-project.org/web/packages/XLConnect/index.html

penguins_XLConnect <- XLConnect::readWorksheetFromFile(here::here("data",
                                                                  "penguins.xlsx"))

## Import an Excel File into R with xlsx ---------------------------------
# xlsx provides an extensive array of tools to read, write, and format
# Excel 2007 and Excel 97/2000/XP/2003 files.
# Link to documentation: https://cran.r-project.org/web/packages/xlsx/index.html

penguins_xlsx <- xlsx::read.xlsx(here::here("data","penguins.xlsx"),
                                 sheetIndex = 1)

# Note 1: with this function, it's necessary to add a sheet name or index.
# Note 2: if you have a larger data set, you may get better performance when
# using the read.xlsx2() function.
