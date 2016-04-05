@isTest class FieldTest {

	@isTest static void testName() {
		Field field = new Field('test');
		System.assertNotEquals(null, field);
		System.assertEquals('test', field.toSoql());
	}
	
	@isTest static void testToLabel() {
		Field field = new Field('test').toLabelx();
		System.assertNotEquals(null, field);
		System.assertEquals('toLabel(test)', field.toSoql());
	}
	
	
}