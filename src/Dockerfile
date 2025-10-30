FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app
COPY src/cartservice.csproj .
RUN dotnet restore
COPY . ./
RUN dotnet publish -c release -o /out

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /out ./
EXPOSE 8086
ENTRYPOINT ["dotnet", "cartservice.sln"]