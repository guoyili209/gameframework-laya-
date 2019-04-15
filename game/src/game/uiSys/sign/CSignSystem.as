package game.uiSys.sign {
    import avmplus.getQualifiedClassName;
    
    import game.CAppFacade;
    import game.gameSys.log.CLogSystem;
    import game.uiSys.root.CUISystem;
    import game.uiSys.root.mvc.CUIView;
    import game.uiSys.sign.control.CSignControlHandler;
    import game.uiSys.sign.model.CSignModelHandler;
    import game.uiSys.sign.view.CSignViewHandler;
    
    public class CSignSystem extends CUISystem {
        public function CSignSystem(facade:CAppFacade) {
            super(facade);
        }
    
        override public function get systemTag():String {
//            (facade.getSystem(CLogSystem) as CLogSystem).errorMsg(getQualifiedClassName(this) + ":没有设置systemTag");
            return "";
        }
    
        override public function get isActivated():Boolean {
            return _isActivated;
        }
    
        override public function setActivated(bool:Boolean):void {
            if (_isActivated == bool) return;
            trace("激活系统:" + this.systemTag);
            _isActivated = bool;
            var viewHandler:CUIView = getBean(CUIView) as CUIView;
            if (bool) {
                viewHandler.showView();
            } else {
                viewHandler.closeView();
            }
        }
    
        override protected function _init():void {
            addBean(new CSignModelHandler(this));
            addBean(new CSignControlHandler(this));
            addBean(new CSignViewHandler(this));
            _initComplete();
        }
    
        private function _initComplete():void {
            var viewHandler:CUIView = getBean(CUIView) as CUIView;
            viewHandler.showView();
        }
    
        private var _isActivated:Boolean = false;
    }
}
