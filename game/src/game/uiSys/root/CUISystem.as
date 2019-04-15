package game.uiSys.root {
    import avmplus.getQualifiedClassName;
    
    import core.IBundleSystem;
    import core.ecs.CSystem;
    
    import game.CAppFacade;
    import game.gameSys.log.CLogSystem;
    import game.uiSys.root.mvc.CUIView;
    
    public class CUISystem extends CSystem implements IBundleSystem {
        public function CUISystem(facade:CAppFacade) {
            super(facade);
        }
    
        public function get systemTag():String {
            (facade.getSystem(CLogSystem) as CLogSystem).errorMsg(getQualifiedClassName(this) + ":没有设置systemTag");
            return "";
        }
    
        public function get isActivated():Boolean {
            return _isActivated;
        }
    
        public function setActivated(bool:Boolean):void {
            if (_isActivated == bool) return;
            _isActivated = bool;
            if(_isActivated){
                (facade.getSystem(CLogSystem) as CLogSystem).normalMsg("激活系统:" + this.systemTag);
            }else{
                (facade.getSystem(CLogSystem) as CLogSystem).normalMsg("禁用系统:" + this.systemTag);
            }
            //to do
            //显示或关闭UI界面
        }
    
        override protected function _init():void {
            //to do
            //注入mvc三个类，或者其他需要存储在这个系统的实例对象
        }
        private var _isActivated:Boolean = false;
    }
}
