create-migration:
	@echo "Creating migration"
	migrate create -ext=sql -dir=sql/migrations -seq $(name)

migrate:
	@echo "Running migrations"
	migrate -path=internal/sql/migrations -database "mysql://root:root@tcp(localhost:3306)/orders" -verbose up

rollback:
	@echo "Rolling back migrations"
	migrate -path=internal/sql/migrations -database "mysql://root:root@tcp(localhost:3306)/orders" -verbose down

.PHONY: migrate rollback create-migration