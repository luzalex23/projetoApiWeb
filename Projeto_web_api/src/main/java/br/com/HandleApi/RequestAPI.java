package br.com.HandleApi;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpClient.Redirect;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpResponse.BodyHandlers;
import java.time.Duration;

public class RequestAPI{
    public String getRequest() throws IOException, InterruptedException {
        try{
            HttpRequest request = HttpRequest.newBuilder()
                    .GET()
                    .uri(URI.create("https://run.mocky.io/v3/ca4ec77d-b941-4477-8a7f-95d4daf7a653"))
                    .headers("Accept", "application/json")
                    .timeout(Duration.ofSeconds(30))
                    .build();

            HttpClient httpClient = HttpClient.newBuilder()
                    .connectTimeout(Duration.ofSeconds(3))
                    .followRedirects(Redirect.NORMAL)
                    .build();

            HttpResponse<String> response = httpClient.send(request, BodyHandlers.ofString());

            if(response.statusCode() == 200) {
                return response.body();
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return null;
    }
}

