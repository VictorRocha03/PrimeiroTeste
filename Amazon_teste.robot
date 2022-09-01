*** Settings ***
Documentation     Essa suíte testa o site da Amazon.com.br
Resource    Amazon_resources.robot
Test Setup        Abrir o navegador 
Test Teardown     Fechar o navegador

*** Test Cases *** 
Caso de teste 01 - Acesso ao menu "Livros"
    [Documentation]    Este teste verifica o menu Livros do site da Amazon.com.br
    [Tags]             Menus
    Acessar a home page do site Amazon.com.br    
    Entrar no menu "Livros"
    Verificar se aparece a frase Loja de livros
    Verificar se o título da página fica "Livros | Amazon.com.br"
    Verificar se aparece a categoria "Livros em Oferta"
 
Caso de teste 02 - Pesquisa de um produto
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]             busca_produtos  lista_busca
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"



Caso de teste 03 - Adicionar Produto no carrinho        
    [Documentation]     Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso


Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Remover o produto "Console Xbox Series S" do carrinho
    Verificar se o carrinho fica vazio