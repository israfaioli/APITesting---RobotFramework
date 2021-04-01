*** Settings ***
Library    RequestsLibrary
Library    Collections

Resource    ../../Resources/Resource.robot
Resource    ../../Resources/FakerestAPI.robot

Suite Setup     conectar a FakerestAPI

*** Variable ***
#dicionários
&{ACTIVITY_1}     id=1  title=Activity 1  completed=False
&{ACTIVITY_10}    id=10  title=Activity number 10  completed=False
&{ACTIVITY_11}    id=11  title=Activity number 11 modified  completed=True

*** Test case ***
CT01 - GET todas atividades
  Requisitar todas as atividades
  Verificar o status code    200
  Verificar o reason da requisição    OK
  Verificar tamanho da lista    30

CT02 - GET uma atividade específica
  Requisitar uma atividade específica    1
  Verificar o status code    200
  Verificar o reason da requisição    OK
  Verificar se os dados estão corretos para a Activity    ${ACTIVITY_1.id}    ${ACTIVITY_1.title}   ${ACTIVITY_1.completed}

CT03 - POST uma nova atividade utilizando arquivo json
  Cadastrar uma nova atividade
  Verificar o status code    200
  Verificar o reason da requisição    OK
  Verificar se os dados estão corretos para a Activity    ${ACTIVITY_10.id}    ${ACTIVITY_10.title}   ${ACTIVITY_10.completed}

CT04 - PUT uma atividade existente utilizando arquivo json
  Alterar uma atividade existente    11
  Verificar o status code    200
  Verificar o reason da requisição    OK
  Verificar se os dados estão corretos para a Activity    ${ACTIVITY_11.id}    ${ACTIVITY_11.title}   ${ACTIVITY_11.completed}

CT05 - DELETE uma atividade específica
  Excluir uma atividade específica    22
  Verificar o status code    200
  Verificar o reason da requisição    OK
