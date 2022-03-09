# Continuous Sampling Plan by H.F. Dodge (1943)

CSP1 <- function(products, f, i){

# Determine number of items in the flow of products
N = length(products)

# This sampling method can be in two states: a "census" and a "sampling" mode
Mode = rep(NA, N)

# At the outset, CSP-1 is in census mode (100% of products sampled until a number i of consecutive products are found without defects)
Mode[1] = "census"

# Results of testing products are recorded in a vector
Test.results = rep(NA, N)

# Count the number of consecutive products without defects
n.consec0 = 0

## Loop over all items
for(item.nb in 1:N){

            # Census mode
	    if(Mode[item.nb] == "census"){
	    
	    # In census mode, an item is tested
	    Test.results[item.nb] = products[item.nb]

	    ifelse(Test.results[item.nb] == 0, # If the item has no defects
	    {n.consec0 = n.consec0 + 1},       # length of consecutive 0 extends
	    {n.consec0 = 0}) # The length of successive products without defects is reset to 0
	    
	    }

	    # Sampling mode
	    if(Mode[item.nb] == "sampling"){

	    # In sampling mode, only a fraction of items are tested
	    if(stats::runif(1, min=0, max=1) < f) Test.results[item.nb] = products[item.nb]

	    ifelse(Test.results[item.nb] == 0, 			 # If item was found to have no defects
	    	{TRUE == TRUE},                			 # do nothing
		{n.consec0 = 0})	 	 # reset the length of consecutive sequences of item without defects to 0
	    }


	    # Define the mode the system will be for next item
	    if(item.nb < N){

	    Mode[item.nb +1] = dplyr::case_when(
	    n.consec0 < i ~ "census",
	    TRUE ~ "sampling")

	    }
	    
} # End of for loop 1:N

return(list("Input" = products,
            "Mode" = Mode,
	    "InspectionOutcome" = Test.results,
	    "Actions" = ifelse(is.na(Test.results), "Not inspected", "Inspected")))
}

