## carregando libraries
library(dplyr)
library(ggplot2)
library(forcats)

# caminho do arquivo
caminho <- "https://bi.static.es.gov.br/covid19/MICRODADOS.csv"

# Tentando encontrar o encoding do arquivo
readr::guess_encoding("https://bi.static.es.gov.br/covid19/MICRODADOS.csv")

# Lendo dados
dados <- read.csv(caminho, sep = ";", fileEncoding = "ISO-8859-1")

# Limpando os nomes das variaveis
dados <- janitor::clean_names(dados)

janitor::tabyl(dados, raca_cor)

## Criando categoria Cor/Raça negra
dados <- dados %>% 
  mutate(raca = fct_recode(raca_cor, 
                           Negra = "Parda", 
                           Negra = "Preta"))

janitor::tabyl(dados, raca, raca_cor)

## Fazendo gráficos
ggplot(dados) 

ggplot(dados) +
  aes(x = raca)

ggplot(dados) +
  aes(x = raca) + 
  geom_bar()

ggplot(dados) +
  aes(x = raca) + 
  geom_bar(fill = "royalblue")

ggplot(dados) +
  aes(x = raca) + 
  geom_bar(fill = "royalblue") + 
  theme_bw()

ggplot(dados) +
  aes(x = raca) + 
  geom_bar(fill = "royalblue") + 
  theme_minimal()

ggplot(dados) +
  aes(x = raca) + 
  geom_bar(fill = "royalblue") + 
  theme_minimal() + 
  labs(y = 'Frequência', 
       x = "Raça/Cor")

ggplot(dados) +
  aes(x = raca, fill = sexo) + 
  geom_bar() + 
  theme_minimal() + 
  labs(y = 'Frequência', 
       x = "Raça/Cor")

ggplot(dados) +
  aes(x = raca, fill = sexo) + 
  geom_bar(position = 'dodge') + 
  theme_minimal() + 
  labs(y = 'Frequência', 
       x = "Raça/Cor")

ggplot(dados) +
  aes(x = raca) + 
  facet_wrap(~ sexo) +
  geom_bar(position = 'dodge', fill = 'royalblue') + 
  theme_minimal() + 
  labs(y = 'Frequência', 
       x = "Raça/Cor")

dados %>% 
  filter(sexo != "I") %>% 
  ggplot() +
  aes(x = raca) + 
  facet_wrap(~ sexo) +
  geom_bar(position = 'dodge', fill = 'royalblue') + 
  theme_minimal() + 
  labs(y = 'Frequência', 
       x = "Raça/Cor")


dados %>% 
  filter(sexo != "I") %>% 
  ggplot() +
  aes(x = raca, fill = sexo) + 
  geom_bar(position = 'fill') + 
  theme_minimal() + 
  labs(y = 'Frequência', 
       x = "Raça/Cor")


dados %>% 
  filter(sexo != "I") %>% 
  ggplot() +
  aes(x = raca, fill = sexo) + 
  geom_bar(position = 'fill') + 
  theme_minimal() + 
  scale_fill_viridis_d(name = "Gênero") +
  labs(y = 'Frequência', 
       x = "Raça/Cor") 


dados %>% 
  filter(sexo != "I") %>% 
  ggplot() +
  aes(x = raca, fill = sexo) + 
  geom_bar(position = 'fill') + 
  theme_minimal() + 
  scale_fill_viridis_d(name = "Gênero") +
  labs(y = 'Frequência', 
       x = "Raça/Cor") +
  facet_wrap(~ febre)


dados %>% 
  filter(sexo != "I", 
         febre != "-") %>% 
  ggplot() +
  aes(x = raca, fill = sexo) + 
  geom_bar(position = 'fill') + 
  theme_minimal() + 
  scale_fill_viridis_d(name = "Gênero") +
  labs(y = 'Frequência', 
       x = "Raça/Cor") +
  facet_wrap(~ febre)
