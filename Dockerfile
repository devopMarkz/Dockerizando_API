# Etapa 1: Construção do JAR
FROM maven:3.9.9-amazoncorretto-21-debian AS builder

WORKDIR /build

# Copia os arquivos do projeto para o contêiner
COPY . .

# Executa o build do projeto sem rodar os testes
RUN mvn clean package -DskipTests

# Etapa 2: Imagem final para execução da aplicação
FROM amazoncorretto:21

WORKDIR /app

# Copia o JAR gerado na etapa anterior
# Como só haverá um arquivo finalizando com .jar, podemos escrever '/app/target/*.jar'
COPY --from=builder /build/target/*.jar ./minha-api.jar

# Expõe a porta 8080
EXPOSE 8080

# Define o comando para rodar a aplicação
ENTRYPOINT ["java", "-jar", "minha-api.jar"]


# Explicando o fluxo:
# Fazemos um build da aplicação para empacotá-la no formato .jar, que será salvo dentro do diretório '/build'
# Na etapa 2, quando fazemos o COPY, estamos pegando o .jar que salvamos na pasta '/build' da etapa 1
# ... e copiando para o nosso conteiner, na pasta '/app'
# Por fim, no ENTRYPOINT, estamos executando o .jar
