package game.uiSys.root.mvc {
    import core.ecs.CSystem;
    import core.mvc.CModel;
    
    public class CUIModel extends CModel {
        public function CUIModel(sys:CSystem) {
            super(sys);
        }
        
        override protected function init():void{
        
        }
        
        override public function setData(data:Object):void{
            system.event("test");
        }
    }
}
