# Projeto de ambiente Azure

Projeto de migração de infra de uma aplicação PHP + MySQL para Azure.

![Diagrama](diagram.png)

## Network

Para proteger a aplicação utilizei a **Rede virtual do Azure** (gratuita), onde será alocado o cluster Kubernetes da aplicação principal e o Container Registry. O banco MySql e o Storage privado poderão ser acessados somente por essa rede.

## App

Para aplicação, optei por um cluster Kubernetes. Mesmo a estrutura da aplicação sendo composta por um monolito, temos algumas vantagens:
- Flexibilidade, onde é mais rápido para subir um Pod da aplicação do que uma máquina virtual.
- Escalabilidade, por exemplo, se futuramente pensar em separar a aplicação em Microserviços.

Utilizarei **Serviço gerenciado de Kubernetes (AKS)** e **Container registry** para manter as imagens do Contâiner da aplicação.

Custos estimados:
- AKS: $291 por cluster.
- Container registry: $20 no plano Basic (Leste dos EUA).

## Storages

Optado **Azure Storage** para as imagens com tamanho superior a 1 Mb, arquivos estáticos do site e imagens de até 1Mb. Os dois últimos serão distribuidos utilizando **CDN Network**.
- Todo esse conteúdo não ficará junto com a aplicação, assim se a aplicação escalar ficará mais enxuta.
- O conteúdo estático do site e imagens de até 1mb utilizarão CDN podendo ter distribuição geográfica, diminuindo a latência (assim podemos escolher a localização Leste dos EUA para Storage, reduzindo o custo).
- Há dois Storages no diagrama, o público contendo o conteúdo que será distribuido via CDN, e o privado contendo os arquivos da aplicação.

Custos estimados:
- Azure Storage: $12 por 30Gb de armazenamento + custos mínimos de Gravação/leitura (Leste dos EUA - 25% de economia em relação a Brasil).
- CDN: $0,32 por Gb.

## Databases

**Serviço gerenciado de MySQL** como banco principal da aplicação e **Serviço gerenciado do Redis** para cache. A capacidade de armazenamento foi estimada nas configurações de uso padrão do Azure.
- Para as sessões, escolhemos o Redis que armazenará os dados em memória, podendo ser utilizado para cache de outras informações posteriormente.
- O Redis possui uma opção que pode ser alocada em uma rede privada, porém seu custo fica 4x maior. 

Custos estimados:
- MySQL: $1102 com 4 cores + 100Gb de armazenamento (Leste dos EUA  - 25% de economia em relação a Brasil).
- Redis: $407 com configuração Standard C1 1 Gb.




