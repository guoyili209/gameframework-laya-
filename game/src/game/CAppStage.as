package game {
    import laya.display.Sprite;
    
    public class CAppStage {
        private var _sceneLayer:Sprite = null;
        private var _uiLayer:Sprite = null;
        private var _popupFirstLayer:Sprite = null;
        private var _poppupSecondLayer:Sprite = null;
        public function CAppStage() {
            _init();
        }
        
        private function _init():void{
            _sceneLayer = new Sprite();
            _uiLayer = new Sprite();
            _popupFirstLayer = new Sprite();
            _poppupSecondLayer = new Sprite();
            Laya.stage.addChild(_sceneLayer);
            Laya.stage.addChild(_uiLayer);
            Laya.stage.addChild(_popupFirstLayer);
            Laya.stage.addChild(_poppupSecondLayer);
        }
        
        public function addChildFirstPopup(displayObj:Sprite):void{
            _popupFirstLayer.addChild(displayObj);
        }
        
        public function addChildSecondPopup(displayObj:Sprite):void{
            _poppupSecondLayer.addChild(displayObj);
        }
        
        public function get sceneLayer():Sprite{
            return _sceneLayer;
        }
    }
}
