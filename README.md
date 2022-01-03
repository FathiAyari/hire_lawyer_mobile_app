for(int j=i+1;j<msg.length;j++){
if((msg[i]["getSender"]==msg[j]["getSender"]) && (msg[i]["getDestination"]==msg[j]["getDestination"])){
msg[j]={
'getText':'12',
'getSender':'',
'getDestination':'',
};

                           }
                         }
                         if(msg[i]["getSender"]==""){
                           print("dd");
                           i--;
                         }