@isTest class RandomUtilsTest {

    @isTest static void testNextBoolean(){
    	System.assertNotEquals(null,RandomUtils.nextBoolean());
    }

    @isTest static void testNextInteger(){
        assertNextInteger(ApexLangUtils.MAX_INTEGER_RANGE,true,RandomUtils.nextInteger());
    }

    @isTest static void testNextInteger_Integer(){
        IntegerRange inputRange = null;
        for(Integer i = -2; i <= 2; i++){
            inputRange = new IntegerRange(0,Math.abs(i));
            assertNextInteger(inputRange,true,RandomUtils.nextInteger(i));
        }
    }

    @isTest static void testNextInteger_Integer_Boolean(){
        IntegerRange inputRange = null;
        for(Integer i = -2; i <= 2; i++){
            inputRange = new IntegerRange(0,Math.abs(i));
            assertNextInteger(inputRange,true,RandomUtils.nextInteger(i,true));
            assertNextInteger(inputRange,false,RandomUtils.nextInteger(i,false));
        }
    }

    @isTest static void testNextInteger_Integer_Integer(){
        IntegerRange inputRange = null;
        for(Integer i = -2; i <= 2; i++){
            for(Integer j = -2; j <= 2; j++){
                inputRange = new IntegerRange(i,j);
                assertNextInteger(inputRange,true,RandomUtils.nextInteger(i,j));
            }
        }
    }

    @isTest static void testNextInteger_Integer_Integer_Boolean(){
        IntegerRange inputRange = null;
        for(Integer i = -2; i <= 2; i++){
            for(Integer j = -2; j <= 2; j++){
                inputRange = new IntegerRange(i,j);
                assertNextInteger(inputRange,true,RandomUtils.nextInteger(i,j,true));
                assertNextInteger(inputRange,false,RandomUtils.nextInteger(i,j,false));
            }
        }
    }

    @isTest static void testNextInteger_IntegerRange(){
        IntegerRange inputRange = null;
        for(Integer i = -2; i <= 2; i++){
            for(Integer j = -2; j <= 2; j++){
                inputRange = new IntegerRange(i,j);
                assertNextInteger(inputRange,true,RandomUtils.nextInteger(inputRange));
            }
        }
    }

    @isTest static void testNextInteger_IntegerRange_Boolean(){
        IntegerRange inputRange = null;
        for(Integer i = -2; i <= 2; i++){
            for(Integer j = -2; j <= 2; j++){
                inputRange = new IntegerRange(i,j);
                assertNextInteger(inputRange,true,RandomUtils.nextInteger(inputRange,true));
                assertNextInteger(inputRange,false,RandomUtils.nextInteger(inputRange,false));
            }
        }
    }

    @isTest static void testNextInteger_IntegerRange_Boolean_NULL(){
    	final IntegerRange nullRange = null;
    	System.assertEquals(null,RandomUtils.nextInteger(nullRange,true));
    }

    private static void assertNextInteger(IntegerRange inputRange, Boolean inclusive, Integer actual){
        IntegerRange acceptableRange = null;
        if(!inclusive && (inputRange.max()-inputRange.min()) <= 2){
            acceptableRange = new IntegerRange(inputRange.min(),inputRange.min());
        } else {
        	acceptableRange = new IntegerRange(
        	   inputRange.min() - (inclusive ? 0 : 1)
        	   ,inputRange.max() - (inclusive ? 0 : 1)
        	);
        }
        System.assert(
            acceptableRange.contains(actual), 
            'RandomUtils.nextInteger(' + inputRange.toAString() + ',' + inclusive + ') returned ' + actual);
    }
    
    @isTest static void testNextLong(){
        assertNextLong(ApexLangUtils.MAX_LONG_RANGE,true,RandomUtils.nextLong());
    }

    @isTest static void testNextLong_Long(){
        LongRange inputRange = null;
        for(Long i = -2; i <= 2; i++){
            inputRange = new LongRange(0,Math.abs(i));
            assertNextLong(inputRange,true,RandomUtils.nextLong(i));
        }
    }

    @isTest static void testNextLong_Long_Boolean(){
        LongRange inputRange = null;
        for(Long i = -2; i <= 2; i++){
            inputRange = new LongRange(0,Math.abs(i));
            assertNextLong(inputRange,true,RandomUtils.nextLong(i,true));
            assertNextLong(inputRange,false,RandomUtils.nextLong(i,false));
        }
    }

    @isTest static void testNextLong_Long_Long(){
        LongRange inputRange = null;
        for(Long i = -2; i <= 2; i++){
            for(Long j = -2; j <= 2; j++){
                inputRange = new LongRange(i,j);
                assertNextLong(inputRange,true,RandomUtils.nextLong(i,j));
            }
        }
    }

    @isTest static void testNextLong_Long_Long_Boolean(){
        LongRange inputRange = null;
        for(Long i = -2; i <= 2; i++){
            for(Long j = -2; j <= 2; j++){
                inputRange = new LongRange(i,j);
                assertNextLong(inputRange,true,RandomUtils.nextLong(i,j,true));
                assertNextLong(inputRange,false,RandomUtils.nextLong(i,j,false));
            }
        }
    }

    @isTest static void testNextLong_LongRange(){
        LongRange inputRange = null;
        for(Long i = -2; i <= 2; i++){
            for(Long j = -2; j <= 2; j++){
                inputRange = new LongRange(i,j);
                assertNextLong(inputRange,true,RandomUtils.nextLong(inputRange));
            }
        }
    }

    @isTest static void testNextLong_LongRange_Boolean(){
        LongRange inputRange = null;
        for(Long i = -2; i <= 2; i++){
            for(Long j = -2; j <= 2; j++){
                inputRange = new LongRange(i,j);
                assertNextLong(inputRange,true,RandomUtils.nextLong(inputRange,true));
                assertNextLong(inputRange,false,RandomUtils.nextLong(inputRange,false));
            }
        }
    }

    @isTest static void testNextLong_LongRange_Boolean_NULL(){
        final LongRange nullRange = null;
        System.assertEquals(null,RandomUtils.nextLong(nullRange,true));
    }

    private static void assertNextLong(LongRange inputRange, Boolean inclusive, Long actual){
        LongRange acceptableRange = null;
        if(!inclusive && (inputRange.max()-inputRange.min()) <= 2){
            acceptableRange = new LongRange(inputRange.min(),inputRange.min());
        } else {
            acceptableRange = new LongRange(
               inputRange.min() - (inclusive ? 0 : 1)
               ,inputRange.max() - (inclusive ? 0 : 1)
            );
        }
        System.assert(
            acceptableRange.contains(actual), 
            'RandomUtils.nextLong(' + inputRange.toAString() + ',' + inclusive + ') returned ' + actual);
    }    

}