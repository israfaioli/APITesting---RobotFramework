*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Keywords ***
###KEYWORDS DOS TESTES
###POST
Realizar login no BarrigaRest
    [Arguments]   ${USER_EMAIL}   ${USER_PASSWORD}
    ${HEADERS}    Create Dictionary     content-type=application/json
    ${RESPONSE}   Post On Session    BarrigaRest   /signin
    ...                              data={"email": "${USER_EMAIL}", "senha": "${USER_PASSWORD}", "redirecionar": false}
    ...                              headers=${HEADERS}

    Set Test Variable     ${RESPONSE}
    Log                   ${RESPONSE.json()}
    ${TOKEN}     Get From Dictionary    ${RESPONSE.json()}    token
    Log    Meu token é: ${TOKEN}
    Set Suite Variable   ${TOKEN}

###GET
Obter todas as contas
   ${HEADERS}    Create Dictionary     content-type=application/json     Authorization=JWT ${TOKEN}
   ${RESPONSE}   Get On Session    BarrigaRest    /contas
   ...                             headers=${HEADERS}
   Set Test Variable     ${RESPONSE}
