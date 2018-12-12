package core.mvc {
    import core.ecs.CSystem;
    
    public class CModel {
        protected var system:CSystem = null;
        public function CModel(sys:CSystem) {
            system = sys;
            init();
        }
        
        protected function init():void{
        
        }
        
        public function setData(data:Object):void{
        
        }
    }
}
