@isTest class AndConditionTest {

	@isTest static void testAndConditionEmpty() {
		System.assertEquals('', new AndCondition().toSoql());
	}
	
	@isTest static void testNestedAndConditionEmpty() {
		System.assertEquals('', new AndCondition().add(new AndCondition()).add(new AndCondition()).toSoql());
	}
	
	@isTest static void testAndConditionWithOneConditionOnly() {
		System.assertEquals(
		    'name = \'acme\'',
		    new AndCondition()
		    .add(new FieldCondition('name ', Operator.EQUALS, 'acme'))
		    .toSoql());
	}
	
	@isTest static void testTwoFieldConditions() {
		System.assertEquals(
		    '(name = \'acme\' AND ispartner = true)',
		    new AndCondition()
		    .add(new FieldCondition('name ', Operator.EQUALS, 'acme'))
		    .add(new FieldCondition('ispartner', Operator.EQUALS, true))
		    .toSoql()
		);
	}
	
}