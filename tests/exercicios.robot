*** Settings ***
Documentation       Neste arquivo estarão presentes todos os exercícios de automacao do curso Prime Hero

*** Variables ***
# Minha primeira variável do tipo dicionário
&{PESSOA}
...         nome=Yann       
...         sobrenome=Mendes      
...         idade=28anos
...         cpf=123456789
...         profissao=comerciante
...         carro=Sentra

@{FRUTAS}       Banana      Abacaxi     Uva     Manga

*** Test Cases ***
Cenario: Imprimindo 6 informacões de uma pessoa
    Log To Console      ${PESSOA.nome}
    Log To Console      ${PESSOA.sobrenome}
    Log To Console      ${PESSOA.idade}
    Log To Console      ${PESSOA.cpf}
    Log To Console      ${PESSOA.profissao}
    Log To Console      ${PESSOA.carro}

Cenario: Imprimindo uma lista de frutas
    [Tags]              LISTA
    Log to Console      ${FRUTAS}
    Log To Console      ${FRUTAS[0]}
    Log To Console      ${FRUTAS[3]}

Cenario: Somando dois numeros
    [Tags]                SOMAR
    Somar dois numeros  10  10
    ${resultado}        Somar os numeros "55" e "22"
    Log To Console      ${RESULTADO}

Cenario: Email
    [Tags]          CRIAR   
    ${CONJUNTO}     Criando o email     Yann     Mendes  28
    Log To Console  ${CONJUNTO}

Cenario: Contando de 0 a 9
    [Tags]      CONTAR
    FOR     ${COUNT}        IN RANGE    0   9
        Log To Console      ${COUNT}
    END

Cenario: Percorrendo a lista de frutas 
    [Tags]      FRUTAS
    Percorrer itens de uma lista

Cenario: Exercicio FOR 1
    [Tags]      FO1
    Exercico FOR 1

Cenario: Exercicio FOR 2
    [Tags]      FO2
    Exericio FOR 2

Cenario: Exercicio IF1
    [Tags]      IF1
    Exercicio IF1

*** Keywords ***
Somar dois numeros
    [Arguments]     ${NUM_A}    ${NUM_B}
    ${SOMA}         Evaluate    ${NUM_A}+${NUM_B}
    [Return]        ${SOMA}

Somar os numeros "${NUM_A}" E "${NUM_B}"
    ${SOMA}         Evaluate    ${NUM_A}+${NUM_B}
    [Return]        ${SOMA}

Criando o email
    [Arguments]     ${NOME1}     ${SOBRENOME1}    ${IDADE1}
    ${CONJUNTO}     Catenate    ${NOME1}_${SOBRENOME1}_${IDADE1}@robot.com
    [Return]        ${CONJUNTO}

Contar de 0 a 9
    FOR     ${COUNT}    IN RAGE     0   9
        Log To Console      ${COUNT}
    END

Percorrer itens de uma lista
    @{FRUTAS}       Create List     Banana      Abacaxi     Limão
    FOR     ${FRUTA}    IN      @{FRUTAS}
        Log To Console      ${FRUTA}
    END

Exercico FOR 1
    FOR     ${CONTE}    IN RANGE    0   9
        log To Console  Estou no numero: ${CONTE}
    END

Exericio FOR 2
    @{PAISES}   Create List     Brasil      Argentina       Uruguai     Paraguai        Chile
    FOR     ${PAIS}   IN      @{PAISES}
        Log To Console      Estou no país ${PAIS}
    END

Exercicio IF1
    FOR     ${CONT}     IN RANGE    0   10
        IF  '${CONT}'=='5'
            Log To Console      Estou no numero: ${CONT}
        ELSE IF     '${CONT}'=='8'
            Log To Console      Estou no numero: ${CONT}
        ELSE
            Log To Console      Este não é o numero 5 ou o numero 8
        END
    END
