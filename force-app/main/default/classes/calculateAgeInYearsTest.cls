/**
 * Created by geoffreynix on 6/17/25.
 */

@IsTest
private class calculateAgeInYearsTest {
    @IsTest
    static void testBehavior() {
        Date age1 = Date.newInstance(2000, 5, 22);
        Date age2 = Date.newInstance(1983, 10, 17);
        Date age3 = null;

        Test.startTest();

        System.assertEquals(25, calculateAgeInYears(age1), 'Incorrect age');
        System.assertEquals(41, calculateAgeInYears(age2), 'Incorrect age');
        System.assertEquals(null, calculateAgeInYears(age3), 'Incorrect age');

        Test.stopTest();

    }
}