package game.uiSys.lobby {
    import core.ecs.CSystem;
    
    import game.CAppFacade;
    import game.uiSys.root.CUISystem;
    
    public class CLobbySystem extends CSystem{
        public function CLobbySystem(facade:CAppFacade) {
            super(facade);
        }
        
        override protected function _init():void{
        
        }
    }
}
