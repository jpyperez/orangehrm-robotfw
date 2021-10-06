*** Settings ***
Library    String

Resource    keywords.robot

*** Keywords ***
E acesso a tela "${screen}"
    @{screens}=    Split String    ${screen}    >
    Log    Menu: ${screen}
    
    ${qty}=    Get Length    ${screens}
    IF    ${qty} == 1
        Clicar em    xpath=//b[text()="${screens[0].strip()}"]
    ELSE IF    ${qty} == 2
        Clicar em    xpath=//b[text()="${screens[0].strip()}"]
        Clicar em    xpath=//li[contains(@class,"current")]//*[text()="${screens[1].strip()}"]
    ELSE IF    ${qty} == 3
        Clicar em    xpath=//b[text()="${screens[0].strip()}"]
        Mouse Over    xpath=//li[contains(@class,"current")]//*[text()="${screens[1].strip()}"]
        Clicar em    xpath=//li[contains(@class,"current")]//*[text()="${screens[2].strip()}"]
    END