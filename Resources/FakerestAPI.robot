*** Settings ***
Documentation     https://fakerestapi.azurewebsites.net/index.html
Library    RequestsLibrary
Library    Collections
Library    String

*** Variable ***

*** Keywords ***
###KEYWORDS DOS TESTES
###GET
Requisitar todas as atividades
  ${RESPONSE}   Get On Session  fakerestapi   /Activities
  Set Test Variable   ${RESPONSE}

Requisitar uma atividade específica
  [Arguments]   ${ACTIVITY_ID}
  ${RESPONSE}   Get On Session    fakerestapi     /Activities/${ACTIVITY_ID}
  Set Test Variable       ${RESPONSE}

###POST
Cadastrar uma nova atividade
    ${HEADERS}    Create Dictionary     content-type=application/json
    ${BODY}         Format String    C:\\Users\\55129\\Documents\\Projetos\\APITesting\\Data\\Input\\PostActivity.json
    ${RESPONSE}   Post On Session    fakerestapi   /Activities    data=${BODY}  headers=${HEADERS}

    Set Test Variable     ${RESPONSE}

###PUT
Alterar uma atividade existente
  [Arguments]   ${ACTIVITY_ID}
  ${HEADERS}    Create Dictionary     content-type=application/json
  ${BODY}       Format String    C:\\Users\\55129\\Documents\\Projetos\\APITesting\\Data\\Input\\PutActivity.json
  ${RESPONSE}   Put On Session    fakerestapi   /Activities/${ACTIVITY_ID}    data=${BODY}  headers=${HEADERS}

  Set Test Variable     ${RESPONSE}

###DELETE
Excluir uma atividade específica
    [Arguments]   ${ACTIVITY_ID}
    ${HEADERS}    Create Dictionary     content-type=application/json
    ${RESPONSE}   Delete On Session     fakerestapi     /Activities/${ACTIVITY_ID}    headers=${HEADERS}

    Set Test Variable    ${RESPONSE}
