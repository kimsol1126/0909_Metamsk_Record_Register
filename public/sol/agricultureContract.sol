pragma solidity ^0.4.23;
pragma experimental ABIEncoderV2;

contract reportContract {

    uint8 numberOfProducts; // 총 제품의 수입니다.
    address contractOwner;

    struct myStruct {
        uint   report;
        string Name;
        string ID;
        uint timestamp;
    }

    myStruct[] public productes;

    constructor() public {        
        contractOwner = msg.sender;
    }

    function addProStru (uint _initNumber, string _firstString, string _secondString) public {
        productes.push(myStruct(_initNumber,_firstString,_secondString, now)) -1;
        numberOfProducts++;
    }   //성적 이름 학번 입력받아 구조체에 넣기

    //제품 등록의 수를 리턴합니다.
    function getNumOfProducts() public constant returns(uint8) {
        return numberOfProducts;
    }
    
    function getAllproducts() public view returns (myStruct[]) {
        return productes;
        
    }

    //번호에 해당하는 제품의 이름을 리턴합니다.
    function getProductStruct(uint _index) public view returns (uint, string, string, uint) {
        return (productes[_index].report, productes[_index].Name, productes[_index].ID, productes[_index].timestamp);
    }

    //컨트랙트를 삭제합니다.
    function killContract() public {
        if(contractOwner == msg.sender)
            selfdestruct(contractOwner);
    }
}