/**
 * Created by geoffreynix on 6/17/25.
 */

public with sharing class apexPractice {
    public static Integer calculateAgeInYears(Date birthdate) {
        // Check if the birthdate is null or in the future
        if (birthdate == null || birthdate > Date.today()) {
            return null; // Return null if the birthdate is invalid
        }

        // Get the current date
        Date today = Date.today();

        // Calculate age based on year difference
        Integer age = today.year() - birthdate.year();

        // Adjust age if the birthday hasn't occurred yet this year
        if (today < birthdate.addYears(age)) {
            age--; // Decrease age by 1 if the birthday hasn't occurred yet
        }

        System.debug('Debug: Calculating age from birthdate: ' + birthdate);
        return age;
    }

    public static Map<String, List<Account>> groupAccountsByRating() {
        // Initialize the map to hold the results
        Map<String, List<Account>> ratingsMap = new Map<String, List<Account>>();

        // Query to retrieve all Account records
        List<Account> accounts = [SELECT Id, Name, Rating FROM Account];

        // Iterate over the accounts and group them by Rating
        for (Account acc : accounts) {
            String rating = acc.Rating; // Get the rating of the account

            // If the rating is null, use 'null' as the key
            if (rating == null) {
                return null; // You can also choose to use a different key if preferred
            }

            // If the map does not contain the rating key, initialize a new list
            if (!ratingsMap.containsKey(rating)) {
                ratingsMap.put(rating, new List<Account>());
            }

            // Add the account to the corresponding list in the map
            ratingsMap.get(rating).add(acc);
        }

        return ratingsMap;
    }

}