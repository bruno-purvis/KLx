*** Settings ***
Documentation   Xpath expressions used in the Cart page.

*** Variables ***
#-------------------------------------------------------
                         # HYPERLINK
#-------------------------------------------------------
# Product name
${xpathNameOfTheProductHyperlink}       //a[text()="nameOfTheProduct"]
# All products names
${xpathNameAllProductsNamesHyperlink}   //td[@class="cart_description"]/descendant::a

#-------------------------------------------------------
                         # PARAGRAPH
#-------------------------------------------------------
# Price of a product
${xpathPriceOfAProductInCart}           ${xpathNameOfTheProductHyperlink}/ancestor::td/following-sibling::td[contains(@class, "cart_price")]/p
# Total price of a product
${xpathTotalOfAProductInCart}           ${xpathNameOfTheProductHyperlink}/ancestor::td/following-sibling::td[contains(@class, "cart_total")]/p

#-------------------------------------------------------
                         # BUTTON
#-------------------------------------------------------
# Quantity of a product
${xpathQuantityOfTheProduct}            ${xpathNameOfTheProductHyperlink}/ancestor::td/following-sibling::td[contains(@class, "cart_quantity")]/button