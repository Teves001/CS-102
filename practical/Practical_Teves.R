
#A

data ("warpbreaks")

#Find out, in a single command, which columns of warpbreaks are either numeric or nteger.
numeric_columns <- sapply(warpbreaks, is.numeric)
numeric_columns

#Is numeric a natural data type for the columns which are stored as such? Convert tointeger when necessary.
integer_columns <- sapply(warpbreaks, is.integer) 
integer_columns

numeric_or_integer_columns <- warpbreaks[, numeric_columns | integer_columns] 
numeric_or_integer_columns

#Error messages in R sometimes report the underlying type of an object rather than theuser-level class. Derive from the following code and error message what theunderlying type.

for (i in 1:ncol(numeric_or_integer_columns)) {
  if (!is.integer(numeric_or_integer_columns[, i])) {
    numeric_or_integer_columns[, i] <- as.integer(numeric_or_integer_columns[, i]) 
  } 
}

#3 ERROR MESSAGE
#Error in 1:ncol(numeric_or_integer_columns) : argument of length 0

#B
#Read the complete file using readLines.
lines <- readLines("exampleFile.txt")

#Separate the vector of lines into a vector containing comments and a vector containing the data. Hint: use grepl.
comments <- lines[grepl("^//", lines)]
comments

data_lines <- lines[!grepl("^//", lines)]
data_lines

#Extract the date from the first comment line.
date <- gsub("^// Survey data. Created : ", "", comments[1])
date

#a. Split the character vectors in the vector containing data lines by semicolon (;) using strsplit.
split_data <- strsplit(data_lines, ";")
split_data

#Find the maximum number of fields retrieved by split. Append rows that are shorter with NA's.
max_fields <- max(sapply(split_data, length))
max_fields

split_data <- lapply(split_data, function(x) c(x, rep(NA, max_fields - length(x))))
split_data

#Use unlist and matrix to transform the data to row-column format.
data_matrix <- matrix(unlist(split_data), ncol = max_fields, byrow = TRUE)
data_matrix

#From comment lines 2-4, extract the names of the fields. Set these as colnames for the matrix you just created.

fieldNames <- gsub("^// Field [0-9]+: ", "", comments[2:4])
fieldNames

colnames(data_matrix) <- fieldNames
colnames(data_matrix)


