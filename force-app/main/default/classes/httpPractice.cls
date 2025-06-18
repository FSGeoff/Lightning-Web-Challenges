/**
 * Created by geoffreynix on 6/17/25.
 */

public with sharing class httpPractice {
    public static Integer fetchUserAge(Integer userId) {
        // Return null if userId is null
        if (userId == null) {
            return 0;
        }

        // Construct the endpoint URL
        String endpoint = 'https://dummyjson.com/users/' + userId;

        // Create a new HTTP request
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');

        // Initialize the response variable
        HttpResponse response;

        try {
            // Send the request and get the response
            response = http.send(request);
        } catch (Exception e) {
            System.debug('HTTP Request failed: ' + e.getMessage());
            return 0; // Return null if the request fails
        }

        // Check that the status is OK
        if (response != null && response.getStatusCode() == 200) {
            // Parse the JSON response
            Map<String, Object> userInfo = (Map<String, Object>)
                    JSON.deserializeUntyped(response.getBody());

            // Extract the age
            if (userInfo.containsKey('age')) {
                return (Integer) userInfo.get('age'); // Use get() instead of set()
            } else {
                return 0;
            }
        }

        // Log debug message for request
        System.debug('Debug: Making HTTP GET request to DummyJSON API for user ID: ' + userId);

        return 0; // Return null if age is not found
    }

}