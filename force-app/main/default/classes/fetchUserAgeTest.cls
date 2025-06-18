/**
 * Created by geoffreynix on 6/18/25.
 */
@isTest
private class fetchUserAgeTest {

    // Inline mock implementation for HttpCalloutMock
    private class UserServiceMock implements HttpCalloutMock {
        public HttpResponse respond(HttpRequest req) {
            HttpResponse response = new HttpResponse();

            // Simulate different responses based on the request endpoint
            if (req.getEndpoint().contains('/users/1')) {
                response.setStatusCode(200);
                response.setBody('{"id": 1, "age": 30}'); // Valid user response
            } else if (req.getEndpoint().contains('/users/999')) {
                response.setStatusCode(404);
                response.setBody('{"message": "User not found"}'); // Non-existent user
            } else {
                response.setStatusCode(400); // Bad request for other endpoints
                response.setBody('{"message": "Bad Request"}');
            }

            return response;
        }
    }

    @IsTest
    static void testValidUser() {
        Test.startTest();

        // Set up the mock callout
        Test.setMock(HttpCalloutMock.class, new UserServiceMock());

        // Call the method to test with a valid user ID
        Integer age = httpPractice.fetchUserAge(1);

        // Assert that the age is correct
        System.assertEquals(30, age, 'Expected age to be 30 for valid user ID');
        Test.stopTest();
    }

    @IsTest
    static void testUserNotFound() {
        Test.startTest();

        // Set up the mock callout
        Test.setMock(HttpCalloutMock.class, new UserServiceMock());

        // Call the method to test with a non-existent user ID
        Integer age = httpPractice.fetchUserAge(999);

        // Assert that the returned age is null or handle as needed
        System.assertEquals(0, age, 'Expected age to be null for non-existent user ID');
        Test.stopTest();
    }

    @IsTest
    static void testBadRequest() {
        Test.startTest();

        // Set up the mock callout
        Test.setMock(HttpCalloutMock.class, new UserServiceMock());

        // Call the method with an invalid user ID
        Integer age = httpPractice.fetchUserAge(-1); // Assuming -1 is invalid

        // Assert that the returned age is null or handle as needed
        System.assertEquals(0, age, 'Expected age to be null for invalid user ID');
        Test.stopTest();
    }
}
