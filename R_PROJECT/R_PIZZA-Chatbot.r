# Homework 01
# Chatbot (rule-based)

menus <- c("Hawaiian", "BBQ Chicken","Double Pepperoni","Cheese Pizza")
Menu <- data.frame(
  menu = c("Hawaiian", "BBQ Chicken ","Double Pepperoni","Cheese Pizza"),
  S = c(120, 110, 130, 90),
  M = c(140, 130, 150, 110),
  L = c(160, 150, 170, 130)
)
sizes <- c("(S)", "(M)", "(L)")
s_prices <- c(200, 400, 300, 350)
m_prices <- s_prices * 1.2
l_prices <- s_prices * 1.5
prices_list <- list(S = s_prices,
                   M = m_prices,
                   L = l_prices)



print("Welcome to The Pizza - Alaho Aloha")
print("I am jukk")

print("What is your name? ")
cust_name <- readLines("stdin", n=1)
print( paste("Hi", cust_name) )
print("What do you want today?")
print("1.Order Pizza  2.Report a problem")
action <- readLines("stdin", n=1)

count_action <- 0
while (count_action >= 0) {
count_action + 1

if (action == 1) {
  print("You choose order pizza.")

count_menu <- 0
  while (count_menu >= 0) {
    count_menu + 1
    print("What do you want to orders today? (1-4)")
    
    print(Menu)
    menu_order <- (readLines("stdin", n=1))
    if (menu_order >= 1 & menu_order <= 4) {
      break
    } else {
      print("Wrong input, Please select again (1-4)")
    }
  }
  menu_order <- as.numeric(menu_order)
  
  
  count_size <- 0
  while (count_size >= 0) {
    count_size + 1
    print("What pizza size would you want? (1-3)")
    print("1.S  2.M  3.L")
    size <- (readLines("stdin", n=1))
    if (size >= 1 & size <= 3) {
      break
    } else {
      print("Wrong input, Please select again (1-3)")
    }
  }
  size <- as.numeric(size)

  
  count_amount <- 0
  while (count_amount >= 0) {
    count_amount + 1
    print( paste("How many", menus[menu_order], "do you want? (0-99)") )
    pizza_amount <- (readLines("stdin", n=1))
    if (pizza_amount >= 01 & pizza_amount <= 99) {
      break
    } else if (pizza_amount == 0) {
      print("Canceling order...")
      q()
    } else {
      print("Wrong input, Please select again")
    }
  }
  pizza_amount <- as.numeric(pizza_amount)


count_membercard <- 0
  while (count_membercard >= 0) {
  count_membercard + 1
    
  print("Do you have member card? (Y/N)")
  member <- readLines("stdin", n=1)

    if (member == "Y") {
    print("Please enter your member card number.")
    member_num <- as.numeric(readLines("stdin", n=1))
    print( paste("Welcome back", cust_name) )
    break

      } else if (member == "N") {
    count_regis <- 0
    while (count_regis >= 0) {
      count_regis + 1
      print("Do you want to register membership? (Y/N)")
      regis_mem <- readLines("stdin", n=1)
      ### if want to register
      if (regis_mem == "Y") {
        print("Please enter your Firstname")
        regis_firstname <- readLines("stdin", n=1)
        print("Please enter your Lastname")
        regis_lastname <- readLines("stdin", n=1)
        print("Please enter your Email")
        regis_email <- readLines("stdin", n=1)
        print("Please enter your DOB (YYYY-MM-DD)")
        regis_dob <- readLines("stdin", n=1)
        print("Successfully Registered!")
        print( paste("Welcome", regis_firstname) )
        member_num <- sample.int(1000000:9999999, 1)
        print( paste("Your member number is:", member_num) )
        break

        } else if (regis_mem == "N") {
        member_num <- 0
        break
        
      } else {
        print("Wrong input, Please select again (Y/N)")
      }
    }
break
      
  } else {
    print("Wrong input, Please select again (Y/N)")
  }
  }

  if (member_num != 0) {
    print("You receive 10 % discount!")
    discount <- 0.90
    } else {
      print("You don't have a membership, Then you will not receive a discount!")
    count_regis_dis <- 0
    while (count_regis_dis >= 0) {
      count_regis_dis + 1
      print("Do you want to register membership? (Y/N)")
      regis_mem <- readLines("stdin", n=1)

      if (regis_mem == "Y") {
        print("Please enter your Firstname")
        regis_firstname <- readLines("stdin", n=1)
        print("Please enter your Lastname")
        regis_lastname <- readLines("stdin", n=1)
        print("Please enter your Email")
        regis_email <- readLines("stdin", n=1)
        print("Please enter your DOB (YYYY-MM-DD)")
        regis_dob <- readLines("stdin", n=1)
        print("Successfully Registered!")
        print( paste("Welcome", regis_firstname) )
        member_num <- sample.int(1000000:9999999, 1)
        print( paste("Your member number is:", member_num) )
        discount <- 0.90
        break
