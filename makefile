restore:
	dotnet restore

build:
	dotnet build --configuration Release

publish:
	dotnet publish --configuration Release --output ./publish