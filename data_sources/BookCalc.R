add <- function(a, b) {
  res <- a + b;
  return(res);
}
subtract <- function(a, b) {
  res <- a - b;
  return(res);
}
product <- function(a, b) {
  res <- a * b;
  return(res);
}
division <- function(a, b) {
  res <- a / b;
  return(res);
}
print("Select your option: ");
print("1. Add");
print("2. Subtract");
print("3. Product");
print("4. Division");

opt <- as.integer(readline(prompt = "> "));
firstNum<- as.integer(readline(prompt="Enter first number: "));
secondNum<- as.integer(readline(prompt="Enter second number:
"));

res <- 0;
if(opt == 1) {
  res <- add(firstNum, secondNum);
} else if(opt == 2) {
  res <- subtract(firstNum, secondNum);
} else if(opt == 3) {
  res <- product(firstNum, secondNum);
} else if(opt == 4) {
  res <- division(firstNum, secondNum);
} else {
  print("Error. ");
}
print(res);