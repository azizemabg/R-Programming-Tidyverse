
# CHAPTER: 2 FUNCTION ####

test <- function(a, b) {
+  a + b
}

test(5, 2)

test_2 <- function(x) {
  sum(x)/10
}

test_2(2)

df <- tibble::tibble(
  a = rnorm(10), 
  b = rnorm(10), 
  c = rnorm(10), 
  d = rnorm(10)
)
df

# Scalling the value within variabel

# Manual
df$a <- (df$a - min(df$a, na.rm = TRUE)) / (max(df$a, na.rm = TRUE) - min(df$a, na.rm = TRUE))
df

# Using function
# Build a logic
x <- df$a
(x - min(x, na.rm = TRUE)) / (max(x, na.rm = TRUE) - min(x, na.rm = TRUE))
rng <- range(x, na.rm = TRUE) # This code replace the previous code (line33) with the simplest code
(x - rng[1]) / (rng[2] - rng[1]) # This code is same as line27

# Create a function
rescale01 <- function(x) {
  rng <- range(x, na.rm = TRUE)
  (x - rng[1]) / (rng[2] - rng[1])
}

# test function
rescale01(df$a) # Looks good and works

df$a <- rescale01(df$a)
df$b <- rescale01(df$b)
df$c <- rescale01(df$c)
df$d <- rescale01(df$d)
print(df) # All values within each variables were scaled succesfully

library(agridat)
agridat::alwan.lamb
agridat::adugna.sorghum
head(adugna.sorghum)
rescale01(adugna.sorghum$yield)

