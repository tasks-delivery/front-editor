FROM microsoft/dotnet:1.0.1-sdk-projectjson-nanoserver

WORKDIR /root/
ADD ./app/ ./app/
WORKDIR /root/app

RUN dotnet restore
RUN dotnet build

EXPOSE 5000/tcp

ENTRYPOINT ["Front_Editor.exe", "run", "--server.urls", "http://0.0.0.0:5000"]