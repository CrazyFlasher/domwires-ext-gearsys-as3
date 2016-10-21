/**
 * Created by Anton Nefjodov on 13.04.2016.
 */
package com.domwires.extension.gearSys.messages
{
	import com.domwires.core.common.Enum;

	public class GearSysMessageEnum extends Enum
	{
		public static const INITIALIZED:GearSysMessageEnum = new GearSysMessageEnum("INITIALIZED");
		public static const STEP:GearSysMessageEnum = new GearSysMessageEnum("STEP");

		public function GearSysMessageEnum(name:String)
		{
			super(name);
		}
	}
}
