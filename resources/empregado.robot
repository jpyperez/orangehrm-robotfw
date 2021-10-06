*** Settings ***
Resource    util/keywords.robot

*** Variable ***
${DIV_EMPLOYEE_DETAILS}    id=employee-details
${TXT_FIRST_NAME}    id=firstName
${TXT_LAST_NAME}    id=lastName
${TXT_USERNAME}    id=user_name
${TXT_PASSWORD}    id=user_password
${TXT_CONFIRM_PASSWORD}    id=re_password
${BTN_SAVE}    id=btnSave

*** Keywords ***
Quando cadastro o empregado com os dados obrigatórios
    [Arguments]    &{_employee}
    Digitar texto em    ${TXT_FIRST_NAME}    ${_employee['First Name']}
    Digitar texto em    ${TXT_LAST_NAME}    ${_employee['Last Name']}

    Clicar em    ${BTN_SAVE}
    Set Test Variable    ${_employee}

Quando cadastro o empregado com login
    [Arguments]    &{_employee}
    Digitar texto em    ${TXT_FIRST_NAME}    ${_employee['First Name']}
    Digitar texto em    ${TXT_LAST_NAME}    ${_employee['Last Name']}

    Clicar em    id=chkLogin

    Digitar texto em    ${TXT_USERNAME}    ${_employee['Username']}
    Digitar texto em    ${TXT_PASSWORD}    ${_employee['Password']}
    Digitar texto em    ${TXT_CONFIRM_PASSWORD}    ${_employee['Password']}

    Clicar em    ${BTN_SAVE}
    Set Test Variable    ${_employee}
    

Então o sistema deve exibir a tela de detalhes do empregado
    Wait Until Element Is Visible    ${DIV_EMPLOYEE_DETAILS}
    Element Should Be Visible    ${DIV_EMPLOYEE_DETAILS}

E o nome do empregado deve ser exibido
    Element Should Be Visible    xpath=//div[@id="profile-pic"]/h1[text()="${_employee['First Name']} ${_employee['Last Name']}"]

Então os campos de primeiro e ultimo nome devem apresentar a mensagem de campo required
    Element Should Be Visible    xpath=//span[@for="firstName"][text()="Required"]
    Element Should Be Visible    xpath=//span[@for="lastName"][text()="Required"]

Então os campos de primeiro nome deve apresentar a mensagem de campo required
    Element Should Be Visible    xpath=//span[@for="firstName"][text()="Required"]
    Element Should Not Be Visible    xpath=//span[@for="lastName"][text()="Required"]

Então os campos de ultimo nome deve apresentar a mensagem de campo required
    Element Should Not Be Visible    xpath=//span[@for="firstName"][text()="Required"]
    Element Should Be Visible    xpath=//span[@for="lastName"][text()="Required"]