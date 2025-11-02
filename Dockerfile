# Stage 1: build
FROM eclipse-temurin:17-jdk AS builder
WORKDIR /app
# copy only source for fast rebuilds
COPY src/ ./src/
RUN mkdir -p out && javac -d out src/Main.java

# Stage 2: runtime
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=builder /app/out ./out
ENTRYPOINT ["java", "-cp", "out", "Main"]
