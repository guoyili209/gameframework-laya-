package game.gameSys.log {
    import core.ecs.CSystem;
    import core.tool.log.CDashBoard;
    
    import game.CAppFacade;
    
    import laya.display.Sprite;
    
    public class CLogSystem extends CSystem {
        public function CLogSystem(facade:CAppFacade) {
            super(facade);
        }
        
        override protected function _init():void{
            var logLayer:Sprite = facade.appStage.logLayer;
            addBean(new CDashBoard(logLayer));
        }
        
        public function traceMsg(msg:String):void{
        
        }
        
        public function normalMsg(msg:String):void{
        
        }
        
        public function warningMsg(msg:String):void{
        
        }
        
        public function errorMsg(msg:String):void{
        
        }
    }
    
}
