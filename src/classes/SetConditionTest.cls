@isTest class SetConditionTest {
    
    @isTest static void testInvalidField(){
        Boolean exceptionCaught = false;
        try{
            new SetCondition('  ');
        }catch(IllegalArgumentException e){
            exceptionCaught = true;
        }
        System.assert(
            exceptionCaught == true, 
            'empty field param to FieldCondition constructor did not throw IllegalArgumentException');
    }

    @isTest static void testInvalidOperator_EQUALS(){
        Boolean exceptionCaught = false;
        try{
            new SetCondition('x',Operator.EQUALS,new List<Object>{1,2});
        }catch(IllegalArgumentException e){
            exceptionCaught = true;
        }
        System.assert(exceptionCaught == true,'IllegalArgumentException not thrown');
    }

    @isTest static void testNullValue_List(){
        Boolean exceptionCaught = false;
        List<Object> value = null;
        try{
            new SetCondition('x',Operator.INCLUDES,value);
        }catch(IllegalArgumentException e){
            exceptionCaught = true;
        }
        System.assert(exceptionCaught == true,'IllegalArgumentException not thrown');
    }

    @isTest static void testNullValue_SoqlBuilder(){
        Boolean exceptionCaught = false;
        SoqlBuilder value = null;
        try{
            new SetCondition('x',Operator.NOT_IN,value);
        }catch(IllegalArgumentException e){
            exceptionCaught = true;
        }
        System.assert(exceptionCaught == true,'IllegalArgumentException not thrown');
    }

    @isTest static void testEmptyValue(){
        Boolean exceptionCaught = false;
        try{
            new SetCondition('x',Operator.INCLUDES,new List<Object>{});
        }catch(IllegalArgumentException e){
            exceptionCaught = true;
        }
        System.assert(exceptionCaught == true,'IllegalArgumentException not thrown');
    }

    @isTest static void testNameNotDefined(){
        Boolean exceptionCaught = false;
        try{
            new SetCondition().toSoql();   
        }catch(IllegalStateException e){
            exceptionCaught = true;
        }
        System.assert(exceptionCaught == true,'IllegalStateException not thrown');
    }

    @isTest static void testOperationNotDefined(){
        Boolean exceptionCaught = false;
        try{
            new SetCondition('name').toSoql();   
        }catch(IllegalStateException e){
            exceptionCaught = true;
        }
        System.assert(exceptionCaught == true,'IllegalStateException not thrown');
    }

    @isTest static void testInvalidValue(){
        Boolean exceptionCaught = false;
        try{
            new SetCondition('name').includes(new List<Object>{new DecimalRange(0,1)}).toSoql();   
        }catch(IllegalArgumentException e){
            exceptionCaught = true;
        }
        System.assert(exceptionCaught == true,'IllegalArgumentException not thrown');
    }

    @isTest static void testNullValuesList(){
        Boolean exceptionCaught = false;
        List<Object> value = null;
        try{
            new SetCondition('name').includes(value);   
        }catch(IllegalArgumentException e){
            exceptionCaught = true;
        }
        System.assert(exceptionCaught == true,'IllegalArgumentException not thrown');
    }

    @isTest static void testEmptyValuesList(){
        Boolean exceptionCaught = false;
        try{
            new SetCondition('name').includes(new List<Object>());   
        }catch(IllegalArgumentException e){
            exceptionCaught = true;
        }
        System.assert(exceptionCaught == true,'IllegalArgumentException not thrown');
    }

    @isTest static void testIncludes(){
        System.assertEquals(
            'name INCLUDES (\'test\',123)',
            new SetCondition('name').includes(new List<Object>{'test',123}).toSoql());   
    }

    @isTest static void testExcludes(){
        System.assertEquals(
            'name EXCLUDES (\'test\',123)',
            new SetCondition('name').excludes(new List<Object>{'test',123}).toSoql());   
    }

    @isTest static void testIn(){
        System.assertEquals(
            'name IN (\'test\',123)',
            new SetCondition('name').inx(new List<Object>{'test',123}).toSoql());   
    }

    @isTest static void testNotIn(){
        System.assertEquals(
            'name NOT IN (\'test\',123)',
            new SetCondition('name').notIn(new List<Object>{'test',123}).toSoql());   
    }

    @isTest static void testOperatorMethod_includes(){
        System.assertEquals('x INCLUDES (1,2)',new SetCondition().field('x').includes(new List<Object>{1,2}).toSoql());   
        System.assertEquals('x INCLUDES (1,2)',new SetCondition('x').includes(new List<Object>{1,2}).toSoql());   
        System.assertEquals('x INCLUDES (1,2)',new SetCondition('x',Operator.INCLUDES,new List<Object>{1,2}).toSoql());   
    }

    @isTest static void testOperatorMethod_excludes(){
        System.assertEquals('x EXCLUDES (1,2)',new SetCondition().field('x').excludes(new List<Object>{1,2}).toSoql());   
        System.assertEquals('x EXCLUDES (1,2)',new SetCondition('x').excludes(new List<Object>{1,2}).toSoql());   
        System.assertEquals('x EXCLUDES (1,2)',new SetCondition('x',Operator.excludes,new List<Object>{1,2}).toSoql());   
    }

    @isTest static void testOperatorMethod_inx(){
        System.assertEquals('x IN (1,2)',new SetCondition().field('x').inx(new List<Object>{1,2}).toSoql());   
        System.assertEquals('x IN (1,2)',new SetCondition('x').inx(new List<Object>{1,2}).toSoql());   
        System.assertEquals('x IN (1,2)',new SetCondition('x',Operator.INX,new List<Object>{1,2}).toSoql());   
    }

    @isTest static void testOperatorMethod_notIn(){
        System.assertEquals('x NOT IN (1,2)',new SetCondition().field('x').notIn(new List<Object>{1,2}).toSoql());   
        System.assertEquals('x NOT IN (1,2)',new SetCondition('x').notIn(new List<Object>{1,2}).toSoql());   
        System.assertEquals('x NOT IN (1,2)',new SetCondition('x',Operator.NOT_IN,new List<Object>{1,2}).toSoql());   
    }


    @isTest static void testBasicSemiJoin_Constructor(){
        System.assertEquals('ID IN (SELECT AccountId FROM Opportunity WHERE StageName = \'Closed Lost\')',
            new SetCondition('ID', Operator.INX, 
                new SoqlBuilder().selectx('AccountId').fromx('Opportunity').wherex(new FieldCondition('StageName','Closed Lost'))
            ).toSoql());   
    }
    
    @isTest static void testBasicSemiJoin_1(){
        System.assertEquals('ID IN (SELECT AccountId FROM Opportunity WHERE StageName = \'Closed Lost\')',
            new SetCondition('ID').inx(
                new SoqlBuilder().selectx('AccountId').fromx('Opportunity').wherex(new FieldCondition('StageName','Closed Lost'))
            ).toSoql());   
    }

    @isTest static void testBasicSemiJoin_2(){
        System.assertEquals('ID NOT IN (SELECT AccountId FROM Opportunity WHERE StageName = \'Closed Lost\')',
            new SetCondition('ID').notIn(
                new SoqlBuilder().selectx('AccountId').fromx('Opportunity').wherex(new FieldCondition('StageName','Closed Lost'))
            ).toSoql());   
    }

    @isTest static void testBasicSemiJoin_3(){
        System.assertEquals('ID INCLUDES (SELECT AccountId FROM Opportunity WHERE StageName = \'Closed Lost\')',
            new SetCondition('ID').includes(
                new SoqlBuilder().selectx('AccountId').fromx('Opportunity').wherex(new FieldCondition('StageName','Closed Lost'))
            ).toSoql());   
    }

    @isTest static void testBasicSemiJoin_4(){
        System.assertEquals('ID EXCLUDES (SELECT AccountId FROM Opportunity WHERE StageName = \'Closed Lost\')',
            new SetCondition('ID').excludes(
                new SoqlBuilder().selectx('AccountId').fromx('Opportunity').wherex(new FieldCondition('StageName','Closed Lost'))
            ).toSoql());   
    }


}