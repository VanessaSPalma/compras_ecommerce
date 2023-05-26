*** Settings ***

Library        SeleniumLibrary

*** Variables ***

${input_username}        id:user-name
${input_password}        id:password
${button_login}          id:login-button
${item1_backpack}        id:add-to-cart-sauce-labs-backpack
${item2_bikelight}       id:add-to-cart-sauce-labs-bike-light
${shopping_cart_link}    id:shopping_cart_container
${button_checkout}       id:checkout
${input_firstname}       id:first-name
${input_lastname}        id:last-name
${input_postal-code}     id:postal-code
${button_continue}       id:continue
${button_finish}         id:finish


*** Keywords ***

Abrir site do e-commerce
    Open Browser     https://www.saucedemo.com/     Chrome

Preencher campos username e password
    Input Text            ${input_username}         standard_user
    Input Text            ${input_password}         secret_sauce  
    
Clicar em botão "Login"
    Click Button          ${button_login}
    
Inserir itens no carrinho
    Click Element         ${item1_backpack}
    Click Element         ${item2_bikelight}

Clicar em item de carrinho de compras
    Click Element         ${shopping_cart_link}

Clicar em botão checkout
    Click Button          ${button_checkout}

Preencher informações de checkout
    Input Text            ${input_firstname}        Maria
    Input Text            ${input_lastname}         do Bairro
    Input Text            ${input_postal-code}      01234-567
    
Clicar em botão continue
    Click Button          ${button_continue}

clicar em botão finish
    Click Button          ${button_finish}

*** Test Cases ***

Cenario 1: Acessar site e-commerce
    Abrir site do e-commerce
    Preencher campos username e password
    Clicar em botão "Login"

Cenario 2: Adicionar dois produtos ao carrinho de compras
    Inserir itens no carrinho

cenario 3: Finalizar compra
    Clicar em item de carrinho de compras
    Clicar em botão checkout
    Preencher informações de checkout
    Clicar em botão continue
    clicar em botão finish