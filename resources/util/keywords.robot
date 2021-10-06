*** Settings ***
Library    SeleniumLibrary

*** Variables ***
@{SCREEN_SIZE}    1366    768
${URL}    opensource-demo.orangehrmlive.com
${DEFAULT_TIMEOUT}    30s
${DEFAULT_RETRY_TIME}   2s
${DEFAULT_WAIT_ELEMENT_TIMEOUT}    0.25s
${LOGO}    id=divLogo


*** Keywords ***
Finalizar teste
    Capture Page Screenshot
    Close Browser

Iniciar navegador
    ${chromeopts}=      Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    &{chromepref}=      Create dictionary   download.default_directory=/tmp

    Call Method         ${chromeopts}       add_experimental_option    prefs    ${chromepref}
    Call Method         ${chromeopts}       add_argument    --no-sandbox
    Call Method         ${chromeopts}       add_argument    --disable-extensions
    Call Method         ${chromeopts}       add_argument    --ignore-certificate-errors

    Open Browser        https://${URL}     chrome      options=${chromeopts}

    Ajustar tamanho de janela

Ajustar tamanho de janela
    Set Window Size     ${SCREEN_SIZE[0]}    ${SCREEN_SIZE[1]}

Dado que estou na tela inicial do sistema
    Iniciar navegador

Dado que estou logado com "${_username}" e "${_password}"
    Iniciar navegador
    Quando acesso com "${_username}" e "${_password}"
    Wait Until Element Is Visible    xpath=//h1[text()="Dashboard"]

Quando acesso com "${_username}" e "${_password}"
    Wait Until Element Is Visible       ${LOGO}
    
    Digitar texto em    id=txtUsername    ${_username}
    Digitar texto em    id=txtPassword    ${_password}

    Clicar em    id=btnLogin

Digitar texto em
    [Arguments]    ${locator}    ${text}    ${clear}=${True}    ${press_key}=${None}
    Return From Keyword If    '''${text}''' == '${Empty}'
    Log    Digitando '${text}' em '${locator}'
    Wait Until Element Is Visible    ${locator}
    Wait Until Keyword Succeeds    ${DEFAULT_TIMEOUT}    ${DEFAULT_RETRY_TIME}    Input Text    ${locator}    ${text}    ${clear}
    Run Keyword If    '${press_key}' != '${None}'   Press Keys    ${locator}    ${press_key}

Clicar em
    [Arguments]    ${locator}    ${arguments}=${None}    ${change_screen}=False
    Wait Until Element Is Visible    ${locator}
    Wait Until Keyword Succeeds    ${DEFAULT_TIMEOUT}    ${DEFAULT_RETRY_TIME}    Click Element    ${locator}    ${arguments}
    Log    Clicando em '${locator}'
    Run Keyword If    '${change_screen}' == 'True'    Trocar para nova janela

Trocar para nova janela
    Switch Window       NEW
    Ajustar tamanho de janela

Retorna texto do elemento
    [Arguments]    ${locator}    ${timeout}=${DEFAULT_WAIT_ELEMENT_TIMEOUT}
    ${old_wait}=    Set selenium implicit wait  ${timeout}
    ${element_text}=    Get text    ${locator}
    set selenium implicit wait    ${old_wait}
    [Return]    ${element_text}
