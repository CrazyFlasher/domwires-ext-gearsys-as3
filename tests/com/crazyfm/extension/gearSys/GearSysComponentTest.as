/**
 * Created by Anton Nefjodov on 10.03.2016.
 */
package com.crazyfm.extension.gearSys
{
	import com.domwires.extension.gearSys.GearSysComponent;
	import com.domwires.extension.gearSys.GearSysObject;
	import com.domwires.extension.gearSys.IGearSysComponent;
	import com.domwires.extension.gearSys.IGearSysObject;

	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNull;

	public class GearSysComponentTest
	{
		private var c:IGearSysComponent;

		[Before]
		public function setUp():void
		{
			c = new GearSysComponent();
		}

		[After]
		public function tearDown():void
		{
			c.dispose();
		}

		[Test]
		public function testAdvanceTime():void
		{

		}

		[Test]
		public function testGetGameObject():void
		{
			assertNull(c.parent);
			var go:IGearSysObject = new GearSysObject();
			go.addComponent(c);
			assertEquals(c.parent, go);
			go.removeComponent(c);
			assertNull(c.parent);
		}
	}
}
