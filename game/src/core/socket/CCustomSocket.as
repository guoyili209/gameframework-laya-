package core.socket {
    import laya.events.Event;
    import laya.net.Socket;
    import laya.utils.Byte;
    
    public class CCustomSocket extends Socket {
        public function CCustomSocket(host:String = null, port:int = 0, byteClass:Class = null) {
            super(host, port, byteClass);
            this,endian = Socket.BIG_ENDIAN;
        }
        
        private function _init():void{
            this.on(Event.OPEN,this,_openHandler);
            this.on(Event.MESSAGE,this,_receiveHandler);
            this.on(Event.CLOSE,this,_closeHandler);
            this.on(Event.ERROR,this,_errorHandler);
        }
        
        private function _openHandler(e:Object = null):void{
        
        }
        
        private function _receiveHandler(e:Object = null):void{
            if(e is String){
                console.log(e);
            }else if(e is ArrayBuffer){
                var byte:Byte = new Byte();
                byte.writeArrayBuffer(e as ArrayBuffer);
                _pCashDataArray.push(byte);
                if(_bReadDataFlag == false){
                    _bReadDataFlag = true;
                    _handleCashData();
                    _bReadDataFlag = false;
                }
            }
        }
        
        private function _closeHandler(e:Object = null):void{
        
        }
        
        private function _errorHandler(e:Object = null):void{
        
        }
        /**
         * 粘包拆包逻辑
         * 1、查看当前缓存数据对象中，是否有缓存数据；
         * 2、将新收到的缓存数据，写入到缓存的数据末尾；
         * 3、判定是否已经读取过数据长度，并且组合后的数据字节数是否大于头部字节数（数据长度+命令）
         * 4、如果没有读取过数据长度或者字节数比头部小，则继续缓存
         * 5、否则如果没有读取过数据长度，根据约定的数据格式，读取长度
         * 6、判断长度和实际字节数是否相同；
         * 7、如果实际字节数少，则缓存起来；
         * 8、否则根据约定的长度，从0位置处读取此长度的数据，并进行解析；
         * 9、判断是否存在超出长度的字节数，进行拆包处理
         * 10、递归执行上述步骤
         * */
        private function _handleCashData():void{
            if(_pCashDataArray.length<=0){
                return;
            }
            var byte:Byte = _pCashDataArray.shift();
            byte.pos = 0;
            if(_pCashData&&_pCashData.bytesAvailable>0){
                _pCashData.pos = _pCashData.length;
                _pCashData.writeArrayBuffer(byte.buffer);
                byte = _pCashData;
            }
            if(_iContentLen==0&&byte.bytesAvailable<MSG_HEAD){
                if(!_pCashData){
                    _pCashData = new Byte();
                }
                _pCashData.pos = _pCashData.length;
                _pCashData.writeArrayBuffer(byte.buffer);
                _handleCashData();
            }else{
                _getBytes(byte);
            }
        }
        
        private function _getBytes(byte:Byte):void{
            byte.pos = 0;
            if(_iContentLen==0){
                _iContentLen = byte.getUint32();
            }
            if(_iContentLen<byte.bytesAvailable-4){
                if(!_pCashData){
                    _pCashData = new Byte();
                }
                _pCashData.pos = _pCashData.length;
                _pCashData.writeArrayBuffer(byte.buffer);
                _handleCashData();
            }else {
                var temp:Byte = new Byte();
                temp.writeArrayBuffer(byte.buffer,0,_iContentLen);
                temp.pos = 0;
                _reciveData(temp);
                _iContentLen = 0;
                var overPlusByte:Byte = new Byte();
                overPlusByte.writeArrayBuffer(byte.buffer,_iContentLen);
                if(overPlusByte.bytesAvailable>MSG_HEAD){
                    _getBytes(overPlusByte);
                }else{
                    if(overPlusByte.bytesAvailable>0){
                        if(_pCashData==null){
                            _pCashData = new Byte();
                        }
                        _pCashData.pos = _pCashData.length;
                        _pCashData.writeArrayBuffer(overPlusByte.buffer);
                    }
                   _handleCashData();
                }
            }
        }
        
        private function _reciveData(byte:Byte):void{
            var len:int = byte.getUint32();
            var cmd:int = byte.getUint16();
            //解析数据
            byte.bytesAvailable;
        }
    
        public function sendCMDData(cmd:uint, data:* = null) : void
        {

        }
        
        public function registerSocketMsg(cmd:int,callBackFunc:Function):void{
        
        }
        
        private var _pCashDataArray:Vector.<Byte> = new Vector.<Byte>();
        private var _pCashData:Byte = null;
        private var _iContentLen:int = 0;
        private var _bReadDataFlag:Boolean = false;
        private const MSG_HEAD:int = 6;
    }
}
