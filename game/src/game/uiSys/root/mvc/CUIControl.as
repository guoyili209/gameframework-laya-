package game.uiSys.root.mvc {
    import core.ecs.CSystem;
    import core.mvc.CController;
    
    import game.uiSys.root.mvc.CUIModel;
    
    public class CUIControl extends CController {
        public function CUIControl(system:CSystem) {
            super(system);
        }
        
        override protected function init():void{
        
        }
        
        override protected function registerSocket():void{
        
        }
        
        override public function sendCMDData(cmd:int,data:Object):void{
        
        }
    }
}
