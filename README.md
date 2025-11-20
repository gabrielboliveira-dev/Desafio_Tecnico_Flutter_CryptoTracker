# 💹 Desafio Técnico: Crypto Tracker (Coinbase Clone)

Este projeto é um **aplicativo Flutter** para rastreamento de criptomoedas, inspirado em apps como a **Coinbase**.  
Ele consome a **API pública da CoinGecko** para exibir preços em tempo real, capitalização de mercado e variações percentuais.

Este repositório faz parte de uma série de desafios técnicos focados em **Clean Architecture** e boas práticas de engenharia de software.

---

## 📱 Funcionalidades

### 📊 Listagem de Criptomoedas
- Exibe as **Top 50 moedas** por capitalização de mercado.
- Cada item mostra:
  - Nome e símbolo  
  - Preço atual (USD)  
  - Rank de mercado  
  - Variação nas últimas 24h  

### ⚡ Dados em Tempo Real
Atualização dos preços e variações usando a API da CoinGecko.

### 🎨 Feedback Visual de Tendências
- **🟢 Verde**: variação positiva (alta)  
- **🔴 Vermelho**: variação negativa (baixa)

### 🔄 Atualização Manual
- Suporte a **pull-to-refresh** para atualizar os dados.

### 💲 Formatação Precisa
- Uso de **intl** para formatação correta de valores monetários e percentuais.

---

## 🛠️ Tecnologias Utilizadas

| Tecnologia | Uso |
|-----------|-----|
| **Dart** | Linguagem principal |
| **Flutter** | Framework do app |
| **Provider** | Gerenciamento de estado |
| **http** | Requisições HTTP |
| **intl** | Formatação de moeda e números |
| **cached_network_image** | Cache de imagens das moedas |
