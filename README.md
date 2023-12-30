# Go-Lang Full Cycle clean architecture module
Repositório para implementação do módulo de clean architecture do curso Go-Expert da Full Cycle

## Desafio
Olá devs!

Agora é a hora de botar a mão na massa. Pra este desafio, você precisará criar o useCase de listagem das orders.

Esta listagem precisa ser feita com:
- Endpoint REST (GET /order)
- Service ListOrders com GRPC
- Query ListOrders GraphQL

Não esqueça de criar as migrações necessárias e o arquivo api.http com a request para criar e listar as orders.

## Rodando o projeto
Iniciar o Docker que está na raiz do projeto, e em seguida rodar os comandos (um comando por vez):
```bash
make migrate
cd cmd/ordersystem/
go run main.go wire_gen.go
```

## Testando o projeto
- #### HTTP
  Rodar a requests contidas na pasta `api` com o nome `api.http`.
- #### GRPC
  Rodar o comando:
  ```bash
  evans -r repl
  package pb
  service OrderService
  call [Method Name] # Selecionar o método (CreateOrder ou ListOrders).
  ```
- #### GraphQL
  Acessar o endereço `http://localhost:8080/graphql` e rodar a query:
  - Create Order:
    ```graphql
      mutation createOrder  {
        createOrder(
          input: {
            id: "bbb",
            Price: 10.30,
            Tax: 50.10
          }
        )
        {
          id,
          Price, 
          Tax,
          FinalPrice
        }
      }
      ```
  - List Orders:
    ```graphql
      query listOrders {
        orders {
          id
          Tax
          Price
          FinalPrice
       }
     }
    ```

## Erros comuns:
- Dirty database version 1 ao rodar `make migrate`. Fix and force version. Rode (um comando por vez):
    ```bash
    docker exec -it mysql_clean_architecture bash
    mysql -h localhost -u root -p
    root
    use orders;
    truncate table schema_migrations;
    ```