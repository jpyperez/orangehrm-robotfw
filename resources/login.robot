*** Settings ***
Resource    util/keywords.robot

*** Variable ***
${DASHBOARD}    xpath=//h1[text()="Dashboard"]

*** Keywords ***
Então a tela de dashboard deve ser exibida
    Wait Until Element Is Visible    ${DASHBOARD}
    Element Should Be Visible    ${DASHBOARD}

Então o sistema deve exibir a mensagem "${_message}"
    ${text}=    Retorna texto do elemento    id=spanMessage
    Should Be Equal	   ${_message}	   ${text}
    