*** Settings ***
Documentation        Testes Mobile

Library              AppiumLibrary

Test Setup           Abrir aplicativo
Test Teardown        Fechar aplicativo

*** Test Case ***
Caso de Teste 01: Pesquisar canal “Prime Experts”
    [Tags]        PRIME
    Dado que o cliente esteja na tela de Home
    E pesquise um vídeo sobre "Prime Experts"
    E acessar o canal da Prime
    Quando clicar em Inscrever-se
    Então será apresentado como Inscrito


*** Keywords ***
Abrir aplicativo
    Set Appium Timeout              20
    Open Application                http://localhost:4723/wd/hub
    ...                             platformName=Android
    ...                             deviceName=R9QR1042KJW
    ...                             automationName=uiautomator2
    ...                             appPackage=com.google.android.youtube
    ...                             appActivity=com.google.android.youtube.HomeActivity
    ...                             autoGrantPermissions=true

Fechar aplicativo
    Capture Page Screenshot
    Close Application

Dado que o cliente esteja na tela de Home
    Wait Until Element Is Visible        xpath=//*[contains(@text, 'Início')]
    Wait Until Element Is Visible        accessibility_id=YouTube

E pesquise um vídeo sobre "${PESQUISA}"
    Click Element                        accessibility_id=Pesquisar
    Input Text                           id=search_edit_text            ${PESQUISA}
    Press Keycode                        66

E acessar o canal da Prime
    Wait Until Element Is Visible        accessibility_id=Prime Experts - Parceria entre Prime Control e UniBrasil - 3 minutos e 38 segundos - Ir ao canal - Prime Control - 58 visualizações - há 1 ano - assistir o vídeo
    Click Element                        accessibility_id=Prime Experts - Parceria entre Prime Control e UniBrasil - 3 minutos e 38 segundos - Ir ao canal - Prime Control - 58 visualizações - há 1 ano - assistir o vídeo

Quando clicar em Inscrever-se
    Click Element                        accessibility_id=Inscreva-se em Prime Control.
    Click Element                        accessibility_id=Inscreva-se em Prime Control.

Então será apresentado como Inscrito
    Wait Until Element Is Visible        accessibility_id=Cancelar inscrição de Prime Control.