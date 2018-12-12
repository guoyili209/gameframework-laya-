package {
    import game.CAppFacade;
    
    public class CGameLoop {
        public function CGameLoop() {
            _appFacade = new CAppFacade();
            _appFacade.initSystem();
            Laya.timer.frameLoop(1,this,_loop);
        }
        
        private function _loop():void{
            if(!_appFacade.bPause)return;
            var now:Number = _now();
            _nDeltaTime = (now - _nLastTime) * _iScaleTime;
            this._nCurrTime = this._nCurrTime + _nDeltaTime;
            _nLastTime = now;
            //执行游戏客户端tick逻辑
            _appFacade.update(_nDeltaTime);
        }
        
        private function _now():Number{
            return __JS__('Date.now()');
        }
        
        public function get clientRunElapsedTime():Number{
            return _nCurrTime - _nBeginTime;
        }
        
        private var _nDeltaTime:Number = 0;
        private var _nLastTime:Number = _now();
        private var _iScaleTime:int = 1;
        private var _nCurrTime:Number = _now();
        private var _nBeginTime:Number = _now();
        private var _appFacade:CAppFacade = null;
    }
}
