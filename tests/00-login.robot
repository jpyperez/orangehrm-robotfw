*** Settings ***
Resource    ../resources/util/keywords.robot
Resource    ../resources/login.robot

Test Teardown    Finalizar teste

*** Test Case ***
Logar com usuario e senha em branco
    Dado que estou na tela inicial do sistema
    Quando acesso com "" e ""
    Então o sistema deve exibir a mensagem "Username cannot be empty"

Logar com senha em branco
    Dado que estou na tela inicial do sistema
    Quando acesso com "admin" e ""
    Então o sistema deve exibir a mensagem "Password cannot be empty"

Logar com credenciais invalidas
    Dado que estou na tela inicial do sistema
    Quando acesso com "admin" e "WrongPassword"
    Então o sistema deve exibir a mensagem "Invalid credentials"

Logar com sucesso
    Dado que estou na tela inicial do sistema
    Quando acesso com "admin" e "admin123"
    Então a tela de dashboard deve ser exibida