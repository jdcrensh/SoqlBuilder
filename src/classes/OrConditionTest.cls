@isTest class OrConditionTest {
    
    @isTest static void testOrConditionEmpty(){
        System.assertEquals('',new OrCondition().toSoql());   
    }

    @isTest static void testNestedOrConditionEmpty(){
        System.assertEquals('',new OrCondition().add(new OrCondition()).add(new OrCondition()).toSoql());   
    }

    @isTest static void testOrConditionWithOneConditionOnly(){
        System.assertEquals(
            'name = \'acme\'',
            new OrCondition()
                .add(new FieldCondition('name ',Operator.EQUALS,'acme'))
                .toSoql());   
    }

    @isTest static void testTwoFieldConditions(){
        System.assertEquals(
            '(name = \'acme\' OR ispartner = true)',
            new OrCondition()
                .add(new FieldCondition('name ',Operator.EQUALS,'acme'))
                .add(new FieldCondition('ispartner',Operator.EQUALS,true))
                .toSoql()
        );   
    }

}