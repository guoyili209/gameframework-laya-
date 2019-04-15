package core.mvc {
    import core.ecs.CSystem;
    
    import laya.utils.Handler;
    
    public class CView {
        protected var system:CSystem = null;
        public function CView(sys:CSystem) {
            system = sys;
        }
        
        public function showView():void{
        
        }
        
        public function closeView():void{
        
        }
        
        public function hideView():void{
        
        }
        
        
    }
}
