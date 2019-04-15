package game {
    import laya.display.Sprite;
    
    public class CAppStage {
        private var _sceneLayer:Sprite = null;
        private var _uiLayer:Sprite = null;
        private var _logLayer:Sprite = null;
        public function CAppStage() {
            _init();
        }
        
        private function _init():void{
            _sceneLayer = new Sprite();
            _uiLayer = new Sprite();
            _logLayer = new Sprite();
            Laya.stage.addChild(_sceneLayer);
            Laya.stage.addChild(_uiLayer);
            Laya.stage.addChild(_logLayer);
        }
        public function get uiLayer():Sprite{
            return this._uiLayer;
        }
        
        public function get sceneLayer():Sprite{
            return _sceneLayer;
        }
        
        public function get logLayer():Sprite{
            return _logLayer;
        }
    }
}
