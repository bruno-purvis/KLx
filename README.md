# KLx assessement

This QA Challenge has been developed in Robot Framework, using the library: "SeleniumLibrary" whose versions are the following:

robotframework==3.2.2
robotframework-seleniumlibrary==4.5.0

# Installation

In order to install Robot Framework, please refer to the following tutorial:
https://www.coditation.com/blog/install-robot-framework-on-windows

The browser used is: "Chrome".
In order to be able to execute these test cases you need to install de driver of your browser. In this case: "Chrome".

1 - Download the Chrome driver version according to the version of your Chrome browser. Please, refer to the following webpage:
https://chromedriver.chromium.org/

2 - Unzip de file.

3 - Put the driver file on a location of your choice.

4 - Edit the environment variables of your Operating System and add the location of the driver in "User Variables" -> Path.

5 - Open up the terminal and navigate to the location of the Robot script.

6 - Execute the following command:
    robot  -d  ../test-results   -x   XUnit.xml   automationExercise.robot

7 - For further commands, please refer to the section: "6.2.1   Command line options for test execution" of the Robot Framework user guide:
https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html

# Assessment

1. Launch browser
2. Navigate to page 'http://automationexercise.com'
3. Navigate to page 'Products'
4. Verify if search bar is visible
5. write 'men tshirt'
6. Click on 'search button'
7. Verify 'men tshirt' is visible
8. Add product to cart
9. Add a second item to the cart (your choice)
10. Click on 'Cart' button
11. verify that product are visible in cart
12. verify that the sum of the product values is correct

# Test results

The test result is located in the folder: "test-results".