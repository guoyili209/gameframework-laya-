package game.gameSys.character {
    import core.ecs.CSystem;
    
    import game.CAppFacade;
    
    public class CCharacterSystem extends CSystem {
        public function CCharacterSystem(facade:CAppFacade) {
            super(facade);
        }
    }
}
