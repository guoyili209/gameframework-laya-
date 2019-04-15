package game.uiSys.sign.control {
    import core.ecs.CSystem;
    
    import game.uiSys.root.mvc.CUIControl;
    import game.uiSys.sign.model.CSignModelHandler;
    
    public class CSignControlHandler extends CUIControl {
        public function CSignControlHandler(system:CSystem) {
            super(system);
        }
        
        override public function sendCMDData(cmd:int,data:Object):void{
//            _socket.sendCMDData();
        }
        
        override protected function registerSocket():void{
            _socket.registerSocketMsg(123,callbackfunc);
        }
        
        private function callbackfunc():void{
            var model:CSignModelHandler = _system.getBean(CSignModelHandler) as CSignModelHandler;
            model.setData(null);
        }
    }
}
