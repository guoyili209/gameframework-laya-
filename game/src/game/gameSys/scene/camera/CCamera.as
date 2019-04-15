package game.gameSys.scene.camera
{
    import game.gameSys.scene.camera.event.ECameraEventType;
    
    import laya.display.Sprite;
    import laya.display.Stage;
    import laya.maths.Point;
    import laya.utils.Dictionary;
    
    public final class CCamera
    {
        private var _stage:Stage;
        private var _stageContainer:Sprite;
        private var _focusPosition:Point;
        private var _focusTracker:Point;
        private var _focusOrientation:Point;
        private var _focusCurrentLoc:Point;
        private var _focusLastLoc:Point;
        private var _focusDistX:Number;
        private var _focusDistY:Number;
        private var _focusTarget:*;
        private var _layersInfo:Dictionary; // each object(layer) contains keys of 'name', 'instance', 'ratio'
        private var _boundaryLayer:Sprite;
        private var _switch:Boolean;
        
        private var _targetLastX:Number;
        private var _targetLastY:Number;
        private var _targetCurrentX:Number;
        private var _targetCurrentY:Number;
        
        private var _zoomFactor:Number;
        
        private var _intensity:Number;
        private var _shakeTimer:int;
        private var _shakeDecay:Number;
        
        public var trackStep:uint;
        public var swapStep:uint;
        public var zoomStep:uint;
        
        private var _tempStep:uint;
        private var _step:uint;
        
        public var ignoreLeftBound:Boolean;
        public var ignoreRightBound:Boolean;
        public var ignoreTopBound:Boolean;
        public var ignoreBottomBound:Boolean;
        
        public var isFocused:Boolean;
        public var isSwaping:Boolean;
        public var isZooming:Boolean;
        public var isShaking:Boolean;
        
        public var enableCallBack:Boolean;
        
        public function CCamera( aStage:Stage, aStageContainer:Sprite, aFocusTarget:*, aLayersInfo:Array, aAutoStart:Boolean = false )
        {
            _stage = aStage;
            _stageContainer = aStageContainer;
            _layersInfo = new Dictionary();
            
            focusTarget = aFocusTarget;
            
            _focusPosition = new Point();
            
            _focusTracker = new Point();
            _focusTracker.x = _focusTarget.x;
            _focusTracker.y = _focusTarget.y;
            
            _focusOrientation = new Point();
            _focusOrientation.x = _focusTarget.x;
            _focusOrientation.y = _focusTarget.y;
            
            _focusCurrentLoc = new Point(_focusTracker.x,_focusTracker.y);
            _focusLastLoc = new Point(_focusTracker.x,_focusTracker.y);
            
            for each( var obj:Object in aLayersInfo )
            {
                obj.ox = obj.instance.x;
                obj.oy = obj.instance.y;
                _layersInfo[obj.name] = obj;
            }
            
            _targetLastX = _targetCurrentX = focusTarget.x;
            _targetLastY = _targetCurrentY = focusTarget.y;
            
            // default step values, can be reset
            trackStep = 10;
            swapStep = 10;
            zoomStep = 10;
            
            _step = trackStep;
            _tempStep = trackStep;
            
            // default zoom factor
            _zoomFactor = _stageContainer.scaleX;
            
            // default focus is at the stage center
            setFocusPosition( _stage.designWidth*.5, _stage.designHeight*.5 );
            
            // by default, the stage boundary is not set
            setBoundary();
            
            if( aAutoStart ) start();
            else pause();
        }
        
        public function set focusTarget( aFocusTarget:* ):void
        {
            _focusTarget = aFocusTarget;
        }
        
        public function get focusTarget():*
        {
            return _focusTarget;
        }
        
        public function get zoomFactor():Number
        {
            return _zoomFactor;
        }
        
        private function get focusDist():Object
        {
            return {distX:_focusCurrentLoc.x-_focusLastLoc.x, distY:_focusCurrentLoc.y-_focusLastLoc.y};
        }
        
        private function get globalTrackerLoc():Point
        {
            var loc:Point;
            
            if( _focusTarget is Point ) loc = _stageContainer.localToGlobal( _focusTracker );
            else if( _focusTarget is Sprite ) loc = _focusTarget.parent.localToGlobal( _focusTracker );
            
            return loc;
        }
        
        public function getLayerByName( aName:String ):Sprite
        {
            return _layersInfo[aName].instance;
        }
        
        public function start():void
        {
            _switch = true;
        }
        
        public function pause():void
        {
            _switch = false;
        }
        
        public function destroy():void
        {
            _stage = null;
            _stageContainer = null;
            _boundaryLayer = null;
            _layersInfo = null;
            focusTarget = null;
        }
        
        public function setFocusPosition( aX:Number, aY:Number ):void
        {
            _focusPosition.x = aX;
            _focusPosition.y = aY;
        }
        
        public function setBoundary( aLayer:Sprite = null ):void
        {
            _boundaryLayer = aLayer;
        }
        
        public function jumpToFocus( aFocusTarget:* = null ):void
        {
            if( aFocusTarget == null ) aFocusTarget = _focusTarget;
            _focusCurrentLoc.x = _focusLastLoc.x = _focusTracker.x = _focusTarget.x;
            _focusCurrentLoc.y = _focusLastLoc.y = _focusTracker.y = _focusTarget.y;
            swapFocus( aFocusTarget, 1 );
        }
        
        public function swapFocus( aFocusTarget:*, aSwapStep:uint = 10, aZoom:Boolean = false, aZoomFactor:Number = 1, aZoomStep:int = 10 ):void
        {
            _focusTarget = aFocusTarget;
            
            swapStep = Math.max(1,aSwapStep);
            _tempStep = trackStep;
            _step = swapStep;
            
            isSwaping = true;
            if( enableCallBack ) _stage.event( ECameraEventType.SWAP_STARTED );
            
            if( aZoom ) zoomFocus( aZoomFactor, aZoomStep );
        }
        
        public function zoomFocus( aZoomFactor:Number, aZoomStep:uint = 10 ):void
        {
            _zoomFactor = Math.max(0,aZoomFactor);
            
            zoomStep = Math.max(1,aZoomStep);
            
            isZooming = true;
            
            if( enableCallBack ) _stage.event( ECameraEventType.ZOOM_STARTED );
        }
        
        public function shake( aIntensity:Number, aShakeTimer:int ):void
        {
            _intensity = aIntensity;
            _shakeTimer = aShakeTimer;
            _shakeDecay = aIntensity/aShakeTimer;
            
            isShaking = true;
            
            if( enableCallBack ) _stage.event( ECameraEventType.SHAKE_STARTED );
        }
        
        public function update():void
        {
            // if paused then ignore the following code
            if( !_switch ) return;
            
            // if focusTarget is set to null or not existing event stage, ignore the following code
            if( _focusTarget == null ) return;
            if( _focusTarget is Sprite && _focusTarget.parent == null ) return;
            
            // detect if it is tracking behind(or swaping to) the focus target
            if( Math.round((_focusTarget.x-_focusTracker.x)*(_focusTarget.y-_focusTracker.y)) == 0 )
            {
                _tempStep = trackStep;
                _step = _tempStep;
                
                _focusTracker.x = _focusTarget.x;
                _focusTracker.y = _focusTarget.y;
                
                if( isSwaping )
                {
                    isSwaping = false;
                    if( enableCallBack ) _stage.event( ECameraEventType.SWAP_FINISHED );
                }
                
                isFocused = true;
            }
            else
            {
                isFocused = false;
            }
            
            // update the location of the focusTracker
            _focusTracker.x += (_focusTarget.x-_focusTracker.x)/_step;
            _focusTracker.y += (_focusTarget.y-_focusTracker.y)/_step;
            
            // update the current and last tracking location
            _focusLastLoc.x = _focusCurrentLoc.x;
            _focusLastLoc.y = _focusCurrentLoc.y;
            _focusCurrentLoc.x = _focusTracker.x;
            _focusCurrentLoc.y = _focusTracker.y;
            
            // update the location of the focus target
            _targetLastX = _targetCurrentX;
            _targetLastY = _targetCurrentY;
            _targetCurrentX = focusTarget.x;
            _targetCurrentY = focusTarget.y;
            
            if( isZooming )
            {
                _stageContainer.scaleX += (_zoomFactor-_stageContainer.scaleX)/zoomStep;
                _stageContainer.scaleY += (_zoomFactor-_stageContainer.scaleY)/zoomStep;
                
                // detect if zooming finished
                if( Math.abs(_stageContainer.scaleX - _zoomFactor) < .01 )
                {
                    isZooming = false;
                    _stageContainer.scaleX = _stageContainer.scaleY = _zoomFactor;
                    if( enableCallBack ) _stage.event( ECameraEventType.ZOOM_FINISHED );
                }
            }
            
            // nudge stage-container
            _positionStageContainer();
            var testResult:Object = testBounds();
            
            // adjust parallax layers
            positionParallax( testResult );
            
            // shake
            if( isShaking )
            {
                if( _shakeTimer > 0 )
                {
                    _shakeTimer --;
                    
                    if( _shakeTimer <= 0 )
                    {
                        _shakeTimer = 0;
                        isShaking = false;
                        
                        if( enableCallBack ) _stage.event( ECameraEventType.SHAKE_FINISHED );
                    }
                    else
                    {
                        _intensity -= _shakeDecay;
                        
                        _stageContainer.x += _intensity * _stage.designWidth*(Math.random()*2-1);
                        _stageContainer.y += _intensity * _stage.designHeight*(Math.random()*2-1);
                    }
                }
            }
        }
        
        private function testBounds():Object
        {
            var testResult:Object = {top:false,bottom:false,left:false,right:false};
            
            if( _boundaryLayer == null ) return testResult;
            
            var stageBoundaryUpperLeft:Point = Sprite(_boundaryLayer.parent).localToGlobal( new Point(_boundaryLayer.x,_boundaryLayer.y) );
            var stageBoundaryLowerRight:Point = Sprite(_boundaryLayer.parent).localToGlobal( new Point(_boundaryLayer.x+_boundaryLayer.width,_boundaryLayer.y+_boundaryLayer.height));
            var boundLeft:Number = stageBoundaryUpperLeft.x;
            var boundTop:Number = stageBoundaryUpperLeft.y;
            var boundRight:Number = stageBoundaryLowerRight.x;
            var boundBottom:Number = stageBoundaryLowerRight.y;
            
            //trace( 'left:'+boundLeft+',right:'+boundRight+',up:'+boundUp+',down:'+boundDown );
            
            if( boundLeft > 0 )
            {
                if( !ignoreLeftBound )
                {
                    _stageContainer.x += 0-boundLeft;
                }
                
                if( enableCallBack )
                {
                    _stage.event( ECameraEventType.HIT_BOUNDARY,"left" );
                }
                
                testResult.left = true;
            }
            if( boundRight < _stage.designWidth )
            {
                if( !ignoreRightBound )
                {
                    _stageContainer.x += _stage.designWidth-boundRight;
                }
                
                if( enableCallBack )
                {
                    _stage.event( ECameraEventType.HIT_BOUNDARY,"right" );
                }
                
                testResult.right = true;
            }
            
            if( boundTop > 0 )
            {
                if( !ignoreTopBound )
                {
                    _stageContainer.y += 0-boundTop;
                }
                
                if( enableCallBack )
                {
                    _stage.event( ECameraEventType.HIT_BOUNDARY ,"top" );
                }
                
                testResult.top = true;
            }
            if( boundBottom < _stage.designHeight )
            {
                if( !ignoreBottomBound )
                {
                    _stageContainer.y += _stage.designHeight-boundBottom;
                }
                
                if( enableCallBack )
                {
                    _stage.event( ECameraEventType.HIT_BOUNDARY,"bottom");
                }
                
                testResult.bottom = true;
            }
            
            return testResult;
        }
        
        private function _positionStageContainer():void
        {
            _stageContainer.x += _focusPosition.x - globalTrackerLoc.x;
            _stageContainer.y += _focusPosition.y - globalTrackerLoc.y;
        }
        //视差
        private function positionParallax( aTestResult:Object ):void
        {
            var testResult:Object = aTestResult;
            var layer:Sprite;
            var layerOX:Number;
            var layerOY:Number;
            var ratio:Number;
            
            for each( var value:Object in _layersInfo )
            {
                layer = value.instance;
                layerOX = value.ox;
                layerOY = value.oy;
                ratio = value.ratio;
                
                var distX:Number = (_focusCurrentLoc.x-_focusOrientation.x)*ratio;
                var distY:Number = (_focusCurrentLoc.y-_focusOrientation.y)*ratio;
                if( (!testResult.left && distX < 0 ) || (!testResult.right && distX > 0 ) ) layer.x = layerOX + distX;
                if( (!testResult.top && distY < 0 ) || (!testResult.bottom && distY > 0 ) ) layer.y = layerOY + distY;
            }
        }
    }
}