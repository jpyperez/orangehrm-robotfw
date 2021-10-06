*** Settings ***
Resource    util/keywords.robot

*** Variable ***
${DIV_USER_INFO}    id=systemUser-information
${DIV_USER}    id=systemUser
${BTN_ADD}    id=btnAdd
${BTN_DELETE}    id=btnDelete
${COMBOBOX_USER_TYPE}    id=systemUser_userType
${TXT_EMPLOYEE_NAME}    id=systemUser_employeeName_empName
${TXT_USERNAME}    id=systemUser_userName
${COMBOBOX_STATUS}    id=systemUser_status
${TXT_PASSWORD}    id=systemUser_password
${TXT_CONFIRM_PASSWORD}    id=systemUser_confirmPassword
${BTN_SAVE}    id=btnSave
${BTN_SEARCH}    id=searchBtn
${TXT_SEARCH_USERNAME}    id=searchSystemUser_userName
${BTN_MODAL_OK}    id=dialogDeleteBtn

*** Keywords ***
Quando cadastro o usuario com os dados
    [Arguments]    &{_user}
    Wait Until Element Is Visible     ${DIV_USER_INFO}
    Clicar em    ${BTN_ADD}

    Wait Until Element Is Visible     ${DIV_USER}

    Select From List By Label    ${COMBOBOX_USER_TYPE}    ${_user['User Role']}
    Digitar texto em    ${TXT_EMPLOYEE_NAME}    ${_user['Employee Name']}
    Digitar texto em    ${TXT_USERNAME}    ${_user['Username']}
    Select From List By Label    ${COMBOBOX_STATUS}    ${_user['Status']}
    Digitar texto em    ${TXT_PASSWORD}    ${_user['Password']}
    Digitar texto em    ${TXT_CONFIRM_PASSWORD}    ${_user['Password']}

    Wait Until Element Is Visible    xpath=//span[@id="systemUser_password_strength_meter"][not(@class="passwordStrengthCheck")]

    Clicar em    ${BTN_SAVE}
    Set Test Variable    ${_user}

Quando deleto o usuario "${_username}"
    Digitar texto em    ${TXT_SEARCH_USERNAME}    ${_username}
    Clicar em    ${BTN_SEARCH}

    Clicar em    xpath=//*[text()="${_username}"]/../..//input[@type="checkbox"]
    Clicar em    ${BTN_DELETE}
    Clicar em    ${BTN_MODAL_OK}

    Set Test Variable    ${_username}

Então o sistema deve exibir a tela de usuarios
    Wait Until Element Is Visible    ${DIV_USER_INFO}
    Element Should Be Visible    ${DIV_USER_INFO}

E a mensagem de sucesso deve ser exibida
    Element Should Be Visible    xpath=//div[@class="message success fadable"]

Então a mensagem de sucesso deve ser exibida
    Element Should Be Visible    xpath=//div[@class="message success fadable"]

E o registro não deve ser exibido
    Digitar texto em    ${TXT_SEARCH_USERNAME}    ${_username}
    Clicar em    ${BTN_SEARCH}
    Element Should Not Be Visible    xpath=//*[text()="${_username}"]