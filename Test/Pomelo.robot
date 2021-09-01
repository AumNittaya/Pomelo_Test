*** Settings ***
Library         SeleniumLibrary
Library         String
Library         ${EXECDIR}\\Resources\\CustomLibrary\\CustomExcelLibrary.py
Resource        ${EXECDIR}\\Resources\\Variables\\initialVariable.robot
Resource        ${EXECDIR}\\Resources\\Keywords\\UserDefineKeywords.robot
Suite Setup     Initial Test Data
Test Setup      Get Test Case Data

*** Test Cases ***
TC01
    Open Pomelo Site
    Log In
    Check Quantity in Cart
    Add Product To Shopping Cart
    Add Promo Code
    Validate Total in Cart    ${TEST NAME}
    Proceed To Checkout
    Validate Shipping Page
    Close Browser

TC02
    Open Pomelo Site
    Add Product To Shopping Cart
    Add Promo Code
    Validate Total in Cart    ${TEST NAME}
    Proceed To Checkout
    Validate Sign In Page
    Close Browser

TC03
    Open Pomelo Site
    Add Product To Shopping Cart
    Add Promo Code
    Validate Below Minimum Total in Shopping Cart Message    
    Proceed To Checkout
    Validate Sign In Page
    Close Browser    

TC04
    Open Pomelo Site
    Add Product To Shopping Cart
    Add Promo Code
    Verify Invalid Voucher Message
    Close Browser

TC05
    Open Pomelo Site
    Add Product To Shopping Cart
    Validate Over Maximum Quantity in Shopping Cart Message
    Close Browser    

TC06
    Open Pomelo Site
    Add Product To Shopping Cart
    Clear All Product In Shopping Bag
    Close Browser 