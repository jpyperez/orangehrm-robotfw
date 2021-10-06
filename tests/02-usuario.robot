*** Settings ***
Resource    ../resources/util/keywords.robot
Resource    ../resources/util/menu.robot
Resource    ../resources/login.robot
Resource    ../resources/usuario.robot

Test Teardown    Finalizar teste

*** Test Case ***
Cadastrar usuario de sistema
    Dado que estou logado com "admin" e "admin123"
    E acesso a tela "Admin > User Management > Users"
    Quando cadastro o usuario com os dados
    ...    User Role=Admin    Employee Name=Katarina Spencer    Username=kspencer
    ...    Status=Enabled    Password=Change@135
    Então o sistema deve exibir a tela de usuarios
    E a mensagem de sucesso deve ser exibida

Deletar usuario de sistema
    Dado que estou logado com "admin" e "admin123"
    E acesso a tela "Admin > User Management > Users"
    Quando deleto o usuario "Aravind"
    Então a mensagem de sucesso deve ser exibida
    E o registro não deve ser exibido