package core.mvc {
    import core.ecs.CSystem;
    
    import laya.utils.Handler;
    
    public class CView {
        protected var system:CSystem = null;
        public function CView(sys:CSystem) {
            system = sys;
        }
        
        protected function get assetsURL():Array{
            return [];
        }
        
        public function showView():void{
            _loaderAssets();
        }
        
        public function closeView():void{
        
        }
        
        public function hideView():void{
        
        }
        
        private function _loaderAssets():void{
            Laya.loader.load(assetsURL,new Handler(this,assetsComplete));
        }
        
        protected function assetsComplete():void{
        
        }
    }
}
