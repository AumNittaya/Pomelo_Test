*** Variables ***
${test_site}                            https://www.pomelofashion.com/th/en/
${browser}                              Chrome
${invalidVoucherMsg}                    Invalid voucher code
${login_header}                         //header//Button/span[contains(text(), "Login")]
${shopBtn}                              //header//Button/span[contains(text(), "Shop")]
${dressesLink}                          //nav[contains(@class, "menu-link_tree-content dropdown_list__active")]//ul//li//a[text()="Dresses"]
${dressImg}                             //picture//img[@alt="Dresses"]
${shoppingBagBtn}                       //header//li[@data-cy="nav_user__cart"]
${addToCartBtn}                         //div[contains(@class, "product-item")]//div[@class="product__link__description"]/a/span[text()="{{productName}}"]/../../..//div[@class="product-hover-interactions__add-to-bag"]
${sizeBtn}                              //div[contains(@class, "product-item")]//div[@class="product__link__description"]/a/span[text()="{{productName}}"]/../../..//div[@class="product-hover-interactions__add-to-bag"]//span[text()="{{size}}"]
${closeNoticeBtn}                       //div[contains(@class, "cart-notice-container")]//span[contains(@class, "cart-notice__close")]
${optionSizeBtn}                        //div[contains(@class, "product-item")]//div[@class="product__link__description"]/a/span[text()="{{productName}}"]/../../..//div[@class="product-hover-interactions__add-to-bag"]//div[@class="option-item"]
${removeProductElements}                //div[contains(@class, "cart-remove")]
${removeProductElementBtn}              (//div[contains(@class, "cart-remove")])[1]
${emptyCart}                            //div[@class="empty-cart"]
${selectSize}                           //div[contains(@class, "cart-products")]//div[@class="cart-item-info__product-name"]/a[contains(text(), "{{productName}}")]/../../..//div[contains(@class, "cart-item-info__size")]//select
${selectQuantity}                       //div[contains(@class, "cart-products")]//div[@class="cart-item-info__product-name"]/a[contains(text(), "{{productName}}")]/../../..//div[contains(@class, "cart-item-info__quantity")]//select
${promoCodeInput}                       //div[contains(@class, "cart-discount")]//input
${promoCodeButton}                      //div[contains(@class, "cart-discount")]//button
${categoryLink}                         //nav[contains(@class, "menu-link_tree-content dropdown_list__active")]//ul//li//a[text()="{{category}}"]
${proceedToCheckout}                    //button[@data-cy="cart__checkout"]
${emailField}                           //input[@name="email"]
${passwordField}                        //input[@name="password"]
${login_button}                         //button[@data-cy="auth__login__email__button"]
${shipping_message}                     //span[contains(text(),'Select Your Shipping Method')]
${total}                                //div[contains(@class, "cart-payment")]//span[text()="total"]/../span[contains(@class, "price")]
${sub_total}                            //div[contains(@class, "cart-payment")]//span[text()="Sub - Total"]/../span[contains(@class, "price2")]
${discount}                             //div[contains(@class, "cart-payment")]//span[text()="Discount"]/../span[contains(@class, "price2")]
${over_max_qty_text}                    //div[@class="cart-max-quantity-s2s"]
${shipping_menu}                        //span[@class="subtitle1" and contains(text(),'Shipping')]
${below_min_total_text}                 //div[@class="jsx-135013626 pomelo-snack-bar__content"]
${quantity_popup}                       //span[@class="jsx-3085112337 pml-badge__content pml-badge__content-pri caption pml-badge-top-right pml-badge__circle"]           
${close_cart_button}                    //span[@class="jsx-1694967188 pomelo-icon svg-close pomelo-icon-clickable"]
${fullname}                             //span[@class="jsx-3383453402 body2 welcome-msg"]
${error_popup}                          //div[@class="jsx-3593321886 pml-dialog__container"]
${categoryList}                         //div[@id="modal"]/nav[contains(@class, 'dropdown_list__active')]
${productNameList}                      //div[contains(@class, "product-item")]//div[@class="product__link__description"]/a/span
${categoryTitle}                        //div[contains(@class, "category-body__wrapper")]//h1[text()="{{category}}"]

${expected_max_qty_message}             15 items is the maximum quantity that can be tried on for free.
${expected_below_min_total_message}     You have not reached the minimum amount 4200 ฿ required to use this voucher.
${email}                                {{youremail}}
${password}                             {{yourpassword}}
${Workbook_path}                        ${EXECDIR}\\Test_Data\\Test_Case.xlsx
${header_row}                           1