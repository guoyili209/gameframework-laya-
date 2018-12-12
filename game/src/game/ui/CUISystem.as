package game.ui {
    import core.IBundleSystem;
    import core.ecs.CSystem;
    
    import game.CAppFacade;
    import game.ESystemTag;
    import game.ui.mvc.CUIControlHandler;
    import game.ui.mvc.CUIModelHandler;
    import game.ui.mvc.CUIViewHandler;
    
    public class CUISystem extends CSystem implements IBundleSystem{
        public function CUISystem(facade:CAppFacade) {
            super(facade);
            _init();
        }
        
        public function get systemTag():String{
            return ESystemTag.UISYSTEM_TAG;
        }
        
        public function setActivated(bool:Boolean):void{
            trace("激活系统:"+this.systemTag);
            if(bool){
                var viewHandler:CUIViewHandler = getBean(CUIViewHandler) as CUIViewHandler;
                viewHandler.showView();
            }
        }
        
        private function _init():void{
            addBean(new CUIModelHandler(this));
            addBean(new CUIControlHandler(this));
            addBean(new CUIViewHandler(this));
            _initComplete();
        }
        
        private function _initComplete():void{
            var viewHandler:CUIViewHandler = getBean(CUIViewHandler) as CUIViewHandler;
            viewHandler.showView();
        }
    }
}
