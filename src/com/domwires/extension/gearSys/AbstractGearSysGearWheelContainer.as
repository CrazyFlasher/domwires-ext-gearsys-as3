/**
 * Created by Anton Nefjodov on 18.05.2016.
 */
package com.domwires.extension.gearSys
{
	import com.domwires.core.mvc.hierarchy.HierarchyObjectContainer;

	internal class AbstractGearSysGearWheelContainer extends HierarchyObjectContainer implements IGearSysGearWheelContainer
	{
		private var _isEnabled:Boolean = true;

		public function AbstractGearSysGearWheelContainer()
		{
			super();
		}

		/**
		 * @inheritDoc
		 */
		public function interact(timePassed:Number):void
		{
		}

		/**
		 * @inheritDoc
		 */
		public function setEnabled(value:Boolean):IGearSysGearWheel
		{
			if (isDisposed)
			{
				throw new Error("Object disposed!");
			}

			if (_isEnabled == value) return this;

			_isEnabled = value;

			return this;
		}

		/**
		 * @inheritDoc
		 */
		public function get isEnabled():Boolean
		{
			return _isEnabled;
		}
	}
}
