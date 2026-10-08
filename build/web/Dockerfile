# Upstream's Dockerfile (app/Dockerfile) with three changes: the SDK image is pinned to 10.0.103
# (upstream: 10.0); the source is copied from app/ instead of `git clone`d from GitHub at build
# time; and the NuGet restore and build run at build time (`dotnet run --no-build` at start),
# since the lab has no internet at run time.
FROM mcr.microsoft.com/dotnet/sdk:10.0.103

EXPOSE 3000

WORKDIR /app

RUN apt update && apt install -y openssl

COPY app/ /app/VulnerableLightApp/
WORKDIR /app/VulnerableLightApp
RUN dotnet build

# Génération du certificat auto-signé
RUN openssl req -x509 -newkey rsa:4096 -keyout /app/key.pem -out /app/cert.pem \
    -days 365 -nodes -subj "/CN=localhost" && \
    openssl pkcs12 -export -out /app/cert.pfx \
    -inkey /app/key.pem -in /app/cert.pem -passout pass:mypassword

# Configuration HTTPS via variables d'environnement
ENV ASPNETCORE_Kestrel__Certificates__Default__Path=/app/cert.pfx
ENV ASPNETCORE_Kestrel__Certificates__Default__Password=mypassword

CMD ["dotnet", "run", "--no-build", "--url=https://0.0.0.0:3000"]
