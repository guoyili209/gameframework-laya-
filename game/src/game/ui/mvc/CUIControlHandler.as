package game.ui.mvc {
    import core.ecs.CSystem;
    import core.mvc.CController;
    
    import game.ui.mvc.CUIModelHandler;
    
    public class CUIControlHandler extends CController {
        public function CUIControlHandler(system:CSystem) {
            super(system);
        }
        
        override protected function init():void{
        
        }
        
        override protected function registerSocket():void{
            var model:CUIModelHandler = system.getBean(CUIModelHandler) as CUIModelHandler;
            model.setData(null);
        }
        
        public function sendData():void{
            socket.sendData(null);
        }
    }
}
