*** Settings ***
Documentation   A test suite containing a test case related to the e-commerce website: "http://automationexercise.com"

Library  String
Library  Collections
Library  SeleniumLibrary

Resource  ${CURDIR}${/}..${/}common-resources${/}variables${/}environment.robot
Resource  ${CURDIR}${/}..${/}common-resources${/}variables${/}productsNames.robot

Resource  ${CURDIR}${/}..${/}common-resources${/}keywords${/}mainMenu.robot
Resource  ${CURDIR}${/}..${/}common-resources${/}keywords${/}pages${/}cartPage.robot
Resource  ${CURDIR}${/}..${/}common-resources${/}keywords${/}pages${/}productsPage.robot

Suite Setup        Run Keywords
...                Set Selenium Implicit Wait     2s
...      AND       Open Browser    browser=${browser}    url=${urlHomePage}
...      AND       Wait Until Location Is   ${urlHomePage}  timeout=5s
...      AND       Maximize Browser Window

Suite Teardown     Close all browsers

*** Test Cases ***
Accept_Add_Two_Products_To_Cart_Validate_Sum_Of_Values
   [Documentation]    We go to the e-commerce website: "http://automationexercise.com" and
   ...                validate if the search bar is visible. At this point, we search for
   ...                the product "Men Tshirt", validate if it is visible and add it to cart.
   ...                Then a second product is chosen: "Blue Top" also validating if it is
   ...                visible and adding it to cart. We go now to the cart page verifying
   ...                if these both products are visible and validating the sum of their values.
   [Tags]             AutomationExercise_E2E

   Go to Products page
   Search bar should be visible
   Search product and validate if it is visible   ${menTshirt}
   Add product to cart  ${menTshirt}
   Click Continue Shopping
   Search product and validate if it is visible   ${blueTop}
   Add product to cart  ${blueTop} 
   Click View Cart
   Verify that product is visible in cart
   ...    ${menTshirt}
   ...    ${blueTop}
   Validate the sum of the product values