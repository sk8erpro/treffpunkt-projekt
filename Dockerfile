# 1. Aşama: Build (Derleme)
# Maven 3.9 ve Java 21 kullanarak kodu derliyoruz
FROM maven:3.9.5-eclipse-temurin-21 AS build
WORKDIR /app
COPY . .
# Testleri atlayarak hızlıca jar dosyasını oluşturuyoruz
RUN mvn clean package -DskipTests

# 2. Aşama: Run (Çalıştırma)
# Sadece çalışması için gereken hafif bir Java 21 imajı kullanıyoruz
FROM eclipse-temurin:21-jdk-jammy
WORKDIR /app
# Derleme aşamasında oluşan jar dosyasını buraya kopyalıyoruz
COPY --from=build /app/target/*.jar app.jar
# Uygulamanın çalışacağı port
EXPOSE 8080
# Uygulamayı başlatıyoruz
ENTRYPOINT ["java", "-jar", "app.jar"]