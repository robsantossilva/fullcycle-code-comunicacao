# Comunicação

- **Comunicação sincrona**: Acontece em tempo real. Alta dependencia entre sistemas.
- **Comunicação assincrona**: Não precisa ter a resposta na hora. Dependencia fraca entre sistemas.

## Comunicação Sincrona vs Assincrona

## REST
- Muitos desenvolvedores "já sabem trabalhar com REST"
- Representational state of transfer
- Surgiu em 2000 por Roy Fielding em uma dissertação de doutorado
- Simplicidade
- Stateless
- Cacheável

## REST: Níveis de maturidade (Richardson Maturity Model)

**Nivel 0:** The Swamp of POX

**Nível 1:** Utilização de resources

Verbo | URI | Operação
------|-----|---------
GET|/products/1|Buscar
POST|/products|Inserir
PUT|/products/1|Alterar
DELETE|/products/1|Remover

**Nível 2:** Utilização de Verbos HTTP mediante a sua representatividade

Verbo | Utilização
------|------------
GET|Recuperar informação
POST|Inserir
PUT|Alterar
DELETE|Remover

**Nível 3:** HATEOAS: Hypermedia as the Engine of Application State

``` json
HTTP/1.1 200 OK
Content-Type: application/vnd.acme.account+json
Content-Length: ...

{
    "account": {
        "account_number": 12345,
        "balance": {
            "currency": "usd",
            "value": 100.00
        },
        "links": {
            "deposit": "/account/12345/deposit",
            "withdraw": "/account/12345/withdraw",
            "transfer": "/account/12345/transfer",
            "close": "/account/12345/close"
        }
    }
}
```

## REST: Uma boa API REST

- Utiliza URIs únicas para serviços e itens que expostos para esses serviços
- Utiliza todos os verbos HTTP para realizar as operações em seus recursos, incluindo caching
- Provê links relacionais para os recursos exemplificando o que pode ser feito

## REST: HAL, Collection+JSON e Siren

- JSON não provê um padrão de hipermídia para realizar a linkagem
- HAL: Hypermedia Application Language
- Siren

## REST: HAL
Media Type = application/hal+json
```json
{
    "_links":{
        "self":{
            "href":"http://fullcycle.com.br/api/user/robson"
        }
    },
    "id":"robson",
    "name":"Robson Silva",
    "_embedded":{
        "family":{
            "_links":{
                "self":{
                    "href":"http://fullcycle.com.br/api/user/aline"
                }
            },
            "id":"aline",
            "name":"Aline França"
        }
    }
}
```

## REST: HTTP Method Negotiation
HTTP possui um outro método: OPTIONS. Esse método nos permite informar quais métodos são permitidos ou não em determinado recurso.

**OPTIONS /api/product HTTP/1.1**
**Host: fullcycle.com.br**

Resposta pode ser:
**HTTP/1.1 200 OK**
**Allow: GET, POST**

Caso envie a requisição em outro formato:
**HTTP/1.1 405 Not Allowed**
**Allow: GET, POST**

## REST: Content Negetiation
O Processo de content negotiation é baseado na requisição que o client está fazendo para server. Nesse caso ele solicita o que e como ele quer a resposta. O server então retornará ou não a informação no formato desejado.

**Accept Negotiation**
- Client solicita a informação e o tipo de retorno pelo server baseado no media type informado por ordem de prioridade.

**GET /product**
**Accept: application/json**

Resposta pode ser retorno dos dados ou:
**HTTP/1.1 406 Not Acceptable**

**Contenty-Type Negotiation**
Através de um content-type no header da request, o servidor consegue verificar se ele irá conseguir processar a informação para retornar a informação desejada.
``` json
POST /product HTTP/1.1
Accept: application/json
Content-Type: application/json

{
    "name":"Product 1"
}
```

Caso o servidor não aceite o content type, ele poderá retornar:
``` json
HTTP/1.1 415 Unsupported Mediaw Type
```