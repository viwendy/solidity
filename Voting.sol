// SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
/**
 * 创建一个名为Voting的合约，包含以下功能：
    一个mapping来存储候选人的得票数
    一个vote函数，允许用户投票给某个候选人
    一个getVotes函数，返回某个候选人的得票数
    一个resetVotes函数，重置所有候选人的得票数
 */
contract Voting  {
    
    mapping (string => uint) userMap;
    string[] userArr;
    address owner;

    constructor(){
        owner = msg.sender;
    }

    function vote(string memory user) public {
        userArr.push(user);
        userMap[user]++;
    }

    function getVotes(string memory user) public view returns (uint) {
        return userMap[user];
    }

    function getUserArr() public view returns (string[] memory) {
        return userArr;
    }

    function resetVotes() public {
        require(msg.sender == owner, "no permisson");
        for (uint i = 0; i < userArr.length; i++) {
            delete (userMap[userArr[i]]);
        }
        delete userArr;
    }

}