package game.level {
    import core.ecs.CSystem;
    
    import game.CAppFacade;
    
    public class CLevelSystem extends CSystem {
        public function CLevelSystem(facade:CAppFacade) {
            super(facade);
        }
    }
}
