package game.uiSys.root.mvc {
    import core.ecs.CSystem;
    import core.mvc.CView;
    
    import game.gameSys.log.CLogSystem;
    
    import game.uiSys.root.CCommonUISystem;
    
    import laya.display.Sprite;
    import laya.utils.Handler;
    
    public class CUIView extends CView {
        public function addDialog(view:Sprite):void {
            view ? this._pDialogContainer.addChild(view):(system.facade.getSystem(CLogSystem) as CLogSystem).errorMsg("不能添加空视图：" + view);
        }
        public function closeDialog():void {
            this._pDialogContainer.removeChildren();
        }
        public function addPopupDialog(view:Sprite):void {
            view ? this._pPopupDialogContainer.addChild(view) : (system.facade.getSystem(CLogSystem) as CLogSystem).errorMsg("不能添加空二级弹窗：" + view);
        }
        public function closePopupDialog(view:Sprite):void {
            this._pPopupDialogContainer.removeChildren();
        }
        public function CUIView(sys:CSystem) {
            super(sys);
            this._pRootContainer = (sys.facade.getSystem(CCommonUISystem) as CCommonUISystem).uiContainer;
            _initDialogContainer();
        }
        override public function closeView():void {
            system.facade.recordView.removeView();
            this._pRootContainer.removeChildren();
        }
        override public function showView():void {
            _loaderAssets();
        }
        protected function get assetsURL():Array {
            return [];
        }
        private function _loaderAssets():void {
            Laya.loader.load(assetsURL, new Handler(this, assetsComplete));
        }
        protected function assetsComplete():void {
            system.facade.recordView.addView(this);
        }
        private function _initDialogContainer():void{
            this._pDialogContainer = new Sprite();
            this._pPopupDialogContainer = new Sprite();
            this._pRootContainer.addChild(_pDialogContainer);
            this._pPopupDialogContainer.addChild(_pPopupDialogContainer);
            _drawPopupBackground();
        }
        private function _drawPopupBackground():void{
            //添加灰色背景，比如点击空白处关闭
        }
        private var _pRootContainer:Sprite = null;
        private var _pDialogContainer:Sprite = null;
        private var _pPopupDialogContainer:Sprite = null;
    }
    
}
