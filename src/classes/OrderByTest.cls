@isTest class OrderByTest {

    @isTest static void testNullFieldName(){
        assertIllegalArgumentThrown(null);
    }

    @isTest static void testBlankFieldName(){
        assertIllegalArgumentThrown(' ');
    }

    private static void assertIllegalArgumentThrown(final String name){
        Boolean exceptionCaught = false;
        try{
            new OrderBy(name);
        }catch(IllegalArgumentException e){
            exceptionCaught = true;
        }
        System.assert(exceptionCaught == true,'IllegalArgumentException not thrown');
    }

    @isTest static void testNameOnly(){
        final OrderBy orderBy = new OrderBy('name');
        System.assertNotEquals(null,orderBy);
        System.assertEquals(true,orderBy.ascending);
        System.assertEquals(false,orderBy.nullsFirst);
        System.assertEquals(false,orderBy.descending);
        System.assertEquals(true,orderBy.nullsLast);
        System.assertEquals('name',orderBy.toSoql());
    }

    @isTest static void testAscendingNullsLast(){
        OrderBy orderBy = new OrderBy('name').ascending().nullsLast();
        System.assertNotEquals(null,orderBy);
        System.assertEquals(true,orderBy.ascending);
        System.assertEquals(false,orderBy.descending);
        System.assertEquals(true,orderBy.nullsLast);
        System.assertEquals(false,orderBy.nullsFirst);
        System.assertEquals('name ASC NULLS LAST',orderBy.toSoql());

        orderBy = new OrderBy('name').nullsLast().ascending();
        System.assertNotEquals(null,orderBy);
        System.assertEquals(true,orderBy.ascending);
        System.assertEquals(false,orderBy.descending);
        System.assertEquals(true,orderBy.nullsLast);
        System.assertEquals(false,orderBy.nullsFirst);
        System.assertEquals('name ASC NULLS LAST',orderBy.toSoql());
    }

    @isTest static void testDescendingNullsFirst(){
        OrderBy orderBy = new OrderBy('name').descending().nullsFirst();
        System.assertNotEquals(null,orderBy);
        System.assertEquals(true,orderBy.descending);
        System.assertEquals(true,orderBy.nullsFirst);
        System.assertEquals(false,orderBy.ascending);
        System.assertEquals(false,orderBy.nullsLast);
        System.assertEquals('name DESC NULLS FIRST',orderBy.toSoql());

        orderBy = new OrderBy('name').nullsFirst().descending();
        System.assertNotEquals(null,orderBy);
        System.assertEquals(true,orderBy.descending);
        System.assertEquals(true,orderBy.nullsFirst);
        System.assertEquals(false,orderBy.ascending);
        System.assertEquals(false,orderBy.nullsLast);
        System.assertEquals('name DESC NULLS FIRST',orderBy.toSoql());
    }

    @isTest static void testAscendingNullsFirst(){
        OrderBy orderBy = new OrderBy('name').ascending().nullsFirst();
        System.assertNotEquals(null,orderBy);
        System.assertEquals(true,orderBy.ascending);
        System.assertEquals(false,orderBy.descending);
        System.assertEquals(false,orderBy.nullsLast);
        System.assertEquals(true,orderBy.nullsFirst);
        System.assertEquals('name ASC NULLS FIRST',orderBy.toSoql());

        orderBy = new OrderBy('name').nullsFirst().ascending();
        System.assertNotEquals(null,orderBy);
        System.assertEquals(true,orderBy.ascending);
        System.assertEquals(false,orderBy.descending);
        System.assertEquals(false,orderBy.nullsLast);
        System.assertEquals(true,orderBy.nullsFirst);
        System.assertEquals('name ASC NULLS FIRST',orderBy.toSoql());
    }

    @isTest static void testDescendingNullsLast(){
        OrderBy orderBy = new OrderBy('name').descending().nullsLast();
        System.assertNotEquals(null,orderBy);
        System.assertEquals(true,orderBy.descending);
        System.assertEquals(false,orderBy.nullsFirst);
        System.assertEquals(false,orderBy.ascending);
        System.assertEquals(true,orderBy.nullsLast);
        System.assertEquals('name DESC NULLS LAST',orderBy.toSoql());

        orderBy = new OrderBy('name').nullsLast().descending();
        System.assertNotEquals(null,orderBy);
        System.assertEquals(true,orderBy.descending);
        System.assertEquals(false,orderBy.nullsFirst);
        System.assertEquals(false,orderBy.ascending);
        System.assertEquals(true,orderBy.nullsLast);
        System.assertEquals('name DESC NULLS LAST',orderBy.toSoql());
    }


    @isTest static void testAscending(){
        OrderBy orderBy = new OrderBy('name').ascending();
        System.assertNotEquals(null,orderBy);
        System.assertEquals(true,orderBy.ascending);
        System.assertEquals(true,orderBy.nullsLast);
        System.assertEquals(false,orderBy.descending);
        System.assertEquals(false,orderBy.nullsFirst);
        System.assertEquals('name ASC',orderBy.toSoql());
    }

    @isTest static void testDescending(){
        final OrderBy orderBy = new OrderBy('name').descending();
        System.assertNotEquals(null,orderBy);
        System.assertEquals(true,orderBy.descending);
        System.assertEquals(true,orderBy.nullsFirst);
        System.assertEquals(false,orderBy.ascending);
        System.assertEquals(false,orderBy.nullsLast);
        System.assertEquals('name DESC',orderBy.toSoql());
    }

    @isTest static void testNullsFirst(){
        final OrderBy orderBy = new OrderBy('name').nullsFirst();
        System.assertNotEquals(null,orderBy);
        System.assertEquals(true,orderBy.ascending);
        System.assertEquals(false,orderBy.descending);
        System.assertEquals(true,orderBy.nullsFirst);
        System.assertEquals(false,orderBy.nullsLast);
        System.assertEquals('name NULLS FIRST',orderBy.toSoql());
    }

    @isTest static void testNullsLast(){
        final OrderBy orderBy = new OrderBy('name').nullsLast();
        System.assertNotEquals(null,orderBy);
        System.assertEquals(true,orderBy.ascending);
        System.assertEquals(false,orderBy.descending);
        System.assertEquals(false,orderBy.nullsFirst);
        System.assertEquals(true,orderBy.nullsLast);
        System.assertEquals('name NULLS LAST',orderBy.toSoql());
    }


}