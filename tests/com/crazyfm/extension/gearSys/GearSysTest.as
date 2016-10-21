/**
 * Created by Anton Nefjodov on 21.03.2016.
 */
package com.crazyfm.extension.gearSys
{
	import com.domwires.core.factory.AppFactory;
	import com.domwires.core.factory.IAppFactory;
	import com.domwires.extension.gearSys.GearSysComponent;
	import com.domwires.extension.gearSys.GearSysObject;
	import com.domwires.extension.gearSys.IGearSys;
	import com.domwires.extension.gearSys.IGearSysComponent;
	import com.domwires.extension.gearSys.IGearSysMechanism;
	import com.domwires.extension.gearSys.IGearSysObject;
	import com.domwires.extension.gearSys.mechanisms.EnterFrameMechanism;

	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertNull;
	import org.flexunit.asserts.assertTrue;

	public class GearSysTest
	{
		private var s:IGearSys;

		[Before]
		public function setUp():void
		{
			var factory:IAppFactory = new AppFactory();
			factory.mapToValue(IGearSysMechanism, new EnterFrameMechanism());
			s = factory.getInstance(IGearSys);
		}

		[After]
		public function tearDown():void
		{
			if (!s.isDisposed)
			{
				s.disposeWithAllChildren();	
			}
		}

		[Test]
		public function testNumGameObjects():void
		{
			s.addGameObject(new GearSysObject())
					.addGameObject(new GearSysObject())
					.addGameObject(new GearSysObject());

			assertEquals(s.numGameObjects, 3);
		}

		[Test]
		public function testDisposeWithAllChildren():void
		{
			var c:IGearSysComponent = new GearSysComponent();
			var go:IGearSysObject = new GearSysObject();
			s.addGameObject(new GearSysObject())
				.addGameObject(new GearSysObject())
				.addGameObject(new GearSysObject())
				.addGameObject(go
					.addComponent(c));

			assertTrue(c.gameObject, go);
			assertTrue(c.parent, go);

			s.disposeWithAllChildren();

			assertTrue(s.isDisposed);
			assertEquals(s.numGameObjects, 0);
			assertTrue(go.isDisposed);
			assertTrue(c.isDisposed);
			assertNull(c.parent, c.gameObject);
		}

		[Test]
		public function testRemoveAllGameObjects():void
		{
			var go_1:IGearSysObject = new GearSysObject();
			var go_2:IGearSysObject = new GearSysObject();
			var go_3:IGearSysObject = new GearSysObject();

			s.addGameObject(go_1).addGameObject(go_2).addGameObject(go_3);
			s.removeAllGameObjects();

			assertEquals(s.numGameObjects, 0);
			assertNull(go_1.parent, go_2.parent, go_3.parent);
			assertNull(go_1.gearSys, go_2.gearSys, go_3.gearSys);
		}

		[Test]
		public function testDispose():void
		{
			var go_1:IGearSysObject = new GearSysObject();
			var go_2:IGearSysObject = new GearSysObject();
			var go_3:IGearSysObject = new GearSysObject();

			s.addGameObject(go_1).addGameObject(go_2).addGameObject(go_3);

			s.dispose();

			assertTrue(s.isDisposed);
			assertEquals(s.numGameObjects, 0);
			assertNull(go_1.parent, go_2.parent, go_3.parent);
			assertNull(go_1.gearSys, go_2.gearSys, go_3.gearSys);
		}

		[Test]
		public function testAdvanceTime():void
		{

		}

		[Test]
		public function testRemoveGameObject():void
		{
			var go_1:IGearSysObject = new GearSysObject();
			var go_2:IGearSysObject = new GearSysObject();
			var go_3:IGearSysObject = new GearSysObject();

			s.addGameObject(go_1).addGameObject(go_2).addGameObject(go_3);
			s.removeGameObject(go_2);

			assertEquals(s.numGameObjects, 2);
			assertNull(go_2.gearSys, go_2.parent);
		}

		[Test]
		public function testAddGameObject():void
		{
			assertEquals(s.numGameObjects, 0);
			s.addGameObject(new GearSysObject());
			assertEquals(s.numGameObjects, 1);
		}

		[Test]
		public function testGameObjectList():void
		{
			assertEquals(s.gameObjectList.length, 0);
			s.addGameObject(new GearSysObject());
			assertEquals(s.gameObjectList.length, 1);
			s.disposeWithAllChildren();
			assertNull(s.gameObjectList);
		}

		[Test]
		public function testContainsGameObject():void
		{
			var go_1:IGearSysObject = new GearSysObject();
			var go_2:IGearSysObject = new GearSysObject();
			var go_3:IGearSysObject = new GearSysObject();

			s.addGameObject(go_1).addGameObject(go_2);

			assertTrue(s.containsGameObject(go_1), s.containsGameObject(go_1));
			assertFalse(s.containsGameObject(go_3));
		}
	}
}
