# Replacer API
An REST API is hosted in Azure Functions docker container which replaces keywords like Google, Microsoft, Oracle etc. with Google©, Microsoft©, Oracle©

### How to test API?

1. Make sure you have docker installed
2. run
```
    docker run -p 8080:80  allhandsondock/azfuncapi:v1.0.0
    
````
Note: It may take few minutes to download the image

3. Go to http://localhost:8080/api/ReplacerAPI?name=Welcome%20to%20Deloitte
4. Try with other company names - Google, Microsoft, Oracle, Amazon
	
    
