@isTest class SoqlOptionsTest {

    @isTest static void testDefault(){
        System.assertEquals(true,SoqlOptions.DEFAULT_OPTIONS.escapeSingleQuotes);
        System.assertEquals(false,SoqlOptions.DEFAULT_OPTIONS.wildcardStringsInLikeOperators);
    }

    @isTest static void test_escapeSingleQuotes(){
        final SoqlOptions options = new SoqlOptions();
        System.assertEquals(true,options.escapeSingleQuotes);
        System.assertEquals(options,options.doNotEscapeSingleQuotes());
        System.assertEquals(false,options.escapeSingleQuotes);
        System.assertEquals(options,options.escapeSingleQuotes());
        System.assertEquals(true,options.escapeSingleQuotes);
    }

    @isTest static void test_wildcardStringsInLikeOperators(){
        final SoqlOptions options = new SoqlOptions();
        System.assertEquals(false,options.wildcardStringsInLikeOperators);
        System.assertEquals(options,options.wildcardStringsInLikeOperators());
        System.assertEquals(true,options.wildcardStringsInLikeOperators);
        System.assertEquals(options,options.doNotWildcardStringsInLikeOperators());
        System.assertEquals(false,options.wildcardStringsInLikeOperators);
    }


}