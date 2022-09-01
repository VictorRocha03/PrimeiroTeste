*** Settings ***
Library            SeleniumLibrary

*** Variables ***
${url}        http:\\www.amazon.com.br
${MENU_LIVROS}     //a[@href='/Livros/b/?ie=UTF8&node=6740748011&ref_=nav_cs_books'][contains(.,'Livros')]
${HEADER_LIVROS}   //h1[contains(.,'Loja de Livros')] 
${TEXTO_HEADER_LIVROS}  Loja de Livros

*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window


Fechar o navegador
    Capture Page Screenshot
    Close Browser
Acessar a home page do site Amazon.com.br    
    Go To    url=${url}

Entrar no menu "Livros"
    sleep  10s    
    Wait Until Element Is Visible    locator=${MENU_LIVROS} 
    Click Element    locator=${MENU_Livros} 

Verificar se aparece a frase Loja de livros
    Wait Until Page Contains    text=${TEXTO_HEADER_LIVROS}
    Wait Until Element Is Visible    locator=${HEADER_LIVROS}

Verificar se o título da página fica "${TITULO}"
    sleep  10s 
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
  Element Should Be Visible    locator=//span[@class='a-size-large a-text-bold a-nowrap'][contains(.,'${NOME_CATEGORIA}')]


###########caso de teste 02 
Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}

Clicar no botão de pesquisa 
    Click Element    locator=nav-search-submit-button 

Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=(//span[contains(.,'${PRODUTO}')])[2]


    ##### Caso de Teste 03 - Adicionar Produto no Carrinho #####
Adicionar o produto "Console Xbox Series S" no carrinho
    Click Image    locator=//img[contains(@alt,'Console Xbox Series S')]
    Click Button    locator=add-to-cart-button

Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso 
    sleep  10s 
    Click Element    locator=//span[@class='a-button a-spacing-top-base a-button-span12 a-button-base'][contains(.,'Ir para o carrinho')]

    





   ##### Caso de Teste 04 - Remover Produto do Carrinho #####
Remover o produto "Console Xbox Series S" do carrinho
    Click Button    locator=//input[@value='Excluir']
Verificar se o carrinho fica vazio
    Wait Until Element Is Visible    locator=//h1[@class='a-spacing-mini a-spacing-top-base'][contains(.,'Seu carrinho de compras da Amazon está vazio.')]
    




#STEPS

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br  

Quando acessar o menu "Livros"
    Entrar no menu "Livros"

Então o título da página deve ficar "Livros | Amazon.com.br"
    Verificar se aparece a frase Loja de livros
    Verificar se o título da página fica "Livros | Amazon.com.br"

E o texto "Loja de livros" deve ser exibido na página
    Verificar se aparece a categoria "Livros em Oferta"

Quando pesquisar pelo produto "Xbox Series S"
     Digitar o nome de produto "Xbox Series S" no campo de pesquisa
     Clicar no botão de Pesquisa 

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
     Verificar se o título da página fica "Amazon.com.br : Xbox Series S"

E um produto da linha "Xbox Series S" deve ser mostrado na página    
     Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"




     #STEPS 

Quando adicionar o produto "Console Xbox Series S" no carrinho
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho

Então o produto "Console Xbox Series S" deve ser mostrado no carrinho     
     Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

      #STEPS 
E existe o produto "Console Xbox Series S" no carrinho  
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

Quando remover o produto "Console Xbox Series S" do carrinho
      Remover o produto "Console Xbox Series S" do carrinho

Então o carrinho deve ficar vazio
     Verificar se o carrinho fica vazio
