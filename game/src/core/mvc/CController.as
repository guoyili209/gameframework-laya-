package core.mvc {
    import core.ecs.CSystem;
    import core.socket.CCustomSocket;
    
    public class CController {
        protected var socket:CCustomSocket = null;
        protected var system:CSystem = null;
        public function CController(system:CSystem) {
            this.system = system;
            socket = system.facade.socket;
            init();
            registerSocket();
        }
        
        protected function init():void{
        
        }
        
        protected function registerSocket():void{
        
        }
    }
}
