*** Settings ***
Documentation   Xpath expressions used in the Products page.

*** Variables ***
#-------------------------------------------------------
                         # INPUT
#-------------------------------------------------------
# search bar
${xpathSearchBar}            //input[@id="search_product"]

#-------------------------------------------------------
                         # BUTTON
#-------------------------------------------------------
# Submit button on the search bar 
${xpathSubmitSearchButton}   //button[@id="submit_search"]
# Continue shopping button
${xpathContinueShoppingButton}   //button[text()="Continue Shopping"]

#-------------------------------------------------------
                         # PARAGRAPGH
#-------------------------------------------------------
# Product name
${xpathProductName}            //div[contains(@class, "single-products")]//descendant::p[text()="nameOfTheProduct"]

#-------------------------------------------------------
                         # HYPERLINK
#-------------------------------------------------------
# search bar
${xpathSearchBar}            //input[@id="search_product"]
# Add to cart
${xpathAddToCartHyperlink}   ${xpathProductName}/ancestor::div[contains(@class, "single-products")]/descendant::a
# View cart
${xpathViewCartHyperlink}    //u[text()="View Cart"]/ancestor::a