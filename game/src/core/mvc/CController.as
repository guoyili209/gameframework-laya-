package core.mvc {
    import core.ecs.CSystem;
    import core.socket.CCustomSocket;
    
    public class CController {
        protected var _socket:CCustomSocket = null;
        protected var _system:CSystem = null;
        public function CController(system:CSystem) {
            this._system = system;
            _socket = system.facade.socket;
            init();
            registerSocket();
        }
        
        protected function init():void{
        
        }
        
        protected function registerSocket():void{
        
        }
        
        public function sendCMDData(cmd:int,data:Object):void{
        
        }
    }
}
