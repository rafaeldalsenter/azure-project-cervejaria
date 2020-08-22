# Cervejaria Ambev - exemplo de ambiente Azure

## App

// TODO Aplicação e load balance


-----

## Storages

Utilizaremos o **Azure Storage** para as imagens com tamanho superior a 1 Mb, arquivos estáticos do site e imagens de até 1Mb. Os dois últimos serão distribuidos utilizando **CDN Network**.
- Todo esse conteúdo não ficará junto com a aplicação, assim se a aplicação escalar ficará mais enxuta.
- O conteúdo estático do site e imagens de até 1mb utilizarão CDN podendo ter distribuição geográfica, diminuindo a latência (assim podemos escolher a localização Leste dos EUA para Storage, reduzindo o custo).

Custos estimados:
- Azure Storage com GRS: $12 por 30Gb de armazenamento + custos mínimos de Gravação/leitura (Leste dos EUA  - 25% de economia em relação a Brasil).
- CDN: $0,32 por Gb.

-----

## Databases

Utilizaremos o **Serviço gerenciado de MySQL** como banco principal da aplicação e **Serviço gerenciado do Redis** para cache (armazenando as sessões). A capacidade de armazenamento foi estimada nas configurações de uso padrão do Azure.

// TODO justificar pq utilizar Redis

Custos estimados:
- MySQL: $1102 com 4 cores + 100Gb de armazenamento (Leste dos EUA  - 25% de economia em relação a Brasil).
- Redis: $407 com configuração Standard C1 1 Gb.



