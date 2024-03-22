*** Settings ***
Documentation   Keywords used in the products page.

Resource  ${CURDIR}${/}..${/}..${/}locators${/}productsPage.robot

*** keywords ***
Search bar should be visible
    [Arguments]   ${timeout}=5s
     
    Wait Until Element Is Visible	${xpathSearchBar}   ${timeout}


Search product and validate if it is visible
    [Arguments]   @{listOfProductsNames}

    FOR   ${productName}  IN   @{listOfProductsNames}
       Search product                  ${productName}
       Verify if product is visible    ${productName}
    END
     

Search product
    [Arguments]    ${productName}
     
    Input Text     ${xpathSearchBar}    ${productName}     
    Click Button   ${xpathSubmitSearchButton}
     

Verify if product is visible
    [Arguments]   ${productName}
     
    ${xpathItemName}=    Replace String    ${xpathProductName}     nameOfTheProduct   ${productName}
    Element Should Be Visible    ${xpathItemName}


Add product to cart
    [Arguments]   ${productName}

    ${xpathAddToCart}=   Replace String   ${xpathAddToCartHyperlink}   nameOfTheProduct   ${productName}
    Click Element   ${xpathAddToCart}
     
     
Click Continue Shopping

    Wait Until Element Is Visible   ${xpathContinueShoppingButton}
    Click Button   ${xpathContinueShoppingButton}
     
     
Click View Cart

    Wait Until Element Is Visible   ${xpathViewCartHyperlink}
    Click Element   ${xpathViewCartHyperlink}