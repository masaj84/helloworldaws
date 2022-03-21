#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 8000


FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["helloworldaws/helloworldaws.csproj", "helloworldaws/"]
RUN dotnet restore "helloworldaws/helloworldaws.csproj"
COPY . .
WORKDIR "/src/helloworldaws"
RUN dotnet build "helloworldaws.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "helloworldaws.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "helloworldaws.dll"]