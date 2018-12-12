package game.table {
    import core.ecs.CSystem;
    
    import game.CAppFacade;
    
    import laya.utils.Dictionary;
    
    public class CTableBaseSystem extends CSystem {
        public function CTableBaseSystem(facade:CAppFacade) {
            super(facade);
            _init();
        }
        
        protected function _init():void{
            _tableDic = new Dictionary();
            addBean(new CTableData());
            _initComplete();
        }
        
        private function _initComplete():void{
            var str:String = Laya.loader.getRes(ETableName.demo);
            var arr:Array = str.split("\r\n");
            var keyStr:String = arr[1];
            var arrKey:Array = keyStr.split(",");
            var keyLen:int = arrKey.length;
            var dataLen:int=arr.length-1;
            var dataObjArr:Array = [];
            for(var i:int=2;i<dataLen;i++){
                var dataStr:String = arr[i];
                var dataArr:Array = dataStr.split(",");
                var obj:Object = {};
                for(var j:int=0;j<keyLen;j++){
                    var value:String = dataArr[j];
                    var key:String = arrKey[j];
                    obj[key] = value;
                }
                dataObjArr.push(obj);
            }
            _tableDic.set(ETableName.demo,dataObjArr);
        }
        
        public function getTable(tableName:String):CTableData{
            return _tableDic.get(tableName);
        }
        private var _tableDic:Dictionary = null;
    }
}
