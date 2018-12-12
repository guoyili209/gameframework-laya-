/**Created by the LayaAirIDE,do not modify.*/
package ui.demo {
	import laya.ui.*;
	import laya.display.*; 

	public class DemoUI extends View {
		public var btn1:Button;
		public var btn2:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{},"child":[{"type":"Button","props":{"y":82,"x":99,"var":"btn1","skin":"comp/button.png","name":"BTN1","label":"label"}},{"type":"Button","props":{"y":82,"x":214,"var":"btn2","skin":"comp/button.png","name":"BTN2","label":"label"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}