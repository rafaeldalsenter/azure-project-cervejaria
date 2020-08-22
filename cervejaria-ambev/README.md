# Cervejaria Ambev - exemplo de ambiente Azure

<Imagem do Ambiente>

## App

Para aplicação, o melhor caminho é utilizar Kubernetes. Mesmo a estrutura da aplicação sendo composta por um monolito, temos algumas vantagens:
- Escalabilidade, onde é mais rápido para subir um Pod da aplicação do que uma máquina virtual.
- Flexibilidade, por exemplo, se futuramente pensar em separar a aplicação em Microserviços.

Para aplicação utilizaremos **Serviço gerenciado de Kubernetes (AKS)**, **Container registry** para manter as imagens do Contâiner.

Custos estimados:
- Contâiner register: $20 no plano Basic (Leste dos EUA).
- AKS: $291 par ao cluster.

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

Utilizaremos o **Serviço gerenciado de MySQL** como banco principal da aplicação e **Serviço gerenciado do Redis** para cache. A capacidade de armazenamento foi estimada nas configurações de uso padrão do Azure.
- Para as sessões, escolhemos o Redis que armazenará os dados em memória, podendo ser utilizado para cache de outras informações.

Custos estimados:
- MySQL: $1102 com 4 cores + 100Gb de armazenamento (Leste dos EUA  - 25% de economia em relação a Brasil).
- Redis: $407 com configuração Standard C1 1 Gb.



