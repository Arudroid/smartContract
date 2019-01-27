pragma solidity ^0.5.0;
contract Permission{
    
    struct Perm{
        mapping(address => bool) allowed;
    }
    mapping (address =>  Perm) permissions;
    address[] public permissionList;
    
    function setPermission(address _address) public returns (bool){
        //var permission = permissions[_address];
        permissions[_address].allowed[msg.sender] = true;
        
        permissionList.push(_address) -1;
        return true;
    }
    
    function getPermission() public  returns (bool){
         //var permission = permissions[msg.sender];
         permissions[msg.sender].allowed[msg.sender] = true;
         
         permissionList.push(msg.sender) -1;
    }
    
    function permissionLists() public view returns (address[] memory){
        return permissionList;
    }
    
    function hasPermission() public view returns (bool){
        if(permissions[msg.sender].allowed[msg.sender])
            return true;
        return false;
    }
    
    function hasPermission(address _address) public view returns (bool){
        if(permissions[msg.sender].allowed[_address])
            return true;
        return false;
    }
    
    
}
