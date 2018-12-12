package game.ui.mvc {
    import game.ui.*;
    import core.ecs.CSystem;
    import core.mvc.CView;
    
    import game.ui.CUISystem;
    
    import laya.debug.view.nodeInfo.nodetree.MinBtnComp;
    
    import laya.events.Event;
    
    import laya.net.Loader;
    
    import ui.demo.DemoUI;
    
    public class CUIViewHandler extends CView {
        public function CUIViewHandler(sys:CSystem) {
            super(sys);
        }
        
        override protected function get assetsURL():Array{
            return [{url:"res/atlas/demo.atlas",type:Loader.ATLAS}];
        }
        
        override protected function assetsComplete():void{
            var demoUI:DemoUI = new DemoUI();
            system.facade.appStage.addChildFirstPopup(demoUI);
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
