*** Settings ***
Documentation   Keywords used in the main menu.

Resource  ${CURDIR}${/}..${/}locators${/}mainMenu.robot

*** keywords ***
Go to Products page

    Click Element      ${xpathProductsHyperlink}