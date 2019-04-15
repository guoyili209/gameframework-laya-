package game.gameSys.scene {
    import core.ecs.CSystem;
    import core.mvc.CView;
    
    import game.gameSys.scene.camera.CCamera;
    
    import laya.display.Sprite;
    
    public class CSceneViewHandler extends CView {
        private var _groundLayer:Sprite = null;
        private var _characterLayer:Sprite = null;
        private var _rootLayer:Sprite = null;
        
        private var _camera:CCamera = null;
        public function CSceneViewHandler(sys:CSystem) {
            super(sys);
            _init();
        }
        
        public function get camera():CCamera{
            return _camera;
        }
    
        override protected function get assetsURL():Array {
            return [];
        }
    
        override protected function assetsComplete():void {
        
        }
        
        private function _init():void{
            _initLayer();
            _initCamera();
        }
        
        private function _initLayer():void{
            _rootLayer = system.facade.appStage.sceneLayer;
            _groundLayer = new Sprite();
            _characterLayer = new Sprite();
            _rootLayer.addChild(_groundLayer);
            _rootLayer.addChild(_characterLayer);
        }
        
        private function _initCamera():void{
            var layerInfo:Array = [{name:'background',instance:_groundLayer,ratio:0}];
            _camera = new CCamera(Laya.stage,_rootLayer,_characterLayer,layerInfo,true);
        }
    }
}
