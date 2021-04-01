### Projeto de automação - Web ###

Olá Analistas e recrutadores,

Espero que vocês consigam navegar com tranquilidade por esse projeto. Estou seguindo o padrão POM para estruturação do projeto.

É um projeto simples porém funcional onde procuro passar a vocês como utilizo o robot framework para as automações API REST.

Espero que gostem, qualquer dúvida fiquem a vontade para entrar em contato - israfaioli@gmail.com

### Pré-requesitos ###

* Python

* Robot framework

* Libraries

* IDE para desenvolvimento de sua automação

### Tecnologias Utilizadas ###
* Python
* Docker

### Setup necessário ###


* Instalar o python 4.0.

  ```
  acessar https://www.python.org/downloads/
  clicar no botão de download na versão apresentada
  realizar instalação
  ```

* Instalar o Robot framework versão 4.0.

  ```
  pip install robotframework==4.0
  ```

* Instalar o ATOM como IDE de desenvolvimento da sua automação(sugestão).

  ```
  acessar https://atom.io/
  clicar no botão de download na versão apresentada
  realizar instalação
  ```


* Instalar a library da Requests Python.

  ```
  pip install robotframework-requests
  ```

### Estrutura do projeto ###

* Resources - Classes onde terão métodos em comum que poderão ser usadas por outras classes e métodos específicos de cada swagger que no exemplo temos "BarrigaRest" para testes com token e "FakerestAPI" para testar os tpos de verbos GET, POST, PUT e DELETE.
* Data - Local onde serão armazenados nossos arquivos .json utilizados nas ações de POST nos testes.
* Results - Onde são armazenados os resultados dos nossos testes, evidências.
* tests - Suite principal para execução dos testes (API REST).

### Rodando o projeto ###

Em alguns casos, a depender de suas configurações locais, pode ser necessário executar o projeto com permissões de administrador adicionando "sudo" antes dos comandos abaixo.

* Acessa a pasta do projeto
* Rode o seguinte comando do maven:
```

## Execução dos Testes Funcionais ##

- O projeto executa com chrome, não headless, por default:

* Especificar o diretório dos results da execução:

```
 robot -d ./Result Tests
```

* Executar apenas um teste específico da suíte:

```
robot -d .\Results -t "CT01 - GET todas as contas utilizando TOKEN" Tests
```

* Dando um nome à execução (para efeito de Log/Report):

```
 robot -N “Nome de Exemplo” -d ,\Results Tests
```

* Executando por TAGS:

```
 robot -d ./Results -i robotframework Tests

* -t é o parâmetro que indica que deve ser executado o(s) teste(s) específico(s) chamado(s). OBS.: Se existirem testes em diferentes suítes, mas com esse mesmo nome, todos serão executados.
* -i é o parâmetro que indica que devem ser executados apenas os testes cuja a Tag seja (robotframework).
