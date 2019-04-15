package game.uiSys.root {
    import core.ecs.CSystem;
    
    import game.CAppFacade;
    
    import laya.display.Sprite;
    
    public class CCommonUISystem extends CSystem {
        public function CCommonUISystem(facade:CAppFacade) {
            super(facade);
        }
        
        public function get uiContainer():Sprite {
            return this._uiContainer;
        }
        
        public function get topUIContainer():Sprite {
            return this._topUIContainer;
        }
        
        public function addTips(msg:String,type:int = CTipsView.NORMAL):void {
        
        }
        
        override protected function _init():void {
            this._rootUIContainer = facade.appStage.uiLayer;
            this._uiContainer = new Sprite();
            this._topUIContainer = new Sprite();
            this._tipsContainer = new Sprite();
            this._rootUIContainer.addChild(this._uiContainer);
            this._rootUIContainer.addChild(this._topUIContainer);
            this._rootUIContainer.addChild(this._tipsContainer);
        }
        
        private var _uiContainer:Sprite = null;//显示UI界面的容器
        private var _topUIContainer:Sprite = null;//ui顶层常驻按钮，比如返回视图按钮，商店等
        private var _tipsContainer:Sprite = null;
        private var _rootUIContainer:Sprite = null;//appStage中ui的根容器
    }
}
