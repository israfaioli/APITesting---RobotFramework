*** Settings ***
Library    RequestsLibrary
Library    Collections

Resource    ../../Resources/Resource.robot
Resource    ../../Resources/BarrigaRest.robot

Suite Setup     conectar a BarrigaRest
Test Setup      Realizar login no BarrigaRest    israfaioli@gmail.com    123456

*** Variable ***
&{ACCOUNT_509635}    id=509635  nome=Conta para extrato  visivel=True   usuario_id=13017

*** Test case ***
CT01 - GET todas as contas utilizando TOKEN
  [Tags]  Robotframework
  Obter todas as contas
  Verificar o status code    200
  Verificar tamanho da lista    6
  Verificar se os dados estão corretos para determinada conta    ${ACCOUNT_509635.id}    ${ACCOUNT_509635.nome}    ${ACCOUNT_509635.visivel}    ${ACCOUNT_509635.usuario_id}
