package game.uiSys.sign.view {
    import core.ecs.CSystem;
    
    import game.uiSys.root.mvc.CUIView;
    
    import laya.events.Event;
    
    import laya.net.Loader;
    
    import ui.demo.DemoUI;
    
    public class CSignViewHandler extends CUIView {
        public function CSignViewHandler(sys:CSystem) {
            super(sys);
        }
        override protected function get assetsURL():Array{
            return [{url:"res/atlas/demo.atlas",type:Loader.ATLAS}];
        }
        override protected function assetsComplete():void{
            var demoUI:DemoUI = new DemoUI();
//            _system.facade.appStage.addChildFirstPopup(demoUI);
            demoUI.btn1.on(Event.CLICK,this,_activateSystem,[demoUI.btn1.name]);
            _addListener();
        }
        private function _activateSystem(name:String):void{
            system.facade.activateSystemByTag(name,true);
        }
        private function _addListener():void{
            system.on("test",this,_test);
        }
        private function _test():void{
        
        }
    }
}
