#Dataframe Menu
    # Pizza menu
            pizza_menu <- data.frame(
            code = c("ch", "bc", "vg"),
            menu = c("Cheese Pizza", "BBQ Chicken Pizza", "Veggie Pizza"),
            start_price = c(300, 250, 220)
            )

    # Pizza sizes
            size_menu <- data.frame(
             code = c("s", "m", "l"),
             size = c("Small", "Medium", "Large"),
             price = c(0, 100, 200)
            )

    # Beverage menu
        beverage_menu <- data.frame(
            code = c("c", "w", "l"),
            menu = c("Coke", "Water", "Lemonade"),
            price = c(50, 20, 40)
        )

    # Bev sizes
        size_bev <- data.frame(
        code = c("s", "m", "l"),
        size = c("Small", "Medium", "Large"),
        price = c(0, 20, 50)
        )

    #Appitizer
        appitizer_menu <- data.frame(
            code = c("f", "cw", "sc"),
            menu = c("French Fried" , "Chicken Wing BBQ", "Baked Spinach with Cheesh"),
            price = c (80, 129, 159)

        )
#Pizza Bot Function
    pizza_bot <- function () {

        print("Welcome to Minerva's Pizza Delivery")
                flush.console()

        # Initialize variables
            name <- ""
            mobile <- ""
            address <- ""
            orders <- data.frame()

        # Get customer details
            name <- readline("Please enter your name: ")
                    flush.console()

            # Validate mobile
                valid <- FALSE

                while(!valid) {

                    mobile <- readline("Please enter your mobile number: ")
                                flush.console()

                    if(!grepl("^[0-9]{10}$", mobile)){
                        print("Invalid mobile, please try again")
                                flush.console()

                    } else {
                        valid <- TRUE
                        mobile <- as.numeric(mobile)
                        }

                }

            address <- readline("Please enter your address: ")
                    flush.console()

        #Call for Pizza order
            pizza_orders <- pizza_order()

            want_beverage <- readline("Do you want to order beverages? (y/n)")
                    flush.console()

                if(want_beverage == "y"){

        #Call for Beverage order
            beverage_orders <- beverage_order()

                } else if (want_beverage == "n"){

        # No beverage orders
            beverage_orders <- NULL

                    } else {
                        print("Invalid input")
                                flush.console()
                    }

        #Asking to order Appitizer
            want_appitizer <- readline("Do you want to order appitizers? (y/n)")
                    flush.console()

                if(want_appitizer == "y"){

        #Call for Appitizer order
             appitizer_orders <-  appitizer_order()

                } else if (want_appitizer == "n"){

        # No appitizer orders
            appitizer_orders <- NULL

                    } else {
                        print("Invalid input")
                                flush.console()
                    }

        # Combine orders
            full_orders <- rbind(pizza_orders, beverage_orders, appitizer_orders)

        # Calculate total
            total <- sum(full_orders$total_price)

        # Print total
            total <- format(total, big.mark=",")

            print("Order summary:")
            print(full_orders)
                    flush.console()

            print(paste("Your total is:", total, "THB"))
                    flush.console()

            print(paste("mobile no.", mobile))
            print(paste("address", address))
                    flush.console()

        # Call for Payment
            get_payment()



# Pizza order loop
    pizza_order <- function(){

    orders <- data.frame()

    order_more <- "y"

        while(order_more == "y") {

        # Order Pizza
            print(pizza_menu)
                        flush.console()
            code <- readline("Choose your pizza (code) : ")
                        flush.console()

                # Validation loop (V.1)
                    valid <- FALSE

                    while(!valid){

                        if(!code %in% pizza_menu$code){
                            print("Invalid code, please try again")
                                 flush.console()
                            code <- readline("Enter code: ")
                                flush.console()
                        } else {
                            valid <- TRUE
                            }

                    }

        #Size pizza
            print(size_menu)
                        flush.console()

            # Validation loop (V.2)
                 valid <- FALSE

                    while(!valid) {

                        # Get size input
                        size <- readline("Which size? (code): ")
                        flush.console()

                        # Check if valid
                        if(!size %in% size_menu$code) {
                            print("Invalid size, please try again")
                                flush.console()

                        } else {
                            valid <- TRUE
                            }

                    }

        #Quantitiy
            qty <- as.numeric(readline("Enter quantity: "))
                     flush.console()


        # Calculate Pizza price
            base_price <- pizza_menu$start_price[pizza_menu$code == code]
            size_price  <- size_menu$price[size_menu$code == size]
            price         <- (base_price + size_price) * qty
                    flush.console()

        #Dataframe for Pizza Order
            # Get pizza name
                pizza_name <- pizza_menu$menu[pizza_menu$code == code]
                     flush.console()

            # Create new row
                new_row <- data.frame(
                    code = code,
                    order = pizza_name,
                    size = size,
                    qty = qty,
                    total_price = price
                )
                    flush.console()

            # Bind to orders
                orders <- rbind(orders, new_row)
                    flush.console()

        #Ask for another order
            order_more <- readline("Order another pizza? (y/n):")
                    flush.console()

        }

    print("Your Pizza order:")
    print(orders)
    flush.console()

    return(orders)
    flush.console()

  }


# Beverage order loop
    beverage_order <- function(){

    orders <- data.frame()

    order_more <- "y"

        while(order_more == "y") {

            print(beverage_menu)
                 flush.console()

            # Get order
            code <- readline("Choose your beverage (code): ")
                        flush.console()

                # Validation loop (V.1)
                    valid <- FALSE

                    while(!valid){

                        if(!code %in% beverage_menu$code){
                            print("Invalid code, please try again")
                                 flush.console()
                            code <- readline("Enter code: ")
                                flush.console()
                        } else {
                            valid <- TRUE
                            }

                    }

            print(size_bev)
                        flush.console()

                # Validation loop (V.2)
                 valid <- FALSE

                    while(!valid) {

                        # Get size input
                        size <- readline("Which size? (code): ")
                        flush.console()

                        # Check if valid
                        if(!size %in% size_bev$code) {
                            print("Invalid size, please try again")
                                flush.console()

                        } else {
                            valid <- TRUE
                            }

                    }

            qty <- as.numeric(readline("Enter quantity: "))
                        flush.console()


            # Calculate price
                base_b_price   <- beverage_menu$price[beverage_menu$code == code]
                size_b_price    <- size_bev$price[size_bev$code == size]

                price              <- (base_b_price + size_b_price) * qty
                                            flush.console()


            #Dataframe for Pizza Orde
                bev_name <- beverage_menu$menu[beverage_menu$code == code]
                        flush.console()

                #Create new row
                    new_row <- data.frame(
                        code = code,
                        order = bev_name,
                        size = size,
                        qty = qty,
                        total_price = price
                    )
                                flush.console()

                #Bind to orders
                    orders <- rbind(orders, new_row)
                        flush.console()

            #Ask for another order
                order_more <- readline("Order another beverage? (y/n)")
                        flush.console()


        }
    print("Your Beverage order:")
    print(orders)
    flush.console()

    return(orders)
    flush.console()

  }

# Appitizer order loop
    appitizer_order <- function(){

    orders <- data.frame()

    order_more <- "y"

        while(order_more == "y") {

            print(appitizer_menu)
                 flush.console()

             # Validation loop  (V.2)
                 valid <- FALSE

                    while(!valid) {

                        # Get order
                        code <- readline("Choose your appitizer (code): ")
                        flush.console()

                        # Check if valid
                        if(!code %in% appitizer_menu$code) {
                            print("Invalid code, please try again")
                                flush.console()

                        } else {
                            valid <- TRUE
                            }

                    }


            size <- "-"

            qty <- as.numeric(readline("Enter quantity: "))
                        flush.console()


            # Calculate price
                base_a_price   <- appitizer_menu$price[appitizer_menu$code == code]

                price              <-  base_a_price * qty
                                            flush.console()


            #Dataframe for Pizza Orde
                appitizer_name <- appitizer_menu$menu[appitizer_menu$code == code]
                        flush.console()

                #Create new row
                    new_row <- data.frame(
                        code = code,
                        order =  appitizer_name,
                        size = size,
                        qty = qty,
                        total_price = price
                    )
                                flush.console()

                #Bind to orders
                    orders <- rbind(orders, new_row)
                        flush.console()

            #Ask for another order
                order_more <- readline("Order another appitizer? (y/n)")
                        flush.console()


        }
    print("Your Appitizer order:")
    print(orders)
    flush.console()

    return(orders)
    flush.console()

  }


# Payment
    get_payment <- function() {

    method <- readline("Cash or Transfer? (c/t) : ")
                        flush.console()

        if(method == "c") {
             print("Thank you for your order.")
                        flush.console()

        } else if (method == "t") {

                print("Please transfer to account no. 2122242362, Kbank")
                        flush.console()

    confirm <- readline("Type 'y' when transfer is complete: ")
                        flush.console()

        if(confirm == "y") {
                print("Payment successful!, Thank you for your order.")
                         flush.console()
        } else {
                print("Please complete mobile payment.")
                            flush.console()
            }

        } else {
            print("Invalid payment method")
                    flush.console()
            }
  }

}
