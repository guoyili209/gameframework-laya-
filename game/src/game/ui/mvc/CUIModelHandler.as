package game.ui.mvc {
    import core.ecs.CSystem;
    import core.mvc.CModel;
    
    public class CUIModelHandler extends CModel {
        public function CUIModelHandler(sys:CSystem) {
            super(sys);
        }
        
        override protected function init():void{
        
        }
        
        override public function setData(data:Object):void{
            system.event("test");
        }
    }
}
