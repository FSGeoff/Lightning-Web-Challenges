/**
 * Created by geoffreynix on 6/17/25.
 */

@IsTest
private class groupAccountsByRatingTest {
    @IsTest
    static void testBehavior() {
        //Create the test data
        List<Account> acc = new List<Account>{
                new Account(Name = 'account 1', Rating = 'Hot'),
                new Account(Name = 'account 2', Rating = 'Warm'),
                new Account(Name = 'account 3', Rating = 'Hot'),
                new Account(Name = 'account 4', Rating = 'Cold'),
                new Account(Name = 'account 5', Rating = 'Hot'),
                new Account(Name = 'account 6', Rating = 'Cold'),
                new Account(Name = 'account 7', Rating = 'Hot'),
                new Account(Name = 'account 8', Rating = 'Warm'),
                new Account(Name = 'account 9', Rating = 'Hot'),
                new Account(Name = 'account 10', Rating = 'Warm'),
                new Account(Name = 'account 11', Rating = null)
                };
        insert acc; //Insert into the database

        //Begin Test
        Test.startTest();
        //Call the method
        Map<String, List<Account>> results = apexPractice.groupAccountsByRating();

        //Verify the results
        System.assertEquals(5, results.get('Hot').size(), 'There should be 5 accounts rated "Hot"');
        System.assertEquals(3, results.get('Warm').size(), 'There should be 3 accounts rated "Hot"');
        System.assertEquals(2, results.get('Cold').size(), 'There should be 2 accounts rated "Hot"');
        System.assertEquals(5, results.get(null).size(), 'There should be 1 account w/a "null" rating');

        Test.stopTest();
    }
}