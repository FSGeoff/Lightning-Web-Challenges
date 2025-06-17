/**
 * Created by geoffreynix on 6/17/25.
 */

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
