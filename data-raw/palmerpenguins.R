## Code to prepare the penguins data set from the palmerpenguins package

# Install these packages if not already installed:
# install.packages("palmerpenguins")
# install.packages("xlsx")
# install.packages("here")

# Write the penguins data from this package to an Excel (.xlsx) file
xlsx::write.xlsx(palmerpenguins::penguins,
                 here::here("data","penguins.xlsx"))
