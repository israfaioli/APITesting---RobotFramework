*** Settings ***
Documentation     https://fakerestapi.azurewebsites.net/index.html
Library    RequestsLibrary
Library    Collections

*** Variable ***
#simples
${FAKERESTAPI_BASE_URL}     https://fakerestapi.azurewebsites.net/api/v1
${BARRIGAREST_BASE_URL}     https://barrigarest.wcaquino.me

*** Keywords ***
###setup and teardowns
conectar a FakerestAPI
    Create Session    fakerestapi   ${FAKERESTAPI_BASE_URL}

conectar a BarrigaRest
      Create Session   barrigarest    ${BARRIGAREST_BASE_URL}   disable_warnings=True

###ASSERTS
Verificar o status code
  [Arguments]   ${STATUS_CODE}
  Should Be Equal As Strings    ${RESPONSE.status_code}   ${STATUS_CODE}

Verificar o reason da requisição
  [Arguments]   ${REASON}
  Should Be Equal As Strings    ${RESPONSE.reason}    ${REASON}

Verificar tamanho da lista
  [Arguments]     ${SIZE}
  Length Should Be    ${RESPONSE.json()}     ${SIZE}

Verificar se os dados estão corretos para a Activity
  [Arguments]   ${ACTIVITY_ID}  ${ACTIVITY_TITLE}  ${ACTIVITY_COMPLETED}
  Dictionary Should Contain Item    ${RESPONSE.json()}    id           ${ACTIVITY_ID}
  Dictionary Should Contain Item    ${RESPONSE.json()}    title        ${ACTIVITY_TITLE}
  Dictionary Should Contain Item    ${RESPONSE.json()}    completed    ${ACTIVITY_COMPLETED}
  Should Not Be Empty       ${RESPONSE.json()["dueDate"]}

Verificar se os dados estão corretos para determinada conta
  [Arguments]   ${ACCOUNT_ID}   ${ACCOUNT_NAME}   ${ACCOUNT_IS_VISIBLE}   ${ACCOUNT_USER_ID}
  Dictionary Should Contain Item   ${RESPONSE.json()[5]}    id            ${ACCOUNT_ID}
  Dictionary Should Contain Item   ${RESPONSE.json()[5]}    nome          ${ACCOUNT_NAME}
  Dictionary Should Contain Item   ${RESPONSE.json()[5]}    visivel       ${ACCOUNT_IS_VISIBLE}
  Dictionary Should Contain Item   ${RESPONSE.json()[5]}    usuario_id    ${ACCOUNT_USER_ID}
