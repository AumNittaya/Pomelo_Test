*** Keywords ***
U - Input Text
    [Arguments]                     ${element}                          ${text}
    Check Exist Element             ${element}
    Input Text                      ${element}                          ${text}
    
U - Click Element
    [Arguments]                     ${element}
    Check Exist Element             ${element}
    Click Element                   ${element}
    
U - Select From List By Label
    [Arguments]                     ${element}                          ${label}
    Check Exist Element             ${element}
    Select From List By Label       ${element}                          ${label}

Open Pomelo Site
    Close All Browsers    
    Open Browser                    ${test_site}                        browser=${browser}
    Check Exist Element             ${shopBtn}
    Maximize Browser Window
    
Click Shop Button
    U - Click Element               ${shopBtn}
    Check Exist Element             ${categoryList}

Click Dress Category
    U - Click Element               ${dressesLink}
    Check Exist Element             ${dressImg}

Add Product To Cart
    [Arguments]                     ${productName}                      ${size}
    ${addToCartBtn}                 Replace String                      ${addToCartBtn}                      {{productName}}                     ${productName}
    ${sizeBtn}                      Replace String                      ${sizeBtn}                           {{productName}}                     ${productName}
    ${sizeBtn}                      Replace String                      ${sizeBtn}                           {{size}}                            ${size}
    ${optionSizeBtn}                Replace String                      ${optionSizeBtn}                     {{productName}}                     ${productName}
    SeleniumLibrary.Mouse Over      ${addToCartBtn}
    Check Exist Element             ${sizeBtn}  
    ${status}                       Run Keyword And Return Status       Wait Until Element Is Visible        ${sizeBtn}                          timeout=5        
    IF  ${status} != ${True}
        U - Click Element           ${optionSizeBtn}
        U - Click Element           ${sizeBtn}
    ELSE
        U - Click Element           ${sizeBtn}
    END
    Check Exist Element             //div[contains(@class, "cart-notice-container")]
    ${noticeBtn_status}             Run Keyword And Return Status        Wait Until Element Is Visible       ${closeNoticeBtn}                   timeout=5
    IF  ${noticeBtn_status} == True
        U - Click Element           ${closeNoticeBtn}
    END

Click Shopping Bag Button
    Check Exist Element             ${shoppingBagBtn}
    U - Click Element               ${shoppingBagBtn}

Clear All Product In Shopping Bag 
    Check Exist Element    ${removeProductElements}
    ${removeElementsSize}           Get Element Count                   ${removeProductElements}             
    FOR  ${i}  IN RANGE  ${removeElementsSize}
        Check Exist Element         ${removeProductElementBtn}
        U - Click Element           ${removeProductElementBtn}
    END
    Check Exist Element             ${emptyCart}

Add Promo Code
    Check Exist Element             ${promoCodeInput}
    U - Input Text                  ${promoCodeInput}                   ${testCaseData}[0][Promo_Code]
    U - Click Element               ${promoCodeButton}

Verify Invalid Voucher Message
    Page Should Contain             ${invalidVoucherMsg}

Initial Test Data
    ${wb}                           Open Excel Workbook                 ${Workbook_path}
    ${ws}                           Select Excel Worksheet              ${wb}                                Test Case
    ${testData}                     Read Excel Sheet                    ${ws}
    ${wsDetail}                     Select Excel Worksheet              ${wb}                                Test Data
    ${testDataDetail}               Read Excel Sheet                    ${wsDetail}
    Set Suite Variable              ${testData}                         ${testData}
    Set Suite Variable              ${testDataDetail}                   ${testDataDetail}

Get Test Case Data
    ${testCaseData}                 Filter Json Array                   ${testData}                          Test_Case_ID                        ${TEST NAME}
    Set Suite Variable              ${testCaseData}
    ${testCaseDataDetail}           Filter Json Array                   ${testDataDetail}                    Test_Case_ID                        ${TEST NAME}
    Set Suite Variable              ${testCaseDataDetail}

Write Validate Discount Result
    [Arguments]                     ${result}                           ${test_case_id}
    ${wb}                           Open Excel Workbook                 ${Workbook_path}
    ${ws}                           Select Excel Worksheet              ${wb}                                Test Result           
    ${test_case_id_column}          Find Column Index in Row            ${ws}                                ${header_row}                       Test_Case_ID
    ${row}                          Find Row Index in Column            ${ws}                                ${test_case_id_column}              ${test_case_id}
    ${column}                       Find Column Index in Row            ${ws}                                ${header_row}                       Validate_Discount_Result
    Write Cell                      ${ws}                               ${row}                               ${column}                           ${result}
    Save Excel Workbook             ${wb}                               ${Workbook_path}

Write Validate Total Result
    [Arguments]                     ${result}                           ${test_case_id}
    ${wb}                           Open Excel Workbook                 ${Workbook_path}
    ${ws}                           Select Excel Worksheet              ${wb}                                Test Result             
    ${test_case_id_column}          Find Column Index in Row            ${ws}                                ${header_row}                       Test_Case_ID
    ${row}                          Find Row Index in Column            ${ws}                                ${test_case_id_column}              ${test_case_id}
    ${column}                       Find Column Index in Row            ${ws}                                ${header_row}                       Validate_Total_Result
    Write Cell                      ${ws}                               ${row}                               ${column}                           ${result}
    Save Excel Workbook             ${wb}                               ${Workbook_path}

Add Product To Shopping Cart
    ${error_status}                 Run Keyword And Return Status       Wait Until Element Is Visible        ${error_popup}
    IF  ${error_status} == True
                                    Reload Page    
    END
    Check Exist Element             ${shopBtn}
    ${previousCategory}             Set Variable                        ${EMPTY}
    FOR  ${item}  IN  @{testCaseDataDetail}
        IF  '${item}[Product_Category]' != '${previousCategory}'
                                    Click Shop Button
                                    ${categoryLinkSelect}               Replace String                       ${categoryLink}                     {{category}}                ${item}[Product_Category]
                                    U - Click Element                   ${categoryLinkSelect}
                                    Check Exist Element                 //div[contains(@class, "product-item")]
        END
        Add Product To Cart         ${item}[Product_Name]               ${item}[Size]
        ${previousCategory}         Set Variable                        ${item}[Product_Category]
    END
    Click Shopping Bag Button 
    FOR  ${item}  IN  @{testCaseDataDetail}
        Edit Size and Quantity      ${item}[Product_Name]               ${item}[Edited_Size]                  ${item}[Quantity]
    END

Edit Size and Quantity
    [Arguments]                     ${productName}                      ${size}=None                          ${quantity}=None
    ${selectSize}                   Replace String                      ${selectSize}                         {{productName}}                    ${productName}
    ${selectQuantity}               Replace String                      ${selectQuantity}                     {{productName}}                    ${productName}
    IF  '${size}' != 'None'
                                    U - Select From List By Label       ${selectSize}                         ${size}
    END
    IF  '${quantity}' != 'None'
                                    U - Select From List By Label       ${selectQuantity}                     ${quantity}
    END

Proceed To Checkout
    Check Exist Element            ${proceedToCheckout}
    Click Element                  ${proceedToCheckout}

Log In
    IF  '${testCaseData}[0][SignIn_Flag]' == 'Yes'   
        IF  '${testCaseData}[0][SignIn_Type]' == 'Pomelo'
                                   Check Exist Element                  ${login_header}
                                   Click Element                        ${login_header}
                                   Check Exist Element                  ${emailField}
                                   U - Input Text                       ${emailField}                         ${email}
                                   U - Input Text                       ${passwordField}                      ${password}
                                   Click Element                        ${login_button}
        END        
    END

Validate Shipping Page
    Check Exist Element            ${shipping_menu}

Validate Sign In Page
    Check Exist Element            ${emailField}
             
Validate Total in Cart
    [Arguments]                     ${test_case_id}
    Check Exist Element             ${sub_total}
    ${sub_total}                    SeleniumLibrary.Get Text            ${sub_total}
    ${sub_total}                    Replace String                      ${sub_total}                          ${SPACE}฿                          ${EMPTY}
    ${sub_total}                    Replace String                      ${sub_total}                          ,                                  ${EMPTY}   
    IF  '${testCaseData}[0][PromoCode_Flag]' == 'Yes' 
                                    Check Exist Element                 ${discount}   
                                    ${discount}                         SeleniumLibrary.Get Text              ${discount}
                                    ${discount}                         Replace String                        ${discount}                        -                                ${EMPTY}
                                    ${discount}                         Replace String                        ${discount}                        ${SPACE}฿                        ${EMPTY}
                                    ${discount}                         Replace String                        ${discount}                        ,                                ${EMPTY}
                                    ${percent_discount}                 Evaluate                              ${testCaseData}[0][Percent_Discount] / 100
                                    ${expected_discount}                Evaluate                              ${sub_total} * ${percent_discount}
                                    ${expected_discount}                Evaluate                              "%.0f" % ${expected_discount}
                                    ${expected_total}                   Evaluate                              ${sub_total} - ${expected_discount}
        IF  '${discount}' == '${expected_discount}'
                                    ${validate_discount_result}         Set Variable                           PASS
        ELSE
                                    ${validate_discount_result}         Set Variable                           FAIL - An expected discount is ${expected_discount}, but an acutal discount is ${discount}
        END       
        Write Validate Discount Result                                  ${validate_discount_result}            ${test_case_id}
    ELSE
                                    ${expected_total}                   Set Variable                           ${sub_total}
    END  
    Check Exist Element             ${total}
    ${actual_total}                 SeleniumLibrary.Get Text            ${total}
    ${actual_total}                 Replace String                      ${actual_total}                       ${SPACE}฿                          ${EMPTY}
    ${actual_total}                 Replace String                      ${actual_total}                       ,                                  ${EMPTY}
    IF  '${actual_total}' == '${expected_total}'                      
                                    ${validate_total_result}            Set Variable                           PASS
    ELSE
                                    ${validate_total_result}            Set Variable                           FAIL - An expected total is ${expected_total}, but an actual total is ${actual_total}
    END   
    Write Validate Total Result     ${validate_total_result}            ${test_case_id}

Validate Over Maximum Quantity in Shopping Cart Message
    Check Exist Element            ${over_max_qty_text}
    ${actual_text}                 Get Text                             ${over_max_qty_text}
    Should Be Equal                ${actual_text}                       ${expected_max_qty_message}

Validate Below Minimum Total in Shopping Cart Message
    Check Exist Element            ${below_min_total_text}
    ${actual_text}                 Get Text                             ${below_min_total_text}
    Should Be Equal                ${actual_text}                       ${expected_below_min_total_message}

Check Quantity in Cart
    Check Exist Element            ${fullname}
    ${qty_status}                  Run Keyword And Return Status        Wait Until Element Is Visible          ${quantity_popup}
    IF  ${qty_status} == True
                                   Check Exist Element                  ${quantity_popup}
                                   ${current_qty}                       Get Text                               ${quantity_popup}
                                   ${current_qty}                       Convert To Integer                     ${current_qty}
                                   U - Click Element                    ${shoppingBagBtn}
                                   Clear All Product In Shopping Bag
                                   U - Click Element                    ${close_cart_button}
    END

Check Exist Element
    [Arguments]                    ${element}
    FOR  ${i}  IN RANGE  10
        ${status}                  Run Keyword And Return Status        Wait Until Element Is Visible          ${element}                   timeout=2
        IF  '${status}' == 'True'
                                   Exit For Loop      
        END
    END