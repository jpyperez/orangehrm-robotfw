*** Settings ***
Resource    ../resources/util/keywords.robot
Resource    ../resources/util/menu.robot
Resource    ../resources/login.robot
Resource    ../resources/empregado.robot

Test Teardown    Finalizar teste

*** Test Case ***
Cadastrar empregado com primeiro e ultimo nome em branco
    Dado que estou logado com "admin" e "admin123"
    E acesso a tela "PIM > Add Employee"
    Quando cadastro o empregado com os dados obrigatórios
    ...    First Name=${empty}    Last Name=${empty}
    Então os campos de primeiro e ultimo nome devem apresentar a mensagem de campo required

Cadastrar empregado com primeiro nome em branco
    Dado que estou logado com "admin" e "admin123"
    E acesso a tela "PIM > Add Employee"
    Quando cadastro o empregado com os dados obrigatórios
    ...    First Name=${empty}    Last Name=Spencer
    Então os campos de primeiro nome deve apresentar a mensagem de campo required

Cadastrar empregado com ultimo nome em branco
    Dado que estou logado com "admin" e "admin123"
    E acesso a tela "PIM > Add Employee"
    Quando cadastro o empregado com os dados obrigatórios
    ...    First Name=Katarina    Last Name=${empty}
    Então os campos de ultimo nome deve apresentar a mensagem de campo required

Cadastrar empregado com dados obrigatórios
    Dado que estou logado com "admin" e "admin123"
    E acesso a tela "PIM > Add Employee"
    Quando cadastro o empregado com os dados obrigatórios
    ...    First Name=Katarina    Last Name=Spencer
    Então o sistema deve exibir a tela de detalhes do empregado
    E o nome do empregado deve ser exibido

Cadastrar empregado com login
    Dado que estou logado com "admin" e "admin123"
    E acesso a tela "PIM > Add Employee"
    Quando cadastro o empregado com login
    ...    First Name=Alice    Last Name=Garden    Username=agarden
    ...    Password=Change@135
    Então o sistema deve exibir a tela de detalhes do empregado
    E o nome do empregado deve ser exibido