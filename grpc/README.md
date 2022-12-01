## gRPC

É um framework criado pela google para facilitar o processo de comunicação entre sistemas de uma forma extremamente rápida, leve e independente de linguagem.

Faz parte da CNCF (Cloud Native Computing Foundation)
https://www.cncf.io/

- Ideal para microsserviços
- Mobile, Browsers e Backend
- Geração das bibliotecas de forma automática
- Streaming bidirecional utilizando HTTP/2

#### Linguagens (Suporte Oficial)

- gRPC-GO
- gRPC-JAVA
- gRPC-C
  - C++
  - Python
  - Ruby
  - Objective C
  - PHP
  - C#
  - Node.js
  - Dart
  - Kotlin JVM

#### RPC - Remote Procedure Call

Client [server.soma(a,b)] ---> Server [func soma(int a, int b){}]

#### Protocol Buffers
https://developers.google.com/protocol-buffers

Protocol Buffers é um mecanismo extensível de linguagem neutra e plataforma neutra do Google para serializar dados estruturados - pense em XML, mas menor, mais rápido e mais simples.

**Protocol Buffers vs JSON**

- Arquivos binários é menor que JSON
- Processo de serialização é mais leve (CPU)
- Gasta menos recursos de rede
- Processo é mais veloz

```javascript
syntax = "proto3"

message SearchRequest {
  string query = 1
  int32 page_number = 2;
  int32 result_per_page = 3;
}
```

#### HTTP/2
- Nome original criado pela Google era SPDY
- Lançado em 2015
- Dados trafegados são binários e não texto como no HTTP 1.1
- Utiliza a mesma conexão TCP para enviar e receber dados do cliente e do servidor (Multiplex)
- Server Push
- Headers são comprimidos
- Gasta menos recursos de rede
- Processo é mais veloz

#### Formatos de comunicação

**API "unary"**

Cliente ---request--> Server
Cliente <--response-- Server

**API "Server streaming"**

Cliente ---request--> Server
Cliente <--response-- Server
Cliente <--response-- Server
Cliente <--response-- Server

**API "Client streaming"**

Cliente ---request--> Server
Cliente ---request--> Server
Cliente ---request--> Server
Cliente <--response-- Server

**API "Client streaming"**

Cliente ---request--> Server
Cliente ---request--> Server
Cliente ---request--> Server
Cliente <--response-- Server
Cliente <--response-- Server
Cliente <--response-- Server

#### REST vs gRPC
- Texto / JSON
- Unidirecional
- Alta latência
- Sem suporte a streaming (Request / Response)
- Design pré-definido
- Bibliotecas de terceiros

-----------

- Protocol Buffers
- Bidirecional e Assíncrono
- Baixa latência
- Contrato definido (.proto)
- Suporte a streraming
- Design é livre
- Geração de código

#### Ferramentas para instalar
- Golang
- Protocol buffer compiler ```apt install -y protobuf-compiler```
- Go Plugins
  - ```go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.28```
  - ```go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.2```

#### Gerando código Go
```bash
protoc --go_out=. --go-grpc_out=. proto/course_category.proto
```

#### gRPC Client Evans
https://github.com/ktr0731/evans

```bash
go install github.com/ktr0731/evans@latest
```

Com servidor gRPC rodando, execute:
```bash
evans -r repl
```
