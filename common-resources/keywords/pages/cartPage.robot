*** Settings ***
Documentation   Keywords used in the cart page.

Resource  ${CURDIR}${/}..${/}..${/}locators${/}cartPage.robot

*** keywords ***
Verify that product is visible in cart
    [Arguments]    @{listOfItems}

    FOR    ${productName}  IN  @{listOfItems}
      ${xpathProductName}=   Replace String    ${xpathNameOfTheProductHyperlink}   nameOfTheProduct   ${productName}
      Element Should Be Visible    ${xpathProductName}
    END


Get all products names in cart

     @{listOfAllProductsInCart}=  Create List
     ${listOfAllProducts}=   Get WebElements   ${xpathNameAllProductsNamesHyperlink}
     FOR  ${productName}  IN  @{listOfAllProducts}
        Append To List    ${listOfAllProductsInCart}   ${productName.text}   
     END
     [Return]   @{listOfAllProductsInCart}


Get price of product in cart
    [Arguments]    ${productName}

    ${xpathProductPrice}=   Replace String    ${xpathPriceOfAProductInCart}   nameOfTheProduct   ${productName}
    ${productPrice}=   Get Text  ${xpathProductPrice}

    [Return]   ${productPrice}


Get quantity of product in cart
    [Arguments]    ${productName}

    ${xpathProductQuantity}=   Replace String    ${xpathQuantityOfTheProduct}   nameOfTheProduct   ${productName}
    ${productQuantity}=   Get Text  ${xpathProductQuantity}

    [Return]   ${productQuantity}    


 Get total price of product in cart
    [Arguments]    ${productName}

    ${xpathTotalPriceOfProduct}=   Replace String    ${xpathTotalOfAProductInCart}   nameOfTheProduct   ${productName}
    ${productTotalPrice}=   Get Text  ${xpathTotalPriceOfProduct}

    [Return]   ${productTotalPrice}


Validate the sum of the product values
    [Documentation]    After getting a list of all product names in cart, a FOR loop is
    ...                done to iterate over it. In each iteration we get the price of the
    ...                correspondent item and its quantity in cart. The expected sum value
    ...                is then calculated and, at this point, we get the total price value
    ...                of the product and validate it against the expected value previously
    ...                calculated. 

    @{listOfAllProductsInCart}=   Get all products names in cart

    FOR  ${productName}  IN  @{listOfAllProductsInCart}
      ${productPrice}=   Get price of product in cart    ${productName}
      
      # Considering that the price of the product is, for instance: "Rs. 400",
      # we need to split this string in order to get just the value: "400",
      # in order for us to be able to calculate its total value.
      ${productPrice}=   Fetch From Right  ${productPrice}   ${SPACE}

      # Getting the quantity of the product that we want to buy.
      ${productQuantity}=   Get quantity of product in cart    ${productName}

      # Calculating the expected product total price 
      ${expectedProductTotalPrice}=   Evaluate   ${productPrice} * ${productQuantity}

      # Concatenating "Rs." with the expected product total price in order to be in the format:
      # "Rs. 400", in order to be able to compare it with the product total price in cart
      ${expectedProductTotalPrice}=   Catenate   SEPARATOR=${SPACE}   Rs.   ${expectedProductTotalPrice}   

      ${productTotalPrice}=   Get total price of product in cart   ${productName}

      # Validating if the product total price is equal to the expected one.
      Should Be Equal As Strings   ${expectedProductTotalPrice}    ${productTotalPrice}   
    END