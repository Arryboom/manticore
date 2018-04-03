contract Reachable {
    uint storage_variable;

    function entry(uint input) {
        storage_variable = 0x585858;
        //this.write_then_throw();
        this.call.gas(10000).value(msg.value)(bytes4(sha3("function write_then_throw()")));

        if (storage_variable == 0x585858){
            assembly {
               jump ( 0x4141414141414141414141414141414141414141 )
            }
        }
        else{ 
            assembly {
               jump ( 0x4242424242424242424242424242424242424242 )
            }
        }
           
    }

    function write_then_throw() {
        storage_variable = 120;
        throw;
    }

}