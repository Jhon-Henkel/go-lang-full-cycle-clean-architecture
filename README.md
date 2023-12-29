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
Iniciar o Docker que está na raiz do projeto, e em seguida rodar o comando:
```bash
cd cmd/ordersystem/
go run main.go wire_gen.go
```